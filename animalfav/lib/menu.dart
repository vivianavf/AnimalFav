import 'package:flutter/material.dart';
import 'dart:js' as js;

class menuPage extends StatefulWidget {
  static String id = 'Menu';

  @override
  _menuPageState createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          bottonGeoLocate(),
          SizedBox(
            height: 15.0,
          ),
        ],
      )),
    );
  }

  Widget bottonGeoLocate() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Show my location'),
          ),
          onPressed: () {
            js.context.callMethod('iniciarMap');
          });
    });
  }
}
