import 'package:ishker_24/features/bank/data/models/get_client_passport_model.dart';

abstract class GetClientPassportRepo {
  Future<ClientPassportModel> getClientPassport();
}
