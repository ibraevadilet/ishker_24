import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:ishker_24/features/account/data/repositories/account_repo_impl.dart';
import 'package:ishker_24/features/account/domain/repositories/account_repo.dart';
import 'package:ishker_24/features/account/domain/usecases/account_info_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
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
import 'package:ishker_24/features/esf/data/repo_impls/esf_check_repo_impl.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';
import 'package:ishker_24/features/esf/data/repo_impls/save_token_repo_impl.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_check_repository.dart';
import 'package:ishker_24/features/esf/domain/repositories/esf_invoice_repository.dart';
import 'package:ishker_24/features/esf/domain/repositories/save_token_repository.dart';
import 'package:ishker_24/features/esf/domain/usecases/esf_check_usecase.dart';
import 'package:ishker_24/features/esf/domain/usecases/esf_invoice_usecase.dart';
import 'package:ishker_24/features/esf/domain/usecases/save_token_usecase.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_accept_cubit/esf_accept_cubit.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_check_cubit/esf_check_cubit.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_invoice_cubit/esf_invoice_cubit.dart';
import 'package:ishker_24/features/esf/presentation/cubits/save_token_cubit/save_token_cubit.dart';
import 'package:ishker_24/features/grnp_check/data/repositories_impl/grnp_repo_impl.dart';
import 'package:ishker_24/features/grnp_check/domain/repositories/grnp_repository.dart';
import 'package:ishker_24/features/grnp_check/domain/use_case/grnp_use_case.dart';
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/cubits/grnp_cubit/grnp_cubit.dart';
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/cubits/pesonal_data_cubit/personal_data_cubit.dart';
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/cubits/public_offer_cubit/public_offer_cubit.dart';
import 'package:ishker_24/features/home/data/repo_implements/check_has_ip_repo_impl.dart';
import 'package:ishker_24/features/home/data/repo_implements/get_client_info_repo_impl.dart';
import 'package:ishker_24/features/home/domain/repositories/check_has_ip_repository.dart';
import 'package:ishker_24/features/home/domain/repositories/get_client_info_repository.dart';
import 'package:ishker_24/features/home/domain/use_cases/check_has_ip_use_case.dart';
import 'package:ishker_24/features/home/domain/use_cases/get_client_info_usecase.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/check_has_ip_cubit/check_has_ip_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/get_client_info_cubit/get_client_info_cubit.dart';
import 'package:ishker_24/features/megakassa/data/repo_implements/megakassa_repo_impl.dart';
import 'package:ishker_24/features/megakassa/domain/repositories/megakassa_repository.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_kkm_detail_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_kkm_list_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_profile_info_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_status_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_steps_info_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/gns_get_confirmation_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/gns_registration_methods_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/gns_registration_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/kkm_registration_usecase.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_confirmation/cubit/gns_confirmation_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_registration/cubit/gns_registration_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_detail/cubit/get_kkm_detail_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_list/cubit/get_kkm_list_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_registration/cubit/kkm_registration_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_registration_steps/cubits/get_steps_info_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/megakassa_entry/cubit/get_megakassa_status_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/my_profile/cubit/get_profile_info_cubit.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/get_my_ip_cubit/get_my_ip_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/data/repo_implements/generate_pdf_review_repo_impl.dart';
import 'package:ishker_24/features/nalog_decloration/data/repo_implements/get_my_reports_repo_impl.dart';
import 'package:ishker_24/features/nalog_decloration/data/repo_implements/get_nalog_names_repo_impl.dart';
import 'package:ishker_24/features/nalog_decloration/data/repo_implements/get_static_fields_repo_impl.dart';
import 'package:ishker_24/features/nalog_decloration/data/repo_implements/report_detail_pdf_repo_impl.dart';
import 'package:ishker_24/features/nalog_decloration/data/repo_implements/send_nalog_data_repo_impl.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/generate_pdf_review_repository.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_my_reports_repository.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_nalog_names_repository.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_static_fields_repository.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/report_detail_pdf_repository.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/send_nalog_data_repository.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/generate_pdf_review_usecase.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/get_my_reports_usecase.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/get_nalog_names_usecase.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/get_static_fields_usecase.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/report_detail_pdf_usecase.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/send_nalog_data_usecase.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/cubits/get_my_reports_cubit/get_my_reports_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/cubits/get_nalog_names_cubit/get_nalog_names_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/cubits/get_report_deteil_pdf_cubit/get_report_deteil_pdf_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/generate_pdf_review_cubit/generate_pdf_review_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/get_statis_fileds_cubit/get_statis_fileds_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/send_saved_data_cubit/send_saved_data_cubit.dart';
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
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/exit_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/get_confirm_code_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/repo_implements/pin_code_repo_impl.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/auth_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/check_grnp_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/confirm_received_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/exit_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/get_confirm_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/repositories/pin_code_repository.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/auth_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/check_grnp_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/confirm_received_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/exit_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_confirm_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_tokens_use_case.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/pin_code_usecase.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_confirm_code_screen/cubits/confirm_received_code_cubit/confirm_received_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/cubits/auth_cubit/auth_cubit.dart';
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

  /// Other Services
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => DioSettings(prefs: sl()).dio);
  sl.registerSingleton<AppRouter>(AppRouter());

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
  sl.registerFactory<GenerateQrRepo>(() => GenerateQrRepoImpl(dio: sl()));
  sl.registerFactory<GetClientPassportRepo>(
      () => GetClientPassportRepoImpl(dio: sl()));
  sl.registerFactory<CheckGrnpRepo>(() => CheckGrnpRepoImpl(dio: sl()));
  sl.registerFactory<AccountRepo>(() => AccountRepoImpl(dio: sl()));
  sl.registerFactory<GetStaticFieldsRepo>(
      () => GetStaticFieldsRepoImpl(dio: sl()));
  sl.registerFactory<GetNalogNamesRepo>(() => GetNalogNamesRepoImpl(dio: sl()));
  sl.registerFactory<SendNalogDataRepo>(() => SendNalogDataRepoImpl(dio: sl()));
  sl.registerFactory<EsfCheckRepo>(() => EsfCheckRepoImpl(dio: sl()));
  sl.registerFactory<EsfInvoiceRepo>(() => EsfInvoiceRepoImpl(dio: sl()));
  sl.registerFactory<GetMyReportsRepo>(() => GetMyReportsRepoImpl(dio: sl()));
  sl.registerFactory<ReportDetailPdfRepo>(
      () => ReportDetailPdfRepoImpl(dio: sl()));
  sl.registerFactory<GeneratePdfReviewRepo>(
      () => GeneratePdfReviewRepoImpl(dio: sl()));
  sl.registerFactory<SaveTokenRepo>(() => SaveTokenRepoImpl(dio: sl()));

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
  sl.registerLazySingleton<GetTokensUseCase>(
      () => GetTokensUseCase(repo: sl(), prefs: sl()));
  sl.registerLazySingleton<HistoryUseCase>(() => HistoryUseCase(sl()));
  sl.registerLazySingleton<AccountInfoUseCase>(
    () => AccountInfoUseCase(repo: sl()),
  );
  sl.registerFactory<GetStaticFieldsUseCase>(
      () => GetStaticFieldsUseCase(repo: sl()));
  sl.registerFactory<GetNalogNamesUseCase>(
      () => GetNalogNamesUseCase(repo: sl()));
  sl.registerFactory<SendNalogDataUseCase>(
      () => SendNalogDataUseCase(repo: sl()));
  sl.registerLazySingleton<EsfCheckUseCase>(() => EsfCheckUseCase(repo: sl()));
  sl.registerLazySingleton<EsfInvoiceUseCase>(
      () => EsfInvoiceUseCase(repo: sl()));
  sl.registerFactory<GetMyReportsUseCase>(
      () => GetMyReportsUseCase(repo: sl()));
  sl.registerFactory<ReportDetailPdfUseCase>(
      () => ReportDetailPdfUseCase(repo: sl()));
  sl.registerFactory<GeneratePdfReviewUseCase>(
      () => GeneratePdfReviewUseCase(repo: sl()));
  sl.registerFactory<SaveTokenUseCase>(() => SaveTokenUseCase(repo: sl()));

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
  sl.registerFactory<AuthCubit>(
      () => AuthCubit(useCase: sl(), prefs: sl(), tokenseCase: sl()));
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
  sl.registerFactory<PublicOfferCubit>(() => PublicOfferCubit());
  sl.registerFactory<PersonalDataCubit>(() => PersonalDataCubit());
  sl.registerFactory<GetStatisFiledsCubit>(
      () => GetStatisFiledsCubit(useCase: sl()));
  sl.registerFactory<GetNalogNamesCubit>(
      () => GetNalogNamesCubit(useCase: sl()));
  sl.registerFactory<SendSavedDataCubit>(
      () => SendSavedDataCubit(useCase: sl()));
  sl.registerFactory<EsfCheckCubit>(() => EsfCheckCubit(useCase: sl()));
  sl.registerFactory<SaveTokenCubit>(() => SaveTokenCubit(useCase: sl()));
  sl.registerFactory<EsfInvoiceCubit>(() => EsfInvoiceCubit(useCase: sl()));
  sl.registerFactory<GetMyReportsCubit>(() => GetMyReportsCubit(useCase: sl()));
  sl.registerFactory<GetReportDeteilPdfCubit>(
      () => GetReportDeteilPdfCubit(useCase: sl()));
  sl.registerFactory<GeneratePdfReviewCubit>(
      () => GeneratePdfReviewCubit(useCase: sl()));
  sl.registerFactory<EsfAcceptCubit>(() => EsfAcceptCubit(useCase: sl()));

  _registerMegaKassaDependecies();
}

