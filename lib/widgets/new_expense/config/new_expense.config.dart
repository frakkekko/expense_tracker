import 'package:expense_tracker/utils/form_utils.dart';
import 'package:expense_tracker/utils/input_formatter_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<TextInputFormatter> inputFormatters = [
  InputNumberCommaPointFieldFormatter(),
  InputNumberTwoDecimalFieldFormatter(),
  InputOnlyNumberFieldFormatter()
];

void Function() onFormSubmit(GlobalKey<FormState> formKey) {
  return () {
    FormUtils.checkAndSubmit(formKey);
  };
}

void Function() onCancelForm(BuildContext context) {
  return () {
    Navigator.pop(context);
  };
}
