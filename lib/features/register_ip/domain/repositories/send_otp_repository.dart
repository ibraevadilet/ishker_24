import 'package:ishker_24/features/register_ip/data/models/user_nalog_types_model.dart';

abstract class SendOtpRepo {
  Future<void> sendOtp(String authType);
  Future<String> confirmOtp(String pinCode, UserNalogTypesModel registerModel);
}
