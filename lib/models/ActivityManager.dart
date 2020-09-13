import 'dart:convert';

import 'package:HopHacks/models/Activity.dart';
import 'package:http/http.dart' as http;

/// Manages several `Activity`s and behavior like fetching `Activity`s from the server.
class ActivityManager {
  final String serverURL;
  List<Activity> activities;

  ActivityManager(this.serverURL);

  /// Loads activities into this manager from this `ActivityManager`s serverURL.
  Future<void> loadActivitiesFromServer() async {
    var response = await http.get(serverURL);
    var activitiesJson = jsonDecode(response.body);
    this.activities = activitiesJson.map((item) => Activity.fromJson(item)).toList();
  }
}

// TODO make a mock ActivityManager that implements the same interface that specifices a
// loadActivitiesFromServer method. Then use that for now in the suggestions screen.