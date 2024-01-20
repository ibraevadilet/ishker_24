import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:ishker_24/features/bottom_navigator/logic/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/check_has_ip_cubit/check_has_ip_cubit.dart';
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
import 'package:ishker_24/features/register_oep/data/repo_implements/get_terms_repo_impl.dart';
import 'package:ishker_24/features/register_oep/data/repo_implements/register_oep_repo_impl.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/get_terms_repository.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/register_oep_repo.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/get_terms_usecase.dart';
import 'package:ishker_24/features/register_oep/domain/use_cases/register_oep_use_case.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/get_terms_cubit/get_terms_cubit.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/register_oep_cubit/register_oep_cubit.dart';
import 'package:ishker_24/features/splash/splash_cubit/splash_cubit.dart';
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

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => DioSettings(prefs: sl()).dio);
  sl.registerSingleton<AppRouter>(AppRouter());

  /// Repository
  sl.registerFactory<RegisterOEPRepo>(() => RegisterOEPRepoImpl(dio: sl()));
  sl.registerFactory<GetTermsRepo>(() => GetTermsRepoImpl(dio: sl()));
  sl.registerFactory<GetUserInfoRepo>(() => GetUserInfoRepoImpl(dio: sl()));
  sl.registerFactory<TaxAndSelectedModesRepo>(
      () => TaxAndSelectedModesRepoImpl(dio: sl()));
  sl.registerFactory<GetGnsPdfRepo>(() => GetGnsPdfRepoImpl(dio: sl()));
  sl.registerFactory<GetPinCodeReceivingRepo>(
      () => GetPinCodeReceivingRepoImpl(dio: sl()));
  sl.registerFactory<SendOtpRepo>(() => SendOtpRepoImpl(dio: sl()));

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

  /// BLoCs / Cubits

  sl.registerFactory<SplashCubit>(() => SplashCubit(prefs: sl()));
  sl.registerFactory<BottomNavigatorCubit>(() => BottomNavigatorCubit());
  sl.registerFactory<RegisterOepCubit>(() => RegisterOepCubit(useCase: sl()));
  sl.registerFactory<GetTermsCubit>(() => GetTermsCubit(useCase: sl()));
  sl.registerFactory<CheckHasIpCubit>(() => CheckHasIpCubit());
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
}
