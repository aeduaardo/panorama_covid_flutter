import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mobileSizes = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: mobileSizes.height * 0.20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/newLogo.png',
                  width: mobileSizes.width * 0.50,
                  height: mobileSizes.hashCode * 0.40,
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          createItem('Sobre os dados', Icons.info, () {
            Modular.to.pushNamed('/info');
          }),
          createItem('Sair', Icons.exit_to_app, () {
            SystemNavigator.pop();
          }),
        ],
      ),
    );
  }
}

Widget createItem(String title, IconData icon, Function function) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 18.0, color: Colors.red[900]),
    ),
    leading: Icon(
      icon,
      color: Colors.red[900],
    ),
    onTap: () {
      function();
    },
  );
}
