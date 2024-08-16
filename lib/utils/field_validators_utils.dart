abstract class FieldValidatorsUtils {
  static requiredField(String? value, {String? fieldName}) {
    if (value == '' || value == null) {
      return '${fieldName ?? 'Field'} is required';
    }
    return null;
  }

  static priceAmountValidatorField(String? value, {String? fieldName}) {
    if (value == '' || value == null) {
      return '${fieldName ?? 'Field'} is required';
    }

    if (value.contains(',') && value.split(',')[1].length < 2) {
      return 'Invalid amount input';
    }

    return null;
  }
}