Future<void> _registerMegaKassaDependecies() async {
  sl.registerFactory<MegaKassaRepo>(() => MegaKassaRepoImpl(dio: sl()));

  sl.registerFactory<MegaKassaGetStatusUseCase>(
      () => MegaKassaGetStatusUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGnsRegistrationUseCase>(
      () => MegaKassaGnsRegistrationUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGetProfileInfoUseCase>(
      () => MegaKassaGetProfileInfoUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGetKkmListUseCase>(
      () => MegaKassaGetKkmListUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGetKkmDetailUseCase>(
      () => MegaKassaGetKkmDetailUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGetStepsInfoUseCase>(
      () => MegaKassaGetStepsInfoUseCase(repo: sl()));
  sl.registerFactory<MegaKassaKkmRegistrationUseCase>(
      () => MegaKassaKkmRegistrationUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGnsRegistrationMethodsUseCase>(
      () => MegaKassaGnsRegistrationMethodsUseCase(repo: sl()));
  sl.registerFactory<MegaKassaGnsGetConfirmationUseCase>(
      () => MegaKassaGnsGetConfirmationUseCase(repo: sl()));

  sl.registerFactory<MegaKassaGetMegaKassaStatusCubit>(
      () => MegaKassaGetMegaKassaStatusCubit(useCase: sl()));
  sl.registerFactory<MegaKassaGnsRegistrationCubit>(
      () => MegaKassaGnsRegistrationCubit(
            useCase: sl(),
            methodsUseCase: sl(),
          ));
  sl.registerFactory<MegaKassaGetProfileInfoCubit>(
      () => MegaKassaGetProfileInfoCubit(useCase: sl()));
  sl.registerFactory<MegaKassaGetKkmListCubit>(
      () => MegaKassaGetKkmListCubit(useCase: sl()));
  sl.registerFactory<MegaKassaGetKkmDetailCubit>(
      () => MegaKassaGetKkmDetailCubit(useCase: sl()));
  sl.registerFactory<MegaKassaGetStepsInfoCubit>(
      () => MegaKassaGetStepsInfoCubit(useCase: sl()));
  sl.registerFactory<MegaKassaKkmRegistrationCubit>(
      () => MegaKassaKkmRegistrationCubit(useCase: sl()));
  sl.registerFactory<MegaKassaGnsConfirmationCubit>(
      () => MegaKassaGnsConfirmationCubit(useCase: sl()));
}
