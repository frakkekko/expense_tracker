import 'package:flutter/services.dart';

class InputNumberCommaPointFieldFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    // This check must be the first
    if(oldValue.text == '' || newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    if(newValue.text[newValue.text.length - 1] == ',' && ','.allMatches(oldValue.text).length == 1){
      return oldValue;
    }

    return newValue;
  }
}

class InputNumberTwoDecimalFieldFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    // This check must be the first
    if(oldValue.text == '' || newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    if(newValue.text.contains(',') && newValue.text.split(',')[1].length > 2){
      return oldValue;
    }

    return newValue;
  }
}

class InputOnlyNumberFieldFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    const List<String> allowedSymbols = ['0','1','2','3','4','5','6','7','8','9',','];
    // This check must be the first
    if((oldValue.text == '' && allowedSymbols.contains(newValue.text[newValue.text.length - 1])) || newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    if(!allowedSymbols.contains(newValue.text[newValue.text.length - 1])){
      return oldValue;
    }

    return newValue;
  }
}
