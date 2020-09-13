import 'dart:convert';
import 'package:HopHacks/models/Activity.dart';

/// Manages several `Activity`s and behavior like fetching `Activity`s from the server.
class MockActivityManager {
  List<Activity> activities = [];

  MockActivityManager();

  /// Loads activities into this manager from this `ActivityManager`s serverURL.
  Future<void> loadActivitiesFromServer() async {
    this.activities.add(
          Activity.fromJson(
            // would love to break this up into a multiline string, but when I do, I think it
            // inserts newline characters into the string, so for now, it'll remain a long
            // single-line string.
            json.decode(
              '{"activityId": 1, "title": "Taking Care of the Community","text": "Look up on google where your closest animal rescue is, and schedule to help volunteer for an hour. Trust us, you\'ll really enjoy this one! ![dog volunteer](https://www.littlewhitedogco.com/wp-content/uploads/2019/10/volunteer-1200x630.jpg)"}',
            ),
          ),
        );
  }
}
