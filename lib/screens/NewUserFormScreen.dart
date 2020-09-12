import 'package:HopHacks/components/UserSurvey.dart';
import 'package:flutter/material.dart';

/// The screen where a user will fill out their preferences as to which activities that they would
/// like to be notified about.
class NewUserFormScreen extends StatelessWidget {
  final UserSurvey survey = UserSurvey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO: logo here'),
      ),
      body: Column(
        children: [
          survey,
          RaisedButton(child: Text('Complete Survey'), onPressed: () => this._submitForm(),)
        ],
      ),
    );
  }

  /// The actions that occur when this form is submitted.
  void _submitForm() {
    print(survey.formState);

    // TODO: this is where we'll send the server the information stored in the survey.formState
    // variable. Not exactly sure how we'll get this info through yet.
  }
}
