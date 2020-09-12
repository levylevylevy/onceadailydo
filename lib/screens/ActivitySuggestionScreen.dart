import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:flutter/material.dart';

/// The screen where a user will be prompted with activities and can mark whether the activity has
/// been completed.
class ActivitySuggestionScreen extends StatefulWidget {
  @override
  _ActivitySuggestionScreenState createState() =>
      _ActivitySuggestionScreenState();
}

class _ActivitySuggestionScreenState extends State<ActivitySuggestionScreen> {
  Widget currentActivitySuggestion = Container(
    child: Text('This is an example activity card'),
  );

  bool hasCompletedActivity = false;

  @override
  Widget build(BuildContext context) {
    return MainHeaderAndNavigation(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Welcome back, [NAME]',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: currentActivitySuggestion,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Complete Activity'),
                      Checkbox(
                        value: this.hasCompletedActivity,
                        onChanged: (newVal) {
                          setState(() {
                            this.hasCompletedActivity = newVal;
                          });
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
