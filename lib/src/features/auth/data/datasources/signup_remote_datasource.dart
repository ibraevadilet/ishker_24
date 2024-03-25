import 'package:ishker_24/src/core/network/oep_service.dart';
import 'package:ishker_24/src/features/auth/data/models/oep_register_model.dart';

abstract interface class ISignUpRemoteDataSource {
  Future<String> signUp(OepRegisterModel model);
  Future<String> terms(String path);
}

final class SignUpRemoteDataSourceImpl implements ISignUpRemoteDataSource {
  SignUpRemoteDataSourceImpl(this._service);

  final OepService _service;

  @override
  Future<String> signUp(OepRegisterModel model) async =>
      _service.registerOEP(model);

  @override
  Future<String> terms(String path) async => _service.getTerms(path);
}
