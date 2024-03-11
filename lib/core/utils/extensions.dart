extension StringX on String {
  String get obscureFirstNumbers =>
      '${'*' * (length - 4)}${substring(length - 4)}';
}

extension StringXX on String? {
  bool get isNullOrEmpty => this == null || this?.isEmpty == true;
}

extension DateTimeX on DateTime {
  DateTime get days7 => subtract(const Duration(days: 7));
  DateTime get days30 => subtract(const Duration(days: 30));
  DateTime get days90 => subtract(const Duration(days: 90));
}
