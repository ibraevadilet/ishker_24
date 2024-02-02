import 'package:ishker_24/features/splash/data/models/ishker_auth_model.dart';
import 'package:ishker_24/features/splash/data/models/exists_user_model.dart';

abstract class ExistsUserRepo {
  Future<String?> existsUser(String deviceId);
   Future<IshkerAuthModel> getToken(String deviceId,String pin);
}
