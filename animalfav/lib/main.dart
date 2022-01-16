import 'package:flutter/material.dart';
import 'calendario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimalFAV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: calendarioPage.id,
      routes: {
        calendarioPage.id: (context) => calendarioPage(),
      },
    );
  }
}
