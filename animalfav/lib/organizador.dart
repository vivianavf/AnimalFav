import 'package:flutter/material.dart';
import 'package:g_simple_calendar/g_simple_calendar.dart';
import 'package:g_simple_calendar/gCellButton.dart';
import 'package:g_simple_calendar/gCustomButtonModel.dart';
import 'package:intl/date_symbol_data_local.dart';

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
          child: Column(
        children: [
          Text(
            'Hello! How are you?',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          calendario(context),
        ],
      )),
    );
  }

  Widget calendario(BuildContext context) {
    var custom = <GCustomButtonModel>[];
    String title = 'title';
    custom.add(GCustomButtonModel(number: 12, fillColor: Colors.yellow));

    custom.add(
        GCustomButtonModel(number: 22, fillColor: Colors.blue, enable: false));

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: GSimpleCalendar(date: DateTime.now(), customButtons: custom),
    );
  }
}
