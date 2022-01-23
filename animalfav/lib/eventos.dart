import 'package:flutter/material.dart';
import 'dart:js' as js;

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
  TextEditingController nombreController = TextEditingController();
  TextEditingController fechaInicioController = TextEditingController();
  TextEditingController horaFinalFController = TextEditingController();
  TextEditingController horaInicioController = TextEditingController();
  TextEditingController fechaFinalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset(
            'assets/images/calendario.png',
          ),
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
            formularioEvento();
          });
    });
  }

  void formularioEvento() {}
}
