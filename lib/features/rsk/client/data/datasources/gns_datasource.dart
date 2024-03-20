import 'package:ishker_24/core/network/gns_service.dart';

import '../models/has_ip_model.dart';

//TODO:
class GnsDataSource {
  GnsDataSource(this._service);

  final GnsService _service;

  Future<HasIPModel?> hasIp(String deviceId) async =>
      _service.checkHasIP(deviceId);
}
