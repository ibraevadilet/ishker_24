import 'package:ishker_24/features/register_oep/data/models/send_register_oep_model.dart';

abstract class RegisterOEPRepo {
  Future<void> registerOEP(SendRegisterOEPModel registerOEPModel);
}
