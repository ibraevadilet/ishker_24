import 'package:ishker_24/src/core/network/auth_service.dart';
import 'package:ishker_24/src/core/network/esia_service.dart';
import 'package:ishker_24/src/core/network/grnp_service.dart';
import 'package:ishker_24/src/features/auth/data/models/auth_request_model.dart';
import 'package:ishker_24/src/features/auth/data/models/send_grnp_model.dart';

import '../models/auth_model.dart';
import '../models/get_confirm_code_model.dart';
import '../models/ishker_auth_model.dart';
import '../models/send_confirm_code_model.dart';

abstract interface class IAuthRemoteDataSource {
  Future<String> exists(String deviceId);
  Future<AuthModel> auth(AuthRequestBody body);
  Future<String> esiaGetTerms(String path);
  Future<void> exit(String deviceId);
  //TODO: что такое checkGrnp?
  Future<bool> checkGrnp(String pin);
  Future<String> sendGrnp(SendGRNPModel model, String phone);

  Future<IshkerAuthModel> getToken(String deviceId, String pin);

  Future<void> setPinCode(String sessionToken, String code);
  Future<void> pinCodeEnter(String deviceId, String pin, String code);
  Future<void> pinCodeChange(String deviceId, String resetToken, String code);

  Future<void> getConfirmCode(String method, String twoFactorSessionToken);
  Future<GetConfirmCodeModel> confirmCode(SendConfirmCodeModel model);
}

class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  AuthRemoteDataSourceImpl(
    this._esiaService,
    this._authService,
    this._grnpService,
  );

  final EsiaService _esiaService;
  final AuthService _authService;
  final GRNPService _grnpService;

  @override
  Future<String> exists(String deviceId) async =>
      _esiaService.userExists(deviceId);

  @override
  Future<AuthModel> auth(AuthRequestBody model) async =>
      _esiaService.auth(model);

  @override
  Future<bool> checkGrnp(String pin) async => _grnpService.checkGrnp(pin);

  @override
  Future<GetConfirmCodeModel> confirmCode(
    SendConfirmCodeModel model,
  ) async =>
      _esiaService.confirmReceivedCode(model);

  @override
  Future<void> pinCodeEnter(
    String deviceId,
    String pin,
    String pinCode,
  ) async =>
      _esiaService.pinCodeEnter(deviceId, pin, pinCode);

  @override
  Future<String> esiaGetTerms(String path) async =>
      _esiaService.esiaGetTerms(path);

  @override
  Future<void> exit(String deviceId) async => _esiaService.exit(deviceId);

  @override
  Future<void> getConfirmCode(
    String method,
    String twoFactorSessionToken,
  ) async =>
      _esiaService.getConfirmCode(method, twoFactorSessionToken);

  @override
  Future<IshkerAuthModel> getToken(String deviceId, String pin) async =>
      _authService.getToken(deviceId, pin);

  @override
  Future<void> pinCodeChange(
    String deviceId,
    String resetPinCodeToken,
    String pinCode,
  ) async =>
      _esiaService.pinCodeChange(deviceId, resetPinCodeToken, pinCode);

  @override
  Future<void> setPinCode(String persistentSessionToken, String pin) async =>
      _esiaService.setPinCode(persistentSessionToken, pin);

  @override
  Future<String> sendGrnp(SendGRNPModel model, String phone) async =>
      _grnpService.sendGRNP(model, phone);
}
