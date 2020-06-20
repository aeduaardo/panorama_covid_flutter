import 'package:flutter/material.dart';

class InfoDataPage extends StatefulWidget {
  final String title;
  const InfoDataPage({Key key, this.title = "Sobre os dados"})
      : super(key: key);

  @override
  _InfoDataPageState createState() => _InfoDataPageState();
}

class _InfoDataPageState extends State<InfoDataPage> {
  @override
  Widget build(BuildContext context) {
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

    Widget createText(String title, String text,
        {IconData icon, bool national = false}) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: _textBoldStyle(
                      percentSize: 4.5, max: 20.0, color: Colors.black),
                ),
                SizedBox(
                  width: 10.0,
                ),
                national
                    ? Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/flag_brazil.png'))),
                      )
                    : Icon(
                        icon,
                        color: Colors.red,
                        size: 25.0,
                      )
              ],
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.justify,
            style: _textNormalStyle(
                percentSize: 4.5, max: 18.0, color: Colors.black),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              child: Column(
                children: <Widget>[
                  createText('PANORAMA NACIONAL',
                      'As informações apresentadas no “Panorama Nacional” são dados oficiais publicados pelo Ministério da Saúde. Assim, se comparada com outras fontes poderá haver divergência de valores.',
                      national: true),
                  createText('PANORAMA MUNDIAL',
                      'O “Panorama Mundial” é resultado da reunião de informações oriundas de fontes diversas. Sendo assim, os números exibidos para o Brasil nessa página podem diferir com relação àqueles apresentados no “Panorama Nacional”, cujas informações são baseadas puramente no Ministério da Saúde. Analogamente, os dados para os demais países não são tratados como oficiais.',
                      icon: Icons.language),
                  createText('POP. INFECTADA',
                      'Esta não é uma informação oficial e os valores apresentados são de responsabilidade dos idealizadores do projeto. No “Panorama Nacional” a POP. INFECTADA foi calculada a partir de estimativas populacionais dos estados brasileiros para o ano de 2019. Para o “Panorama Mundial” o percentual foi obtido com base na população mundial, fixada em 7.79 bilhões, e o índice de cada país foi calculado com base em informações coletadas a partir de diferentes fontes. Tendo em vista que os dados populacioais variam devido à muitos fatores POP. INFECTADA não é um dado preciso e trata-se apenas de uma estimativa.',
                      icon: Icons.date_range),
                  Divider(color: Colors.transparent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
