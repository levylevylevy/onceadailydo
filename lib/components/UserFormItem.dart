import 'package:HopHacks/components/UserSurvey.dart';
import 'package:flutter/material.dart';

typedef OnChangeEvent = void Function(String);

/// A styled widget to be placed inside of a `Form` widget.
class UserFormItem extends StatelessWidget {
  String _label;
  FormFieldValidator<String> validator;
  FormFieldValidator<String> _defaultValidator;
  OnChangeEvent _onChange;

  /// [_label] the title of this form item.
  /// [_onChange] a void function that runs when this form item changes. Typically updates the
  /// parents form state.
  /// [_validator] a function that returns either null if this input is valid or a description of
  /// why it is not valid.
  UserFormItem(this._label, this._onChange, {this.validator}) {
    this._defaultValidator = (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }

      return null;
    };
    this.validator = this._defaultValidator;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_label),
          TextFormField(
            validator: validator,
            onChanged: this._onChange,
          ),
        ],
      ),
    );
  }
}
