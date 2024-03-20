import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/client/domain/entities/client_info.dart';

import '../entities/has_ip.dart';

abstract interface class IRskRepository {
  Future<Result<ClientInfo, Exception>> clientInfo(String pin);
  Future<Result<HasIP?, Exception>> hasIp(String deviceId);
  Future<Result<bool, Exception>> hasBank(String pin);
}
