import 'package:ishker_24/src/core/network/gns_service.dart';

import '../models/get_client_info_model.dart';

//TODO:
class GnsDataSource {
  GnsDataSource(this._service);

  final GnsService _service;

  Future<HasIPModel?> hasIp(String deviceId) async =>
      _service.checkHasIP(deviceId);
}
