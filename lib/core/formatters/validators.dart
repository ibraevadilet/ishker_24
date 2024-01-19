class AppInputValidators {
  static String? emptyValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    return null;
  }

  static String? phoneValidator(String? val) {
    if (val!.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    if (val.length != 9) {
      return 'Введите корректный номер телефона';
    } else {
      return null;
    }
  }

  static String? innValidator(String? val) {
    var regexp = RegExp(r'^[0-9]*$');
    if (val!.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    if (val.length != 14 || (!val.startsWith('1') && !val.startsWith('2'))) {
      return 'Введите корректный ИНН';
    } else if (!regexp.hasMatch(val)) {
      return 'Введите корректный ИНН';
    } else {
      return null;
    }
  }
  

  static String? anIdValidator(String? val) {
    if (val!.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    RegExp englishLettersOnly = RegExp(r'^[a-zA-Z]+$');

    if (!englishLettersOnly.hasMatch(val)) {
      return 'Введите корректную';
    } else {
      return null;
    }
  }

  static String? pinCodeValidator({
    required String? str,
    bool useLengthValidator = true,
  }) {
    if (str == null || str.isEmpty) {
      return 'Введите код';
    }
    if (str.length != 4 && useLengthValidator) {
      return 'Пин должен состоять из 4 символов';
    }
    final regexp = RegExp(r'^[0-9]*$');

    if (!regexp.hasMatch(str)) {
      return 'Разрешены только целые числа';
    }

    return null;
  }

  static String? pinCodeRepeatValidator({
    required String? firstPin,
    required String? str,
    bool useLengthValidator = true,
  }) {
    if (str == null || str.isEmpty) {
      return 'Введите код';
    }
    if (str.length != 4 && useLengthValidator) {
      return 'Пин должен состоять из 4 символов';
    }
    if (str.length == 4 && firstPin != str) {
      return 'Пароли не совпадают';
    }
    final regexp = RegExp(r'^[0-9]*$');

    if (!regexp.hasMatch(str)) {
      return 'Разрешены только целые числа';
    }

    return null;
  }

  static String? esiSmsCodeValidator({
    required String? str,
  }) {
    if (str == null || str.isEmpty) {
      return 'Введите код';
    }
    if (str.length != 6) {
      return 'Пин должен состоять из 6 символов';
    }
    final regexp = RegExp(r'^[0-9]*$');

    if (!regexp.hasMatch(str)) {
      return 'Разрешены только целые числа';
    }

    return null;
  }
}
