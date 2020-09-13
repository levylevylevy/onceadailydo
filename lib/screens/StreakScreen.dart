import 'dart:convert';

import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:HopHacks/models/Activity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

/// The screen that displays information about how long and when a user has completed activities.
/// Shows them the number of days on their current streak, which is the number of days that they
/// have completed an activity in a row.
class StreaksScreen extends StatefulWidget {
  _StreaksScreenState createState() => _StreaksScreenState();
}

class _StreaksScreenState extends State<StreaksScreen> {
  CalendarController _control;
  Map<DateTime, List<dynamic>> _events;
  List _selectedEvents;
  List todaysEvents;

  void _loadFromLocalStorage() async {
    var pref = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String eventToday = pref.getString(DateTime(now.year, now.month, now.day).toString());
    this.todaysEvents.add(Activity.fromJson(json.decode(eventToday)).title);

    print(eventToday);
  }

  @override
  void initState() {
    super.initState();
    _control = CalendarController();
    this._selectedEvents = [];
    var _selectedDay = DateTime.now();
    this._events = {
      _selectedDay.subtract(Duration(days: 30)): ['Cleaning Up the Park'],
      _selectedDay.subtract(Duration(days: 27)): ['Volunteering at the Community Center'],
      _selectedDay.subtract(Duration(days: 20)): ['Hiking!'],
      _selectedDay.subtract(Duration(days: 16)): ['Baking Sourdough!'],
      _selectedDay.subtract(Duration(days: 10)): ['Bob Ross Tutorial'],
      _selectedDay.subtract(Duration(days: 4)): ['Mind Puzzle'],
      _selectedDay.subtract(Duration(days: 2)): ['Upbeat Music Playlist'],
      _selectedDay: []
    };
    this.todaysEvents = this._events[_selectedDay];
    _loadFromLocalStorage();
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
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Colors.white,
                  ),
                  weekendStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                initialCalendarFormat: CalendarFormat.month,
                events: _events,
                calendarStyle: CalendarStyle(
                  selectedColor: Colors.orange,
                  weekdayStyle: TextStyle(
                    color: Colors.white,
                  ),
                  weekendStyle: TextStyle(
                    color: Colors.white,
                  ),
                  unavailableStyle: TextStyle(
                    color: Colors.white,
                  ),
                  outsideWeekendStyle: TextStyle(
                    color: Color(0xFF9E9E9E),
                  ),
                  markersColor: Colors.white,
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
                onDaySelected: (day, events) {
                  setState(() {
                    _selectedEvents = events;
                    print(_selectedEvents);
                  });
                },
              ),
              for (dynamic event in _selectedEvents)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(event.toString()),
                    onTap: () => print('$event tapped!'),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
