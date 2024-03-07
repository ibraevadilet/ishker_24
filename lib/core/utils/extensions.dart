extension StringX on String {
  String get obscureFirstNumbers =>
      '${'*' * (length - 4)}${substring(length - 4)}';
}

extension StringXX on String? {
  bool get isNullOrEmpty => this == null || this?.isEmpty == true;
}
