class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Please enter correct name";
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Field is required';
    } else if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value)) {
      return 'Please enter correct number ';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter correct email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    } else {
      return null;
    }
  }

  static String? validateAtherField(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else {
      return null;
    }
  }
}
