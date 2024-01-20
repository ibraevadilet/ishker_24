import 'package:ishker_24/features/register_ip/data/models/get_user_info_model.dart';

abstract class GetUserInfoRepo {
  Future<GetUserInfoModel> getUserInfo();
}
