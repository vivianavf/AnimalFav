//Ventana donde muestra el detalle de cada cupon

import 'package:animalfav/cuponResources/cupon.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class cuponDetail extends StatelessWidget{
  final Cupon cupon;
  const cuponDetail({Key? key, required this.cupon}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(cupon.nombre),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Aprovecha la promoción!'),
          Text(cupon.local),
          Text(cupon.beneficio),
          Text(cupon.fecha),
          Text(cupon.codigo),
          Text(cupon.categoria),
          Scratcher(
            brushSize: 40,
            color: Colors.blueGrey,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cupon.codigo,
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.black
                  ),),
              ],),              
              //Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(cupon.codigo.toString())),
              )
          )
        ],
      ),
    );
  }

}