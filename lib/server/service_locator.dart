import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ishker_24/core/network/netrowk_info.dart';
import 'package:ishker_24/core/network/rsk_service.dart';
import 'package:ishker_24/features/bank/data/repo_implements/create_account_repo_impl.dart';
import 'package:ishker_24/features/bank/data/repo_implements/get_client_passport_repo_impl.dart';
import 'package:ishker_24/features/bank/data/repo_implements/register_client_repo_impl.dart';
import 'package:ishker_24/features/bank/domain/repositories/create_account_repository.dart';
import 'package:ishker_24/features/bank/domain/repositories/get_client_passport_repository.dart';
import 'package:ishker_24/features/bank/domain/repositories/register_client_repository.dart';
import 'package:ishker_24/features/bank/domain/use_cases/create_account_usecase.dart';
import 'package:ishker_24/features/bank/domain/use_cases/get_client_passport_usecase.dart';
import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';
import 'package:ishker_24/features/bank/presentation/bank_main_screen/check_bank_cubit/check_bank_cubit.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/get_client_passport_cubit/get_client_passport_cubit.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/regitser_client_cubit/regitser_client_cubit.dart';
import 'package:ishker_24/features/bottom_navigator/logic/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:ishker_24/features/grnp_check/data/repositories_impl/grnp_repo_impl.dart';
import 'package:ishker_24/features/grnp_check/domain/repositories/grnp_repository.dart';
import 'package:ishker_24/features/grnp_check/domain/use_case/grnp_use_case.dart';
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/grnp_cubit/grnp_cubit.dart';
import 'package:ishker_24/features/home/data/repo_implements/check_has_ip_repo_impl.dart';
import 'package:ishker_24/features/home/data/repo_implements/get_client_info_repo_impl.dart';
import 'package:ishker_24/features/home/domain/repositories/check_has_ip_repository.dart';
import 'package:ishker_24/features/home/domain/repositories/get_client_info_repository.dart';
import 'package:ishker_24/features/home/domain/use_cases/check_has_ip_use_case.dart';
import 'package:ishker_24/features/home/domain/use_cases/get_client_info_usecase.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/check_has_ip_cubit/check_has_ip_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/get_client_info_cubit/get_client_info_cubit.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/get_my_ip_cubit/get_my_ip_cubit.dart';
import 'package:ishker_24/features/qr/data/datasources/qr_remote_datasource.dart';
import 'package:ishker_24/features/qr/data/repo_implements/generate_qr_repo_impl.dart';
import 'package:ishker_24/features/qr/domain/repositories/generate_qr_repository.dart';
import 'package:ishker_24/features/qr/domain/use_cases/generate_qr_usecase.dart';
import 'package:ishker_24/features/qr/presentation/qr_main_screen/cubits/generate_qr_cubit/generate_qr_cubit.dart';
import 'package:ishker_24/features/register_ip/data/repo_implements/get_gns_pdf_repo_impl.dart';
import 'package:ishker_24/features/register_ip/data/repo_implements/get_pin_code_receiving_repo_impl.dart';
import 'package:ishker_24/features/register_ip/data/repo_implements/get_user_info_repo_impl.dart';
import 'package:ishker_24/features/register_ip/data/repo_implements/send_otp_repo_impl.dart';
import 'package:ishker_24/features/register_ip/data/repo_implements/tax_and_selected_modes_repo_impl.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_gns_pdf_repository.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_pin_code_receiving_repository.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_user_info_repository.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/send_otp_repository.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/tax_and_selected_modes_repository.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_gns_pdf_usecase.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_pin_code_receiving_usecase.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_user_info_usecase.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/send_otp_usecase.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/tax_and_selected_modes_usecase.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/confirm_otp_cubit/confirm_otp_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_gns_pdf_cubit/get_gns_pdf_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_pin_code_receiving_cubit/get_pin_code_receiving_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/search_vid_deatelnost_cubit/search_vid_deatelnost_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/send_otp_cubit/send_otp_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/tax_and_selected_modes_cubit/tax_and_selected_modes_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/timer_cubit/timer_cubit.dart';
import 'package:ishker_24/features/register_oep/data/repo_implements/get_terms_repo_impl.dart';
import 'package:ishker_24/features/register_oep/data/repo_implements/register_oep_repo_impl.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/get_terms_repository.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/register_oep_repo.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/get_terms_usecase.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/register_oep_use_case.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/get_terms_cubit/get_terms_cubit.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/register_oep_cubit/register_oep_cubit.dart';
import 'package:ishker_24/features/splash/data/repo_implements/exists_user_repo_impl.dart';
import 'package:ishker_24/features/splash/domain/repositories/exists_user_repository.dart';
import 'package:ishker_24/features/splash/domain/use_cases/exists_user_usecase.dart';
import 'package:ishker_24/features/splash/splash_cubit/splash_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/auth_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/check_grnp_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/confirm_received_code_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/esia_get_terms_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/exit_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/get_confirm_code_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/pin_code_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/auth_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/check_grnp_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/confirm_received_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/esia_get_terms_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/exit_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/get_confirm_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/pin_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/check_grnp_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/confirm_received_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/esia_get_terms_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/exit_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_confirm_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/pin_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_confirm_code_screen/cubits/confirm_received_code_cubit/confirm_received_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/cubits/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/cubits/esia_cubit/esia_terms_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/cubits/get_confirm_code_cubit/get_confirm_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/biometric_cubit/biometric_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/enter_pin_code_cubit/enter_pin_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_repeat_screen/cubits/set_pin_code_cubit/set_pin_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/data/repo_implements/reset_password_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/data/repo_implements/reset_password_token_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/data/repo_implements/set_new_password_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/reset_password_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/reset_password_token_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/repositories/set_new_password_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/reset_password_token_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/reset_password_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/domain/use_cases/set_new_password_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_inn_screen/reset_password_cubit/reset_password_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_new_password_screen/set_new_password_cubit/set_new_password_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_sms_code_screen/reset_password_token_cubit/reset_password_token_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/data/repo_implements/reset_pin_code_token_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/data/repo_implements/set_reset_pin_code_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/repositories/reset_pin_code_token_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/repositories/set_reset_pin_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/use_cases/reset_pin_code_token_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/domain/use_cases/set_reset_pin_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/cubits/send_reset_pin_code_cubit/send_reset_pin_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_sms_code_screen/reset_pin_code_token_cubit/reset_pin_code_token_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/exit_cubit/exit_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.dart';
import 'package:ishker_24/server/dio_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

