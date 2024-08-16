import 'package:flutter/material.dart';

abstract class FormUtils {
  static checkAndSubmit(GlobalKey<FormState> formKey, {Function? callback}) {
    final isValidForm = formKey.currentState?.validate();

    if (isValidForm == null || isValidForm == false) {
      return;
    }

    if(callback != null) {
      callback();
    }
  }
}
