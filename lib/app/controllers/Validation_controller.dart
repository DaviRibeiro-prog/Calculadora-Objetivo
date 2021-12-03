class Validation {
  setValidation(String? text) {
    if (text!.isEmpty || text.contains(new RegExp(r'[a-z]')) || !(double.parse(text) <= 10 && double.parse(text) >= 0)) {
      return 'Invalid';
    } else {
      return null;
    }
  }
}
