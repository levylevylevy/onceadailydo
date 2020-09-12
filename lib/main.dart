import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';

void main() => runApp(StreaksScreen());

class StreaksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _control;

  @override
  void initState() {
    super.initState();
    _control = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Streaks'),
      ),




body: Center(
  child: Column(
    children: <Widget>[
      Container(
        color: Color(0xFF797983),
        height: 270,
        width:600,
  ),
      Container(
        color: Color(0xFF566575),
        height: 50,
        width:600,
        child: new Text("My Calendar",
          style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFF5F5F5),
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
      ),

      Expanded(
    child: new Align(
    alignment: Alignment.bottomCenter,
    child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

    TableCalendar(
    initialCalendarFormat: CalendarFormat.month,
    calendarStyle: CalendarStyle(
    todayColor: Color(0xFF566575),
    selectedColor: Colors.orange,


    ),

    calendarController: _control,)
    ],
    ),
    ),
      )

],
  )


)
    );
  }
}
