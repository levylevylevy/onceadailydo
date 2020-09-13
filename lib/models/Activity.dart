import 'package:shared_preferences/shared_preferences.dart';

/// Stores the data and behavior for a generic activity
class Activity {
  /// the id that the database has stored this activity under
  int id;
  String title;
  String description;

  /// Constructs an Activity object from json in the format:
  /// {
  ///   int activityId,
  ///   String title,
  ///   String text
  /// }
  Activity.fromJson(Map<String, dynamic> json) {
    this.id = json['activityId'];
    this.title = json['title'];
    this.description = json['text'];
  }

  /// Returns a json string representation of this Activity. This is the same representation that
  /// comes from the server.
  String toJson() {
    return '{"activityId": $id, "title": $title, "text": $description}';
  }

  /// Persists this activity in key-value pair form into local memory via the SharedPreferences
  /// library 
  void persistIntoLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(this.id.toString(), this.toJson());
  }

  /// Removes this activity from the local storage.
  void removeFromLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(this.id.toString());
  }
}