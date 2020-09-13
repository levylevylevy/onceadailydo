import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// The screen that displays information about how long and when a user has completed activities.
/// Shows them the number of days on their current streak, which is the number of days that they
/// have completed an activity in a row.
class StreaksScreen extends StatefulWidget {
  _StreaksScreenState createState() => _StreaksScreenState();
}

class _StreaksScreenState extends State<StreaksScreen> {
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
          child: ListView(
            children: <Widget>[
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
              TableCalendar(
                daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.white,), weekendStyle: TextStyle(color: Colors.white,),),
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayColor: Color(0xFF566575),
                  selectedColor: Colors.orange,
                  weekdayStyle: TextStyle(color: Colors.white,), 
                  weekendStyle: TextStyle(color: Colors.white,),
                  unavailableStyle: TextStyle(color: Colors.white,),
                  outsideWeekendStyle: TextStyle(color: Color(0xFF9E9E9E),),
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
      ),
    );
  }
}
