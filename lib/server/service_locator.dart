import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:ishker_24/features/bottom_navigator/logic/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/check_has_ip_cubit/check_has_ip_cubit.dart';
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

  /// UseCases
  sl.registerLazySingleton<RegisterOEPUseCase>(
      () => RegisterOEPUseCase(repo: sl()));
  sl.registerLazySingleton<GetTermsUseCase>(() => GetTermsUseCase(repo: sl()));

  /// BLoCs / Cubits

  sl.registerFactory<SplashCubit>(() => SplashCubit(prefs: sl()));
  sl.registerFactory<BottomNavigatorCubit>(() => BottomNavigatorCubit());
  sl.registerFactory<RegisterOepCubit>(() => RegisterOepCubit(useCase: sl()));
  sl.registerFactory<GetTermsCubit>(() => GetTermsCubit(useCase: sl()));
  sl.registerFactory<CheckHasIpCubit>(() => CheckHasIpCubit());
}
