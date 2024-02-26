import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ishker_24/src/core/network/dio_client.dart';
import 'package:ishker_24/src/core/network/netrowk_info.dart';
import 'package:ishker_24/src/core/storage/user_local_data_source.dart';
import 'package:ishker_24/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/grnp_check_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/exit_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/get_confirm_code_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_enter_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_new_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/pincode_cached_usecase.dart';
import 'package:ishker_24/src/features/auth/domain/usecases/terms_usecase.dart';
import 'package:ishker_24/src/features/recovery/data/datasources/recovery_datasource.dart';
import 'package:ishker_24/src/features/recovery/domain/repositories/i_recovery_repository.dart';
import 'package:ishker_24/src/features/recovery/domain/usecases/reset_password_usecase.dart';
import 'package:ishker_24/src/features/signup/data/datasources/signup_remote_datasource.dart';
import 'package:ishker_24/src/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:ishker_24/src/features/signup/domain/repositories/i_signup_repository.dart';
import 'package:ishker_24/src/features/signup/domain/usecases/oep_terms_usecase.dart';
import 'package:ishker_24/src/features/signup/domain/usecases/signup_usecase.dart';

import 'core/network/auth_service.dart';
import 'core/network/esia_service.dart';
import 'core/network/grnp_service.dart';
import 'core/network/oep_service.dart';
import 'core/network/rsk_service.dart';
import 'core/utils/app_device_info.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/i_auth_repository.dart';
import 'features/auth/domain/usecases/confirm_code_usecase.dart';
import 'features/auth/domain/usecases/exists_user_usecase.dart';
import 'features/auth/domain/usecases/get_cached_pin_usecase.dart';
import 'features/auth/domain/usecases/grnp_create_use_case.dart';
import 'features/auth/domain/usecases/pincode_set_usecase.dart';
import 'features/recovery/data/repositories/recovery_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final appInfo = AppDeviceInfo();
  await appInfo.init();
  //TODO:
  sl.registerLazySingleton(() => appInfo);

  // external
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  // sl.registerLazySingleton<FlutterSecureStorage>(
  //   () => const FlutterSecureStorage(
  //     aOptions: AndroidOptions(encryptedSharedPreferences: true),
  //     iOptions: IOSOptions(
  //       accessibility: KeychainAccessibility.first_unlock,
  //     ),
  //   ),
  // );

  // core
  sl.registerLazySingleton<INetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );
  sl.registerLazySingleton<ILocalDataSource>(
    () => LocalDataSourceImpl(_storage),
  );

  // service
  final slo = DioClient(sl()).dio;
  sl.registerLazySingleton(() => RskService(slo));
  sl.registerLazySingleton(() => EsiaService(slo));
  sl.registerLazySingleton(() => GRNPService(slo));
  sl.registerLazySingleton(() => AuthService(slo));
  sl.registerLazySingleton(() => OepService(slo));

  // data sources
  sl.registerLazySingleton<IAuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<ISignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<IRecoveryDataSource>(
    () => RecoveryDataSourceImpl(sl()),
  );

  // repositories
  // sl.registerLazySingleton<IUsersRepository>(
  //   () => UsersRepositoryImpl(sl(), sl(), sl()),
  // );

  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<ISignUpRepository>(
    () => SignUpRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<IRecoveryRepository>(
    () => RecoveryRepositoryImpl(sl(), sl()),
  );

  // usecases
  sl.registerFactory(() => ExitUseCase(sl()));
  sl.registerFactory(() => ExistsUserUseCase(sl()));
  sl.registerFactory(() => LoginUseCase(sl()));
  sl.registerFactory(() => GetCachedPinUseCase(sl()));
  sl.registerFactory(() => TermsUseCase(sl()));
  sl.registerFactory(() => GetConfirmCodeUseCase(sl()));
  sl.registerFactory(() => ConfirmCodeUseCase(sl()));
  sl.registerFactory(() => PinCodeEnterUseCase(sl()));
  sl.registerFactory(() => PinCodeNewUseCase(sl()));
  sl.registerFactory(() => PinCodeSetUseCase(sl()));
  sl.registerFactory(() => PinCodeCachedUseCase(sl()));
  sl.registerFactory(() => GrnpCheckUseCase(sl()));
  sl.registerFactory(() => GrnpCreateaUseCase(sl()));

  sl.registerFactory(() => SignUpUseCase(sl()));
  sl.registerFactory(() => OepTermsUseCase(sl()));

  sl.registerFactory(() => ResetPasswordUseCase(sl()));
}
