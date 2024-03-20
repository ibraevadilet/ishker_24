import 'package:ishker_24/core/network/rsk_service.dart';
import 'package:ishker_24/features/rsk/client/data/models/client_info_model.dart';

class RskDataSource {
  RskDataSource(this._service);

  final RskService _service;

  Future<ClientInfoModel> info(String pin) async => _service.clientInfo(pin);
  Future<bool> hasBan(String pin) async => _service.hasBank(pin);
}
