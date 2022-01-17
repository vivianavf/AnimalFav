//paquetes necesarios para conectarme a la base de datos
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

Future<Persona> fetchPost() async{
  final responde = await http.get("");
  if(responde.statusCode==200){
    return Cupon.fromJson(json.decode(response.body));
  }else{
    throw Exception("Fallo de conexion");
  }
}

//clase cupon con sus atributos
class Cupon{
  final String nombre;
  //final String local;
  //final String fecha;
  //final String beneficios;
  //final String codigo;
  
  Cupon({this.nombre});

  //Transforma de JSon a objeto cupon
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