// ignore: long-method
Future<void> initServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<INetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => DioSettings(prefs: sl()).dio);
  sl.registerSingleton<AppRouter>(AppRouter());

  sl.registerLazySingleton<RskService>(() => RskService(sl()));

  /// Datasources
  sl.registerLazySingleton<IQrRemoteDataSource>(
    () => QrRemoteDataSourceImpl(sl()),
  );

  /// Repository
  sl.registerFactory<RegisterOEPRepo>(() => RegisterOEPRepoImpl(dio: sl()));
  sl.registerFactory<GetTermsRepo>(() => GetTermsRepoImpl(dio: sl()));
  sl.registerFactory<GetUserInfoRepo>(
    () => GetUserInfoRepoImpl(dio: sl()),
  );
  sl.registerFactory<TaxAndSelectedModesRepo>(
      () => TaxAndSelectedModesRepoImpl(dio: sl(), pref: sl()));
  sl.registerFactory<GetGnsPdfRepo>(
      () => GetGnsPdfRepoImpl(dio: sl(), pref: sl()));
  sl.registerFactory<GetPinCodeReceivingRepo>(
      () => GetPinCodeReceivingRepoImpl(dio: sl(), pref: sl()));
  sl.registerFactory<SendOtpRepo>(() => SendOtpRepoImpl(dio: sl(), pref: sl()));
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(dio: sl()));
  sl.registerFactory<GetConfirmCodeRepo>(
      () => GetConfirmCodeRepoImpl(dio: sl()));
  sl.registerFactory<ConfirmReceivedCodeRepo>(
      () => ConfirmReceivedCodeRepoImpl(dio: sl()));
  sl.registerFactory<ExistsUserRepo>(() => ExistsUserRepoImpl(dio: sl()));
  sl.registerFactory<PinCodeRepo>(() => PinCodeRepoImpl(dio: sl()));
  sl.registerFactory<SendResetPinCodeRepo>(
      () => SendResetPinCodeRepoImpl(dio: sl()));
  sl.registerFactory<ResetPinCodeTokenRepo>(
      () => ResetPinCodeTokenRepoImpl(dio: sl()));
  sl.registerFactory<ResetPasswordRepo>(() => ResetPasswordRepoImpl(dio: sl()));
  sl.registerFactory<ResetPasswordTokenRepo>(
      () => ResetPasswordTokenRepoImpl(dio: sl()));
  sl.registerFactory<SetNewPasswordRepo>(
      () => SetNewPasswordRepoImpl(dio: sl()));
  sl.registerFactory<ExitRepo>(() => ExitRepoImpl(dio: sl()));
  sl.registerFactory<CheckHasIPRepo>(() => CheckHasIPRepoImpl(dio: sl()));
  sl.registerFactory<GRNPRepo>(() => GRNPRepoImpl(dio: sl()));
  sl.registerFactory<GetClientInfoRepo>(() => GetClientInfoRepoImpl(dio: sl()));
  sl.registerFactory<CreateAccountRepo>(() => CreateAccountRepoImpl(dio: sl()));
  sl.registerFactory<RegisterClientRepo>(
      () => RegisterClientRepoImpl(dio: sl()));
  sl.registerFactory<GenerateQrRepo>(() => GenerateQrRepoImpl(sl(), sl()));
  sl.registerFactory<GetClientPassportRepo>(
      () => GetClientPassportRepoImpl(dio: sl()));
  sl.registerFactory<CheckGrnpRepo>(() => CheckGrnpRepoImpl(dio: sl()));
  sl.registerFactory<EsiaGetTermsRepo>(() => EsiaGetTermsRepoImpl(dio: sl()));

  /// UseCases
  sl.registerLazySingleton<RegisterOEPUseCase>(
      () => RegisterOEPUseCase(repo: sl()));
  sl.registerFactory<GetTermsUseCase>(() => GetTermsUseCase(repo: sl()));
  sl.registerLazySingleton<GetUserInfoUseCase>(
      () => GetUserInfoUseCase(repo: sl()));
  sl.registerFactory<TaxAndSelectedModesUseCase>(
      () => TaxAndSelectedModesUseCase(repo: sl()));
  sl.registerFactory<GetGnsPdfUseCase>(() => GetGnsPdfUseCase(repo: sl()));
  sl.registerFactory<GetPinCodeReceivingUseCase>(
      () => GetPinCodeReceivingUseCase(repo: sl()));
  sl.registerFactory<SendOtpUseCase>(() => SendOtpUseCase(repo: sl()));
  sl.registerLazySingleton<AuthUseCase>(() => AuthUseCase(repo: sl()));
  sl.registerLazySingleton<GetConfirmCodeUseCase>(
      () => GetConfirmCodeUseCase(repo: sl()));
  sl.registerLazySingleton<ConfirmReceivedCodeUseCase>(
      () => ConfirmReceivedCodeUseCase(repo: sl()));
  sl.registerLazySingleton<ExistsUserUseCase>(
      () => ExistsUserUseCase(repo: sl()));
  sl.registerFactory<PinCodeUseCase>(
      () => PinCodeUseCase(repo: sl(), prefs: sl()));
  sl.registerFactory<SendResetPinCodeUseCase>(
      () => SendResetPinCodeUseCase(repo: sl()));
  sl.registerLazySingleton<ResetPinCodeTokenUseCase>(
      () => ResetPinCodeTokenUseCase(repo: sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(repo: sl()));
  sl.registerLazySingleton<ResetPasswordTokenUseCase>(
      () => ResetPasswordTokenUseCase(repo: sl()));
  sl.registerLazySingleton<SetNewPasswordUseCase>(
      () => SetNewPasswordUseCase(repo: sl()));
  sl.registerLazySingleton<ExitUseCase>(
      () => ExitUseCase(repo: sl(), prefs: sl()));
  sl.registerLazySingleton<CheckHasIPUseCase>(
      () => CheckHasIPUseCase(repo: sl()));
  sl.registerLazySingleton<GRNPUseCase>(() => GRNPUseCase(repo: sl()));
  sl.registerLazySingleton<GetClientInfoUseCase>(
      () => GetClientInfoUseCase(repo: sl()));
  sl.registerLazySingleton<CreateAccountUseCase>(
      () => CreateAccountUseCase(repo: sl()));
  sl.registerLazySingleton<RegisterClientUseCase>(
      () => RegisterClientUseCase(repo: sl()));
  sl.registerLazySingleton<GenerateQrUseCase>(
      () => GenerateQrUseCase(repo: sl()));
  sl.registerLazySingleton<GetClientPassportUseCase>(
      () => GetClientPassportUseCase(repo: sl()));
  sl.registerFactory<CheckGrnpUseCase>(() => CheckGrnpUseCase(repo: sl()));
  sl.registerFactory<EsiaGetTermsUseCase>(
      () => EsiaGetTermsUseCase(repo: sl()));

  /// BLoCs / Cubits

  sl.registerFactory<SplashCubit>(
      () => SplashCubit(useCase: sl(), prefs: sl()));
  sl.registerFactory<BottomNavigatorCubit>(() => BottomNavigatorCubit());
  sl.registerFactory<RegisterOepCubit>(() => RegisterOepCubit(useCase: sl()));
  sl.registerFactory<GetTermsCubit>(() => GetTermsCubit(useCase: sl()));
  sl.registerFactory<CheckHasIpCubit>(() => CheckHasIpCubit(useCase: sl()));
  sl.registerFactory<GetUserInfoCubit>(() => GetUserInfoCubit(useCase: sl()));
  sl.registerFactory<TaxAndSelectedModesCubit>(
      () => TaxAndSelectedModesCubit(useCase: sl()));
  sl.registerFactory<SearchVidDeatelnostCubit>(
      () => SearchVidDeatelnostCubit());
  sl.registerFactory<GetGnsPdfCubit>(() => GetGnsPdfCubit(useCase: sl()));
  sl.registerFactory<GetPinCodeReceivingCubit>(
      () => GetPinCodeReceivingCubit(useCase: sl()));
  sl.registerFactory<SendOtpCubit>(() => SendOtpCubit(useCase: sl()));
  sl.registerFactory<ConfirmOtpCubit>(() => ConfirmOtpCubit(useCase: sl()));
  sl.registerFactory<TimerCubit>(() => TimerCubit());
  sl.registerFactory<AuthCubit>(() => AuthCubit(useCase: sl(), prefs: sl()));
  sl.registerFactory<GetConfirmCodeCubit>(
      () => GetConfirmCodeCubit(useCase: sl()));
  sl.registerFactory<ConfirmReceivedCodeCubit>(
      () => ConfirmReceivedCodeCubit(useCase: sl()));
  sl.registerFactory<SetPinCodeCubit>(() => SetPinCodeCubit(useCase: sl()));
  sl.registerFactory<EnterPinCodeCubit>(() => EnterPinCodeCubit(
        useCase: sl(),
        grnpUseCase: sl(),
      ));
  sl.registerFactory<SendResetPinCodeCubit>(
      () => SendResetPinCodeCubit(useCase: sl()));
  sl.registerFactory<BiometricCubit>(
      () => BiometricCubit(useCase: sl(), prefs: sl()));
  sl.registerFactory<ResetPinCodeTokenCubit>(
      () => ResetPinCodeTokenCubit(useCase: sl()));
  sl.registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(useCase: sl()));
  sl.registerFactory<ResetPasswordTokenCubit>(
      () => ResetPasswordTokenCubit(useCase: sl()));
  sl.registerFactory<SetNewPasswordCubit>(
      () => SetNewPasswordCubit(useCase: sl()));
  sl.registerFactory<ExitCubit>(() => ExitCubit(useCase: sl()));
  sl.registerFactory<GRNPCubit>(() => GRNPCubit(useCase: sl()));
  sl.registerFactory<GetClientInfoCubit>(
      () => GetClientInfoCubit(useCase: sl()));
  sl.registerFactory<CreateAccountCubit>(
      () => CreateAccountCubit(useCase: sl()));
  sl.registerFactory<RegitserClientCubit>(
      () => RegitserClientCubit(useCase: sl(), accountUseCase: sl()));
  sl.registerFactory<GenerateQrCubit>(
      () => GenerateQrCubit(useCase: sl(), accountsCase: sl()));
  sl.registerFactory<GetClientPassportCubit>(
      () => GetClientPassportCubit(useCase: sl()));
  sl.registerFactory<GetMyIpCubit>(() => GetMyIpCubit(useCase: sl()));
  sl.registerFactory<CheckBankCubit>(() => CheckBankCubit(useCase: sl()));
  sl.registerFactory<EsiaTermsCubit>(() => EsiaTermsCubit(useCase: sl()));
}
