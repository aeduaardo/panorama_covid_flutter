import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidapp_flutter/app/modules/home/components/custom_drawer/custom_drawer_widget.dart';
import 'package:covidapp_flutter/app/shared/custom_icons.dart';
import 'components/custom_list/custom_list_widget.dart';
import 'home_controller.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double _getValue({double value, double max}) {
    if (value < max) {
      return value;
    } else {
      return max;
    }
  }

  TextStyle _textBoldStyle({double percentSize, double max, Color color}) {
    var fontSize = MediaQuery.of(context).size.width * (percentSize / 100);
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: _getValue(value: fontSize, max: max),
    );
  }

  TextStyle _textNormalStyle({double percentSize, double max, Color color}) {
    var fontSize = MediaQuery.of(context).size.width * (percentSize / 100);
    return TextStyle(
      color: color,
      fontSize: _getValue(value: fontSize, max: max),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _mobileDimension = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              return controller.currentIndex == 0
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'PANORAMA NACIONAL ',
                            style: _textBoldStyle(
                                percentSize: 4.5,
                                max: 20.0,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/flag_brazil.png'))),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'PANORAMA MUNDIAL ',
                              style: _textBoldStyle(
                                  percentSize: 4.5,
                                  max: 20.0,
                                  color: Colors.black),
                            ),
                          ),
                          Icon(
                            Icons.language,
                            color: Colors.red[900],
                            size: _getValue(
                                value: _mobileDimension.width * 0.055,
                                max: 25.0),
                          )
                        ]);
            },
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.red[900],
              size: _getValue(value: _mobileDimension.width * 0.055, max: 25.0),
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.red[900],
                  size: _getValue(
                      value: MediaQuery.of(context).size.width * 0.055,
                      max: 25.0),
                ),
                onPressed: () => controller.currentIndex == 0
                    ? controller.fetchData(false, refresh: true)
                    : controller.fetchData(true, refresh: true),
              ),
            ),
          ],
        ),
        drawer: CustomDrawerWidget(),
        body: Observer(
          builder: (_) {
            if (controller.data.error != null) {
              return Center(
                child: Text(
                    'Não foi possível carregador os dados. Tente novamente mais tarde;'),
              );
            } else if (controller.data.value == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text('Atualizando dados... Aguarde.'),
                ],
              );
            } else {
              var data = controller.data.value;
              return ListView.builder(
                itemCount: data.arrayData.length + 1,
                itemBuilder: (context, i) {
                  if (i == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              createCard(
                                _mobileDimension,
                                'CASOS CONFIRMADOS',
                                data.cases.toString(),
                                CustomIcons.viruses,
                                Colors.deepPurple[800],
                              ),
                              createCard(
                                _mobileDimension,
                                'MORTES CONFIRMADAS',
                                data.deaths.toString(),
                                CustomIcons.death,
                                Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              createCard(
                                _mobileDimension,
                                'RECUPERADOS',
                                data.recovered.toString(),
                                CustomIcons.health,
                                Colors.green[800],
                              ),
                              createCard(
                                _mobileDimension,
                                'POP. INFECTADA',
                                data.percentageInfected.toStringAsFixed(2) +
                                    '%',
                                CustomIcons.lungs_virus,
                                Colors.amber[800],
                                percent: true,
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.transparent),
                        data.date != ''
                            ? Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text('Atualizado em: ',
                                        style: _textBoldStyle(
                                            percentSize: 3, max: 15.0)),
                                    Text(data.date,
                                        style: _textNormalStyle(
                                            percentSize: 3.5, max: 15.0)),
                                  ],
                                ),
                              )
                            : Container(),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                controller.currentIndex == 0
                                    ? ' PANORAMA ESTADUAL'
                                    : 'RANKING COVID - TOP 20',
                                style: _textBoldStyle(
                                    percentSize: 4.5,
                                    max: 20.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: 5.0,
                        ),
                      ],
                    );
                  } else {
                    return CustomListWidget(
                        controller.data.value.arrayData[i - 1]);
                  }
                },
              );
            }
          },
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return BottomNavigationBar(
                elevation: 1.0,
                backgroundColor: Colors.grey[100],
                selectedItemColor: Colors.red[900],
                currentIndex: controller.currentIndex,
                onTap: (index) => controller.changePage(index),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.terrain,
                        size: _getValue(
                            value: MediaQuery.of(context).size.width * 0.06,
                            max: 25.0),
                      ),
                      title: Text(
                        'Panorama Nacional',
                        style: _textNormalStyle(
                            percentSize: 4,
                            max: 18.0), //TextStyle(fontSize: 16.0),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.language,
                        size: _getValue(
                            value: MediaQuery.of(context).size.width * 0.05,
                            max: 25.0),
                      ),
                      title: Text(
                        'Panorama Mundial',
                        style: _textNormalStyle(
                            percentSize: 4,
                            max: 18.0), // TextStyle(fontSize: 16.0),
                      ))
                ]);
          },
        ));
  }

  Widget createCard(
      Size size, String title, String value, IconData icon, Color color,
      {bool percent = false}) {
    final formatter = new NumberFormat("#,###", 'eu');
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 250,
          maxHeight: 150,
          minHeight: 90,
        ),
        child: Container(
          width: size.width * 0.45,
          height: size.height * 0.16,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        icon,
                        color: color,
                        size: _getValue(
                            value: MediaQuery.of(context).size.width * 0.07,
                            max: 25.0),
                      ),
                    )
                  ],
                ),
                Divider(height: 5.0, color: Colors.transparent),
                percent
                    ? Text(value,
                        style: _textBoldStyle(
                            percentSize: 7.0, max: 26, color: color))
                    : Text(formatter.format(int.parse(value)),
                        style: _textBoldStyle(
                            percentSize: 7.0, max: 26, color: color)),
                Divider(
                  height: 5.0,
                  color: Colors.transparent,
                ),
                Text(title,
                    style: _textNormalStyle(
                        percentSize: 3.5, max: 15, color: color)),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              )),
        ),
      ),
    );
  }
}
