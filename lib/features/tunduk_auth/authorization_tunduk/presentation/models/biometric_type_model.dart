import 'package:local_auth/local_auth.dart';

class BiometricTypeModel {
  BiometricTypeModel({
    required this.biometricAvailable,
    this.biotype,
  });
  final bool biometricAvailable;
  final BiometricType? biotype;
}
