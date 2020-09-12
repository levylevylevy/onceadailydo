import 'package:HopHacks/components/UserFormItem.dart';
import 'package:flutter/material.dart';

/// The user survey content which is wrapped by an unstyled container.
class UserSurvey extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Will be passed to individual form fields, which will change the values stored in this object
  // according to what the user inputs.
  FormItemState formState = FormItemState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome,'),
        Text('New User'),
        Form(
          key: _formKey,
          child: Column(
            children: [
              UserFormItem(
                'Name',
                (String newVal) {
                  this.formState.name = newVal;
                },
              ),
              UserFormItem(
                'Food Restrictions',
                (String newVal) {
                  // Do nothing for now. Eventually this will probably be a dropdown or something
                },
              ),
              UserFormItem(
                'Do you prefer more intensive physical activities or intensive mind' +
                    'activities during the day?',
                (String newVal) {
                  // Do nothing for now. Eventually this will probably be a dropdown or something
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// The two preferences that are available when choosing types of activities.
enum ActivityType { PHYSICAL, MENTAL }

/// An object that stores all information relating to the User Survey. Default values are provided
/// for all fields, but since the fields are public, they can be changed at any time.
class FormItemState {
  // These provide defaults that can later be changed
  String name = "";
  List<String> foodRestrictions = [];
  ActivityType activityTypePreference = ActivityType.PHYSICAL;

  @override
  String toString() {
    return 'name: $name, foodRestrictions: $foodRestrictions, activityTypePreference: $activityTypePreference';
  }
}
