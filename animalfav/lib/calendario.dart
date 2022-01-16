import 'package:flutter/material.dart';

class calendarioPage extends StatefulWidget {
  static String id = 'calendario';

  @override
  _calendarioPageState createState() => _calendarioPageState();
}

class _calendarioPageState extends State<calendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Hello! How are you?',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ));
  }
}
