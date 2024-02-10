import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';

abstract class GetClientInfoRepo {
  Future<ClientInfoModel> getClientInfo();
}
