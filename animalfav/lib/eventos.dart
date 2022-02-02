import 'package:flutter/cupertino.dart';
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
  TextEditingController horaFinalController = TextEditingController();
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
            'assets/images/calendario.png',
            height: 100.0,
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
          Text("Eventos Guardados"),
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
            if (nombreController.text == "" ||
                fechaInicioController.text == "" ||
                fechaFinalController.text == "" ||
                horaInicioController.text == "" ||
                fechaFinalController.text == "") {
              _showToast(context, "Datos en Blanco");
            } else {
              _confirmacionEvento(context);
            }
          });
    });
  }

  Future<void> _confirmacionEvento(BuildContext context) async {
    return showCupertinoDialog<void>(
      context: context,
      builder: (_) => _buildAlertDialog(),
    );
  }

  Widget nombreTextField() {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(hintText: 'nombre del evento'),
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
          controller: horaFinalController,
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

  Widget _buildAlertDialog() {
    return AlertDialog(
        title: Text('Guardar Evento'),
        content: Text("Desea guardar el evento actual?"),
        actions: <Widget>[
          FlatButton(
              child: Text("Aceptar"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
                EventoGuardado();
                _showToast(context, "Evento Guardado");
              }),
          FlatButton(
              child: Text("Cancelar"),
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ]);
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Widget _EventoText(BuildContext context) {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapShot) {
      return Column(
        children: [
          Text("Nombre del evento: " + nombreController.text),
          Text("Ubicacion: " + UbicacionController.text),
          Text("Hora de Inicio: " + horaInicioController.text),
          Text("Hora Final: " + horaFinalController.text),
          Text("Fecha de Inicio: " + fechaInicioController.text),
          Text("Fecha Final: " + fechaFinalController.text)
        ],
      );
    });
  }

  void EventoGuardado() {
    _EventoText(context);
  }
}
