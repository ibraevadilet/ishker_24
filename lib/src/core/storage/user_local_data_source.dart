import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ishker_24/src/core/constants/constants.dart';

abstract interface class ILocalDataSource {
  Future<String?> get accessToken;
  Future<void> cacheAccessToken(String token);
  Future<void> removeAccessToken();

  Future<String?> get refreshToken;
  Future<void> cacheRefreshToken(String token);
  Future<void> removeRefreshToken();

  Future<String?> get pin;
  Future<void> cachePin(String pin);
  Future<void> removePin();

  Future<String?> get pinCode;
  Future<void> cachePinCode(String pin);
  Future<void> removePincode();

  Future<void> clear();
}

final class LocalDataSourceImpl implements ILocalDataSource {
  LocalDataSourceImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> get accessToken async => _storage.read(
        key: SharedKeys.accessToken,
      );

  @override
  Future<void> cacheAccessToken(String token) async =>
      _storage.write(key: SharedKeys.accessToken, value: token);

  @override
  Future<void> removeAccessToken() async =>
      _storage.delete(key: SharedKeys.accessToken);

  @override
  Future<String?> get refreshToken async => _storage.read(
        key: SharedKeys.refreshToken,
      );

  @override
  Future<void> cacheRefreshToken(String token) async =>
      _storage.write(key: SharedKeys.refreshToken, value: token);

  @override
  Future<void> removeRefreshToken() async =>
      _storage.delete(key: SharedKeys.refreshToken);

  @override
  Future<String?> get pin async => _storage.read(key: SharedKeys.pin);

  @override
  Future<void> cachePin(String pin) async =>
      _storage.write(key: SharedKeys.pin, value: pin);

  @override
  Future<void> removePin() async => _storage.delete(key: SharedKeys.pin);

  @override
  Future<String?> get pinCode async => _storage.read(key: SharedKeys.pinCode);

  @override
  Future<void> cachePinCode(String pinCode) async => _storage.write(
        key: SharedKeys.pinCode,
        value: pinCode,
      );

  @override
  Future<void> removePincode() async =>
      _storage.delete(key: SharedKeys.pinCode);

  @override
  Future<void> clear() async => _storage.deleteAll();
}
