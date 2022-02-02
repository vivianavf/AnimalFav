import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:googleapis/adsense/v1_4.dart';

class eventosPage extends StatefulWidget {
  static String id = 'OrganizadordeEventos';

  @override
  _eventosPageState createState() => _eventosPageState();
}

class _eventosPageState extends State<eventosPage> {
  String nombreEvento = '';
  String fechaInicio = '';
  String horaFinal = '';
  String horaInicio = '';
  String fechaFinal = '';
  String Ubicacion = '';
  TextEditingController nombreController = TextEditingController();
  TextEditingController fechaInicioController = TextEditingController();
  TextEditingController horaFinalFController = TextEditingController();
  TextEditingController horaInicioController = TextEditingController();
  TextEditingController fechaFinalController = TextEditingController();
  TextEditingController UbicacionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset(
            'assets/images/calendario.png',height: 100.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          nombreTextField(),
          SizedBox(
            height: 15.0,
          ),
          HoraInicioTextField(),
          SizedBox(
            height: 15.0,
          ),
          HoraFinalTextField(),
          SizedBox(
            height: 15.0,
          ),
          FechaInicioTextField(),
          SizedBox(
            height: 15.0,
          ),
          FechaFinalTextField(),
          SizedBox(
            height: 15.0,
          ),
          UbicacionTextField(),
          SizedBox(
            height: 15.0,
          ),
          bottonCrearEvento(),
          SizedBox(
            height: 15.0,
          ),
        ],
      )),
    );
  }

  Widget bottonCrearEvento() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Organizar un Evento'),
          ),
          onPressed: () {
            AlertDialog(
              title: Text('Evento guardado'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [Text('Evento guardado')],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  void formularioEvento() {}

  Widget nombreTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'Nombre del evento'),
          onChanged: (text) {},
          controller: nombreController,
        ),
      );
    });
  }

  Widget HoraInicioTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'Hora de inicio'),
          onChanged: (text) {},
          controller: horaInicioController,
        ),
      );
    });
  }

  Widget FechaInicioTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'Fecha de inicio'),
          onChanged: (text) {},
          controller: fechaInicioController,
        ),
      );
    });
  }

  Widget FechaFinalTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'Fecha final'),
          onChanged: (text) {},
          controller: fechaFinalController,
        ),
      );
    });
  }

  Widget HoraFinalTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'Hora final'),
          onChanged: (text) {},
          controller: horaFinalFController,
        ),
      );
    });
  }

  Widget UbicacionTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'Ingresar Ubicacion'),
          onChanged: (text) {},
          controller: UbicacionController,
        ),
      );
    });
  }
}
