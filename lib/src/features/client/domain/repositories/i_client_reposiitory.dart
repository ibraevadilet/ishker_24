import 'package:ishker_24/src/core/utils/result.dart';

import '../entities/client_info.dart';
import '../entities/has_ip.dart';

abstract interface class IClientRepository {
  Future<Result<ClientInfo, Exception>> clientInfo(String pin);
  Future<Result<HasIP?, Exception>> hasIp(String deviceId);
  Future<Result<bool, Exception>> hasBank(String pin);
}
