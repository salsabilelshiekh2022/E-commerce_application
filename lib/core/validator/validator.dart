class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Enter correct name";
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Enter correct email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Field is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else {
      return null;
    }
  }
}
