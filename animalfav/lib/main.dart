import 'package:flutter/material.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimalFAV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )
      initialRoute: organizadorPage.id,
      ),
      initialRoute: menuPage.id,
      routes: {
        menuPage.id: (context) => menuPage(),
      },
    );
  }
}
