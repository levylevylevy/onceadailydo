import 'package:HopHacks/components/MainHeaderAndNavigation.dart';
import 'package:HopHacks/components/UserSurvey.dart';
import 'package:flutter/material.dart';

/// The screen where a user will fill out their preferences as to which activities that they would
/// like to be notified about.
class NewUserFormScreen extends StatelessWidget {
  final UserSurvey survey = UserSurvey();

  @override
  Widget build(BuildContext context) {
    return MainHeaderAndNavigation(
      displayFooter: false,
      child: Container(
        color: Color(0xFFEFBC9D),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment(0, 55),
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
              color: Color(0xFF52606F),
              child: Text('Complete Survey', style: TextStyle(color: Colors.white)),
              onPressed: () {
                this._submitForm();
                Navigator.pushNamed(context, '/suggestions');
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            ),
          ],
        ),
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
