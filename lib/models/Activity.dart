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
}