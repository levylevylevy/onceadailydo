import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


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





      body:SingleChildScrollView(
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
    );
  }
}