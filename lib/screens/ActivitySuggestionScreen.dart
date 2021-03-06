import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:HopHacks/components/activities/ArtsAndCrafts.dart';
import 'package:HopHacks/components/activities/GenericRecommendation.dart';
import 'package:HopHacks/components/activities/MovieRecommendation.dart';
import 'package:HopHacks/components/activities/SongRecommendation.dart';
import 'package:HopHacks/models/Activity.dart';
import 'package:HopHacks/models/MockActivityManager.dart';
import 'package:flutter/material.dart';
import 'package:loader/loader.dart';

/// The screen where a user will be prompted with activities and can mark whether the activity has
/// been completed.
class ActivitySuggestionScreen extends StatefulWidget {
  @override
  _ActivitySuggestionScreenState createState() =>
      _ActivitySuggestionScreenState();
}

class _ActivitySuggestionScreenState extends State<ActivitySuggestionScreen>
    with LoadingMixin<ActivitySuggestionScreen> {
  Widget exampleSongRec = SongRecommendation(
    'Stack it up',
    'Liam Payne',
    'https://www.example.com/20FxLQ20X',
  );
  Widget exampleMovieRec = MovieRecommendation(
    'Parasite',
    'https://www.example.com/20FxLQ20X',
  );
  Widget exampleArtsAndCraftsRec = ArtsAndCrafts(
    'Try this Bob Ross painting tutorial!',
    'https://www.example.com/20FxLQ20X',
  );
  Widget exampleGenericActivity = Container(
    child: Text('This is an example activity card'),
  );
  Widget currActivityWidget;
  bool hasCompletedActivity = false;
  String name = 'Garrett';
  Activity activity;

  @override
  Widget build(BuildContext context) {
    return MainHeaderAndNavigation(
      title: 'Your Daily Activity',
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Welcome back, $name',
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
                      padding: EdgeInsets.all(10.0),
                      child: loading
                          ? CircularProgressIndicator()
                          : currActivityWidget,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Color(0xFF566575),
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

                            if (newVal) {
                              this.activity.persistIntoLocalStorage();
                            } else {
                              this.activity.removeFromLocalStorage();
                            }
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

  /// Uses the Loader library to load data without going through the tedious work of using a
  /// FutureBuilder
  @override
  Future<void> load() async {
    MockActivityManager manager = MockActivityManager();
    await manager.loadActivitiesFromServer();
    Activity currActivity = manager.activities[0];
    this.currActivityWidget = GenericRecommendation(
      currActivity.title,
      currActivity.description,
    );
    this.activity = currActivity;
  }
}
