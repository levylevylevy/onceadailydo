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
    return MainHeaderAndNavigation(
        title: 'Activity Streaks',
        child: Container(
          child: Center(
              child: Column(children: <Widget>[
            Container(
              color: Color(0xFF797983),
              height: 184,
              width: 600,
              child: new Text(
                'current streak:'
                '\n10 days',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Color(0xFFF5F5F5),
                ),
              ),
              alignment: Alignment.center,
            ),
            Container(
              color: Color(0xFF566575),
              height: 40,
              width: 600,
              alignment: AlignmentDirectional(0.0, 0.0),
              child: new Text(
                "My Calendar",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ),
            Expanded(
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TableCalendar(
                      initialCalendarFormat: CalendarFormat.month,
                      calendarStyle: CalendarStyle(
                        todayColor: Color(0xFF566575),
                        selectedColor: Colors.orange,
                      ),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Color(0xff797983),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonShowsNext: false,
                      ),
                      calendarController: _control,
                    )
                  ],
                ),
              ),
            )
          ])),
        ));
  }
}
