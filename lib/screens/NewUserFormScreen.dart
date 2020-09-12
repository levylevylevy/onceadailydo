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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: survey,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text('Complete Survey'),
            onPressed: () => this._submitForm(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color(0xFF52606F)),
            ),
          ),
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
