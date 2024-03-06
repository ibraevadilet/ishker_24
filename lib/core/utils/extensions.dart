extension StringX on String {
  String get obscureFirstNumbers =>
      '${'*' * (length - 4)}${substring(length - 4)}';
}
