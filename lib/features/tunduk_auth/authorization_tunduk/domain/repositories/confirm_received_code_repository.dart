import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/get_confirm_code_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_confirm_code_model.dart';

abstract class ConfirmReceivedCodeRepo {
  Future<GetConfirmCodeModel> confirmReceivedCode(SendConfirmCodeModel model);
}
