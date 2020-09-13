import 'package:HopHacks/components/UserSurvey.dart';
import 'package:flutter/material.dart';

typedef OnChangeEvent = void Function(String);

enum InputTypes { TEXT, DROPDOWN }

/// A styled widget to be placed inside of a `Form` widget.
class UserFormItem extends StatefulWidget {
  String _label;
  FormFieldValidator<String> validator;
  FormFieldValidator<String> _defaultValidator;
  OnChangeEvent _onChange;
  InputTypes type;
  List<String> dropdownItems;

  /// [_label] the title of this form item.
  /// [_onChange] a void function that runs when this form item changes. Typically updates the
  /// parents form state.
  /// [_validator] a function that returns either null if this input is valid or a description of
  /// why it is not valid.
  UserFormItem(this._label, this._onChange, {this.validator, this.type = InputTypes.TEXT,
      this.dropdownItems = const []}) {
    this._defaultValidator = (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }

      return null;
    };
    this.validator = this._defaultValidator;
  }

  @override
  _UserFormItemState createState() => _UserFormItemState(
        this._label,
        this._onChange,
        validator: this.validator,
        type: this.type,
        dropdownItems: this.dropdownItems
      );
}

/// A styled widget to be placed inside of a `Form` widget.
class _UserFormItemState extends State<UserFormItem> {
  String _label;
  FormFieldValidator<String> validator;
  FormFieldValidator<String> _defaultValidator;
  OnChangeEvent _onChange;
  InputTypes type;
  List<String> dropdownItems;
  String dropdownState;

  _UserFormItemState(this._label, this._onChange, {this.validator, this.type = InputTypes.TEXT,
      this.dropdownItems = const []}) {
    this._defaultValidator = (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }

      return null;
    };
    this.validator = this._defaultValidator;
    dropdownState = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_label),
          if (this.type == InputTypes.TEXT)
            TextFormField(
              validator: validator,
              onChanged: this._onChange,
            ),
          if (this.type == InputTypes.DROPDOWN)
            DropdownButton<String>(
              value: this.dropdownState,
              onChanged: (String newVal) {
                setState(() {
                  this.dropdownState = newVal;
                });
              },
              items: this.dropdownItems.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
        ],
      ),
    );
  }
}
