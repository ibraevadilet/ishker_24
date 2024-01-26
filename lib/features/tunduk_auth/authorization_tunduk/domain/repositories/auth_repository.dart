import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/send_for_auth_model.dart';

abstract class AuthRepo {
  Future<AuthModel> auth(SendForAuthModel model);
}
