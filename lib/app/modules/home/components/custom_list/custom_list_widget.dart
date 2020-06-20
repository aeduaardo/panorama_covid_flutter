import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:covidapp_flutter/app/models/data_model.dart';

class CustomListWidget extends StatelessWidget {
  final States data;
  const CustomListWidget(this.data);

  double _getValue({double value, double max}) {
    if (value < max) {
      return value;
    } else {
      return max;
    }
  }

  TextStyle _textBoldStyle({double fontSize, double max, Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: _getValue(value: fontSize, max: max),
    );
  }

  TextStyle _textNormalStyle({double fontSize, double max, Color color}) {
    return TextStyle(
      color: color,
      fontSize: _getValue(value: fontSize, max: max),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _mobileDimension = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 50.0,
                    maxWidth: 25.0,
                  ),
                  child: Container(
                    width: _mobileDimension.width * 0.07,
                    height: _mobileDimension.height * 0.03,
                    child: Image.network(
                      data.flag,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(data.name,
                    style: _textBoldStyle(
                        fontSize: _mobileDimension.width * 0.05, max: 22.0))
              ],
            ),
            Divider(color: Colors.transparent, height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                createCard('CASOS CONFIRMADOS', data.cases.toString(),
                    color: Colors.deepPurple[800], context: context),
                createCard('MORTES', data.deaths.toString(),
                    color: Colors.red, context: context),
                createCard(
                  'POP. INFECTADA',
                  data.percentageInfected.toStringAsFixed(2) + '%',
                  color: Colors.amber[900],
                  percent: true,
                  context: context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget createCard(String title, String value,
      {Color color = Colors.black, percent = false, BuildContext context}) {
    final formatter = new NumberFormat("#,###", 'eu');
    var _mobileDimension = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title,
            style: _textNormalStyle(
                fontSize: _mobileDimension * 0.035, max: 15.0)),
        Divider(
          height: 5.0,
          color: Colors.transparent,
        ),
        percent
            ? Text(value,
                style: _textBoldStyle(
                    fontSize: _mobileDimension * 0.06, max: 18.0, color: color))
            : Text(
                formatter.format(int.parse(value)),
                style: _textBoldStyle(
                    fontSize: _mobileDimension * 0.05, max: 22.0, color: color),
              ),
      ],
    );
  }
}
