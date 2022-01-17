//paquetes necesarios para conectarme a la base de datos
// por ahora se hace con un archivo json
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )
    );
  }
}

class Cupon{
  final String nombre;
  //final String local;
  //final String fecha;
  //final String beneficios;
  //final String codigo;
  
  Cupon({this.nombre});
  factory Cupon.fromJson(Map<String, dynamic> json){
    return Cupon(
      nombre: json["Cupones"][1]["Nombre"]
      //local : json[''],
      //fecha: json[''],
      //beneficios: json[''],
      //codigo: json['']
    );
  }

}


