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
              json.decode('{"activityId": 1, "title": "Example title", "text": "Example description"}')),
        );
  }
}