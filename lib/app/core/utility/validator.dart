abstract class Validator {
  static RegExp _generatePasswordRegex(int minLength, int maxLength) {
    final pattern = r'^.{' +
        minLength.toString() +
        ',' +
        maxLength.toString() +
        r'}$';
    return RegExp(pattern);
  }

  static RegExp _generateUsernameRegex(int minLength, int maxLength) {
    final pattern = r'^[a-zA-Z][a-zA-Z0-9_.]{' +
        (minLength - 1).toString() +
        ',' +
        (maxLength - 1).toString() +
        r'}$';
    return RegExp(pattern);
  }

  static RegExp _generateEmailRegex() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  }

  static String? validatePassword(String password) {
    return _generatePasswordRegex(6, 16).hasMatch(password)
        ? null
        : "Password must be alphanumeric in range 6 to 16";
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    return validatePassword(confirmPassword) ??
        (password == confirmPassword
            ? null
            : "Password and confirm password didn't match");
  }

  static String? validateEmail(String email, {bool optional = false}) {
    return optional && email.isEmpty
        ? null
        : _generateEmailRegex().hasMatch(email)
            ? null
            : "Provide a valid email address";
  }

  static validateName(String text) {
    return _generateUsernameRegex(3, 32).hasMatch(text)
        ? null
        : "Name must in 3 to 32 character and can't start with number.";
  }
}
