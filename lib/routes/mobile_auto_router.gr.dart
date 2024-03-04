// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i65;
import 'package:camera/camera.dart' as _i70;
import 'package:flutter/cupertino.dart' as _i75;
import 'package:flutter/material.dart' as _i66;
import 'package:ishker_24/features/account/presentation/info/account_info_screen.dart'
    as _i2;
import 'package:ishker_24/features/account/presentation/history/history_screen.dart'
    as _i22;
import 'package:ishker_24/features/bank/presentation/account_detail_screen/account_detail_screen.dart'
    as _i1;
import 'package:ishker_24/features/bank/presentation/card_detail_screen/card_detail_screen.dart'
    as _i7;
import 'package:ishker_24/features/bank/presentation/card_detail_screen/card_operation_history_screen/card_operation_history_screen.dart'
    as _i8;
import 'package:ishker_24/features/bank/presentation/create_account_screen/create_account_finish_screen.dart'
    as _i10;
import 'package:ishker_24/features/bank/presentation/create_account_screen/create_account_last_screen.dart'
    as _i11;
import 'package:ishker_24/features/bank/presentation/create_account_screen/create_account_screen.dart'
    as _i12;
import 'package:ishker_24/features/bank/presentation/create_account_screen/go_bank_screen.dart'
    as _i17;
import 'package:ishker_24/features/bank/presentation/create_account_screen/open_account_screen.dart'
    as _i38;
import 'package:ishker_24/features/bottom_navigator/bottom_navigator_screen.dart'
    as _i6;
import 'package:ishker_24/features/esf/data/models/esf_model.dart' as _i68;
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart'
    as _i69;
import 'package:ishker_24/features/esf/presentation/screens/esf_reports_screen/esf_reports_detail_screen.dart'
    as _i13;
import 'package:ishker_24/features/esf/presentation/screens/esf_reports_screen/esf_reports_screen.dart'
    as _i14;
import 'package:ishker_24/features/esf/presentation/screens/esf_screen.dart'
    as _i15;
import 'package:ishker_24/features/grnp_check/presentation/grnp_camera_screen/grnp_camera_screen.dart'
    as _i18;
import 'package:ishker_24/features/grnp_check/presentation/grnp_camera_screen/grnp_selfie_ident_screen.dart'
    as _i21;
import 'package:ishker_24/features/grnp_check/presentation/grnp_camera_screen/grnp_selife_preview_screen.dart'
    as _i20;
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/grnp_screen.dart'
    as _i19;
import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart'
    as _i79;
import 'package:ishker_24/features/kkm/presentation/screens/kkm_screen.dart'
    as _i23;
import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart'
    as _i72;
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart'
    as _i74;
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart'
    as _i73;
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_first_entity.dart'
    as _i76;
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_second_entity.dart'
    as _i77;
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_third_entity.dart'
    as _i78;
import 'package:ishker_24/features/megakassa/presentation/gns_confirmation/gns_confirmation_screen.dart'
    as _i25;
import 'package:ishker_24/features/megakassa/presentation/kkm_detail/kkm_detail_screen.dart'
    as _i26;
import 'package:ishker_24/features/megakassa/presentation/kkm_list/kkm_list_screen.dart'
    as _i27;
import 'package:ishker_24/features/megakassa/presentation/kkm_registration/kkm_registration_screen.dart'
    as _i28;
import 'package:ishker_24/features/megakassa/presentation/kkm_registration_steps/screens/kkm_registration_step_first_screen.dart'
    as _i29;
import 'package:ishker_24/features/megakassa/presentation/kkm_registration_steps/screens/kkm_registration_step_second_screen.dart'
    as _i30;
import 'package:ishker_24/features/megakassa/presentation/kkm_registration_steps/screens/kkm_registration_step_third_screen.dart'
    as _i31;
import 'package:ishker_24/features/megakassa/presentation/megakassa_entry/megakassa_entry_screen.dart'
    as _i24;
import 'package:ishker_24/features/megakassa/presentation/my_profile/my_profile_screen.dart'
    as _i32;
import 'package:ishker_24/features/my_ip/presentation/my_certificate_screen/my_certficate_screen.dart'
    as _i33;
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart'
    as _i81;
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/main_screen.dart'
    as _i34;
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/widgets/report_detail_pdf_view_screen.dart'
    as _i56;
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/screens/screen_91_4.dart'
    as _i57;
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/screens/screen_91_4_1.dart'
    as _i58;
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/screens/screen_91_4_2.dart'
    as _i59;
import 'package:ishker_24/features/pdf_view_screen.dart' as _i39;
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart'
    as _i71;
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart'
    as _i80;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_confirm_oep_screen.dart'
    as _i53;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_main_screen.dart'
    as _i50;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_next_screen.dart'
    as _i51;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_select_modes_screen.dart'
    as _i54;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_signin_screen.dart'
    as _i55;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_type_of_activity_screen.dart'
    as _i52;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/ces_selfie_ident_screen.dart'
    as _i9;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/oep_camera_screen.dart'
    as _i35;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/selife_preview_screen.dart'
    as _i60;
import 'package:ishker_24/features/register_oep/presentation/oep_finish_screen/oep_finish_screen.dart'
    as _i36;
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/oep_register_screen.dart'
    as _i37;
import 'package:ishker_24/features/settings/presentation/settings_about_screen/settings_about_screen.dart'
    as _i61;
import 'package:ishker_24/features/settings/presentation/settings_help_screen/settings_help_screen.dart'
    as _i62;
import 'package:ishker_24/features/splash/splash_screen.dart' as _i63;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart'
    as _i67;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_confirm_code_screen/auth_confirm_code_screen.dart'
    as _i3;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/auth_screen.dart'
    as _i4;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/auth_send_confirm_screen.dart'
    as _i5;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/error_screen/error_screen.dart'
    as _i16;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_create_screen/pin_code_create_screen.dart'
    as _i40;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/pin_code_enter_screen.dart'
    as _i41;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_repeat_screen/pin_code_repeat_screen.dart'
    as _i42;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_choise_type_screen/recovery_password_choise_type_screen.dart'
    as _i43;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_inn_screen/recovery_password_enter_inn_screen.dart'
    as _i44;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_new_password_screen/recovery_password_enter_new_password_screen.dart'
    as _i45;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_sms_code_screen/recovery_password_enter_sms_code_screen.dart'
    as _i46;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/recovery_pin_code_choise_type_screen.dart'
    as _i47;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_esi_password_screen/recovery_pin_code_enter_esi_password_screen.dart'
    as _i48;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_sms_code_screen/recovery_pin_code_enter_sms_code_screen.dart'
    as _i49;
import 'package:ishker_24/widgets/success_or_failure_screen.dart' as _i64;

abstract class $AppRouter extends _i65.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i65.PageFactory> pagesMap = {
    AccountDetailRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountDetailScreen(),
      );
    },
    AccountInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AccountInfoRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AccountInfoScreen(
          key: args.key,
          account: args.account,
        ),
      );
    },
    AuthConfirmCodeRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthConfirmCodeScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthScreen(),
      );
    },
    AuthSendConfirmRoute.name: (routeData) {
      final args = routeData.argsAs<AuthSendConfirmRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AuthSendConfirmScreen(
          key: args.key,
          authModel: args.authModel,
        ),
      );
    },
    BottomNavigatorRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.BottomNavigatorScreen(),
      );
    },
    CardDetailRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CardDetailScreen(),
      );
    },
    CardOperationHistoryRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CardOperationHistoryScreen(),
      );
    },
    CesSelfieRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CesSelfieScreen(),
      );
    },
    CreateAccountFinishRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountFinishRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.CreateAccountFinishScreen(
          key: args.key,
          accountNumber: args.accountNumber,
        ),
      );
    },
    CreateAccountLastRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CreateAccountLastScreen(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CreateAccountScreen(),
      );
    },
    EsfReportsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EsfReportsDetailRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.EsfReportsDetailScreen(
          key: args.key,
          invoice: args.invoice,
          type: args.type,
        ),
      );
    },
    EsfReportsRoute.name: (routeData) {
      final args = routeData.argsAs<EsfReportsRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.EsfReportsScreen(
          key: args.key,
          type: args.type,
          title: args.title,
        ),
      );
    },
    EsfRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.EsfScreen(),
      );
    },
    EsiErrorRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.EsiErrorScreen(),
      );
    },
    GoBankRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.GoBankScreen(),
      );
    },
    GrnpCameraRoute.name: (routeData) {
      final args = routeData.argsAs<GrnpCameraRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.GrnpCameraScreen(
          key: args.key,
          description: args.description,
        ),
      );
    },
    GrnpCheckRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.GrnpCheckScreen(),
      );
    },
    GrnpSelfiePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<GrnpSelfiePreviewRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.GrnpSelfiePreviewScreen(
          args.path,
          args.onCheck,
          key: args.key,
        ),
      );
    },
    GrnpSelfieRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.GrnpSelfieScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.HistoryScreen(
          key: args.key,
          account: args.account,
        ),
      );
    },
    KKMRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.KKMScreen(),
      );
    },
    MegaKassaEntryRoute.name: (routeData) {
      final args = routeData.argsAs<MegaKassaEntryRouteArgs>(
          orElse: () => const MegaKassaEntryRouteArgs());
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.MegaKassaEntryScreen(
          key: args.key,
          isAfterRegistration: args.isAfterRegistration,
        ),
      );
    },
    MegaKassaGnsConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<MegaKassaGnsConfirmationRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.MegaKassaGnsConfirmationScreen(
          key: args.key,
          types: args.types,
          registrationEntity: args.registrationEntity,
          registrationKkmEntity: args.registrationKkmEntity,
        ),
      );
    },
    MegaKassaKkmDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MegaKassaKkmDetailRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.MegaKassaKkmDetailScreen(
          key: args.key,
          cashbox: args.cashbox,
        ),
      );
    },
    MegaKassaKkmListRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.MegaKassaKkmListScreen(),
      );
    },
    MegaKassaKkmRegistrationRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.MegaKassaKkmRegistrationScreen(),
      );
    },
    MegaKassaKkmRegistrationStep1Route.name: (routeData) {
      final args = routeData.argsAs<MegaKassaKkmRegistrationStep1RouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.MegaKassaKkmRegistrationStep1Screen(
          key: args.key,
          stepEntity: args.stepEntity,
        ),
      );
    },
    MegaKassaKkmRegistrationStep2Route.name: (routeData) {
      final args = routeData.argsAs<MegaKassaKkmRegistrationStep2RouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.MegaKassaKkmRegistrationStep2Screen(
          key: args.key,
          stepEntity: args.stepEntity,
        ),
      );
    },
    MegaKassaKkmRegistrationStep3Route.name: (routeData) {
      final args = routeData.argsAs<MegaKassaKkmRegistrationStep3RouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.MegaKassaKkmRegistrationStep3Screen(
          key: args.key,
          stepEntity: args.stepEntity,
        ),
      );
    },
    MegaKassaMyProfileRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.MegaKassaMyProfileScreen(),
      );
    },
    MyCertficateRoute.name: (routeData) {
      final args = routeData.argsAs<MyCertficateRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.MyCertficateScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    NalogMainRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.NalogMainScreen(),
      );
    },
    OEPCameraRoute.name: (routeData) {
      final args = routeData.argsAs<OEPCameraRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.OEPCameraScreen(
          key: args.key,
          description: args.description,
        ),
      );
    },
    OEPFinishRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.OEPFinishScreen(),
      );
    },
    OEPRegisterRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.OEPRegisterScreen(),
      );
    },
    OpenAccountRoute.name: (routeData) {
      final args = routeData.argsAs<OpenAccountRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.OpenAccountScreen(
          key: args.key,
          partyId: args.partyId,
        ),
      );
    },
    PdfViewRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.PdfViewScreen(
          key: args.key,
          path: args.path,
          isNetwork: args.isNetwork,
          title: args.title,
        ),
      );
    },
    PinCodeCreateRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeCreateRouteArgs>(
          orElse: () => const PinCodeCreateRouteArgs());
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.PinCodeCreateScreen(
          key: args.key,
          isNewPin: args.isNewPin,
        ),
      );
    },
    PinCodeEnterRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeEnterRouteArgs>(
          orElse: () => const PinCodeEnterRouteArgs());
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i41.PinCodeEnterScreen(
          key: args.key,
          isPushed: args.isPushed,
        ),
      );
    },
    PinCodeRepeatRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeRepeatRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i42.PinCodeRepeatScreen(
          key: args.key,
          firstPin: args.firstPin,
          isNewPin: args.isNewPin,
        ),
      );
    },
    RecoveryPasswordChoiseTypeRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i43.RecoveryPasswordChoiseTypeScreen(),
      );
    },
    RecoveryPasswordEnterInnRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPasswordEnterInnRouteArgs>(
          orElse: () => const RecoveryPasswordEnterInnRouteArgs());
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i44.RecoveryPasswordEnterInnScreen(
          key: args.key,
          isSmsRecovery: args.isSmsRecovery,
        ),
      );
    },
    RecoveryPasswordEnterNewPasswordRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.RecoveryPasswordEnterNewPasswordScreen(),
      );
    },
    RecoveryPasswordEnterSmsCodeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPasswordEnterSmsCodeRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i46.RecoveryPasswordEnterSmsCodeScreen(
          key: args.key,
          isSmsRecovery: args.isSmsRecovery,
          contact: args.contact,
        ),
      );
    },
    RecoveryPinCodeChoiseTypeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPinCodeChoiseTypeRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i47.RecoveryPinCodeChoiseTypeScreen(
          key: args.key,
          password: args.password,
        ),
      );
    },
    RecoveryPinCodeEnterEsiPasswordRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.RecoveryPinCodeEnterEsiPasswordScreen(),
      );
    },
    RecoveryPinCodeEnterSmsCodeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPinCodeEnterSmsCodeRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i49.RecoveryPinCodeEnterSmsCodeScreen(
          key: args.key,
          method: args.method,
          userId: args.userId,
        ),
      );
    },
    RegisterIPMainRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i50.RegisterIPMainScreen(),
      );
    },
    RegisterIPNextRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIPNextRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i51.RegisterIPNextScreen(
          key: args.key,
          isPatent: args.isPatent,
        ),
      );
    },
    RegisterIPTypeOfActivityRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIPTypeOfActivityRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i52.RegisterIPTypeOfActivityScreen(
          key: args.key,
          models: args.models,
        ),
      );
    },
    RegisterIpConfirmOepRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.RegisterIpConfirmOepScreen(),
      );
    },
    RegisterIpSelectModesRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIpSelectModesRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i54.RegisterIpSelectModesScreen(
          key: args.key,
          models: args.models,
        ),
      );
    },
    RegisterIpSigninRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i55.RegisterIpSigninScreen(),
      );
    },
    ReportDetailPdfViewRoute.name: (routeData) {
      final args = routeData.argsAs<ReportDetailPdfViewRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i56.ReportDetailPdfViewScreen(
          key: args.key,
          reportId: args.reportId,
        ),
      );
    },
    Route914.name: (routeData) {
      final args = routeData.argsAs<Route914Args>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i57.Screen914(
          key: args.key,
          model: args.model,
        ),
      );
    },
    Route9141.name: (routeData) {
      final args = routeData.argsAs<Route9141Args>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i58.Screen9141(
          key: args.key,
          model: args.model,
        ),
      );
    },
    Route9142.name: (routeData) {
      final args = routeData.argsAs<Route9142Args>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i59.Screen9142(
          key: args.key,
          model: args.model,
        ),
      );
    },
    SelfiePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<SelfiePreviewRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i60.SelfiePreviewScreen(
          args.path,
          args.onCheck,
          key: args.key,
        ),
      );
    },
    SettingsAboutRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i61.SettingsAboutScreen(),
      );
    },
    SettingsHelpRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i62.SettingsHelpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i63.SplashScreen(),
      );
    },
    SuccessOrFailureRoute.name: (routeData) {
      final args = routeData.argsAs<SuccessOrFailureRouteArgs>();
      return _i65.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i64.SuccessOrFailureScreen(
          key: args.key,
          onPress: args.onPress,
          title: args.title,
          subtitle: args.subtitle,
          buttonText: args.buttonText,
          isSuccess: args.isSuccess,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountDetailScreen]
class AccountDetailRoute extends _i65.PageRouteInfo<void> {
  const AccountDetailRoute({List<_i65.PageRouteInfo>? children})
      : super(
          AccountDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDetailRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AccountInfoScreen]
class AccountInfoRoute extends _i65.PageRouteInfo<AccountInfoRouteArgs> {
  AccountInfoRoute({
    _i66.Key? key,
    required String account,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          AccountInfoRoute.name,
          args: AccountInfoRouteArgs(
            key: key,
            account: account,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountInfoRoute';

  static const _i65.PageInfo<AccountInfoRouteArgs> page =
      _i65.PageInfo<AccountInfoRouteArgs>(name);
}

class AccountInfoRouteArgs {
  const AccountInfoRouteArgs({
    this.key,
    required this.account,
  });

  final _i66.Key? key;

  final String account;

  @override
  String toString() {
    return 'AccountInfoRouteArgs{key: $key, account: $account}';
  }
}

/// generated route for
/// [_i3.AuthConfirmCodeScreen]
class AuthConfirmCodeRoute extends _i65.PageRouteInfo<void> {
  const AuthConfirmCodeRoute({List<_i65.PageRouteInfo>? children})
      : super(
          AuthConfirmCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConfirmCodeRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AuthScreen]
class AuthRoute extends _i65.PageRouteInfo<void> {
  const AuthRoute({List<_i65.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AuthSendConfirmScreen]
class AuthSendConfirmRoute
    extends _i65.PageRouteInfo<AuthSendConfirmRouteArgs> {
  AuthSendConfirmRoute({
    _i66.Key? key,
    required _i67.AuthModel authModel,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          AuthSendConfirmRoute.name,
          args: AuthSendConfirmRouteArgs(
            key: key,
            authModel: authModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthSendConfirmRoute';

  static const _i65.PageInfo<AuthSendConfirmRouteArgs> page =
      _i65.PageInfo<AuthSendConfirmRouteArgs>(name);
}

class AuthSendConfirmRouteArgs {
  const AuthSendConfirmRouteArgs({
    this.key,
    required this.authModel,
  });

  final _i66.Key? key;

  final _i67.AuthModel authModel;

  @override
  String toString() {
    return 'AuthSendConfirmRouteArgs{key: $key, authModel: $authModel}';
  }
}

/// generated route for
/// [_i6.BottomNavigatorScreen]
class BottomNavigatorRoute extends _i65.PageRouteInfo<void> {
  const BottomNavigatorRoute({List<_i65.PageRouteInfo>? children})
      : super(
          BottomNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigatorRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CardDetailScreen]
class CardDetailRoute extends _i65.PageRouteInfo<void> {
  const CardDetailRoute({List<_i65.PageRouteInfo>? children})
      : super(
          CardDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardDetailRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CardOperationHistoryScreen]
class CardOperationHistoryRoute extends _i65.PageRouteInfo<void> {
  const CardOperationHistoryRoute({List<_i65.PageRouteInfo>? children})
      : super(
          CardOperationHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardOperationHistoryRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CesSelfieScreen]
class CesSelfieRoute extends _i65.PageRouteInfo<void> {
  const CesSelfieRoute({List<_i65.PageRouteInfo>? children})
      : super(
          CesSelfieRoute.name,
          initialChildren: children,
        );

  static const String name = 'CesSelfieRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CreateAccountFinishScreen]
class CreateAccountFinishRoute
    extends _i65.PageRouteInfo<CreateAccountFinishRouteArgs> {
  CreateAccountFinishRoute({
    _i66.Key? key,
    required String accountNumber,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          CreateAccountFinishRoute.name,
          args: CreateAccountFinishRouteArgs(
            key: key,
            accountNumber: accountNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAccountFinishRoute';

  static const _i65.PageInfo<CreateAccountFinishRouteArgs> page =
      _i65.PageInfo<CreateAccountFinishRouteArgs>(name);
}

class CreateAccountFinishRouteArgs {
  const CreateAccountFinishRouteArgs({
    this.key,
    required this.accountNumber,
  });

  final _i66.Key? key;

  final String accountNumber;

  @override
  String toString() {
    return 'CreateAccountFinishRouteArgs{key: $key, accountNumber: $accountNumber}';
  }
}

/// generated route for
/// [_i11.CreateAccountLastScreen]
class CreateAccountLastRoute extends _i65.PageRouteInfo<void> {
  const CreateAccountLastRoute({List<_i65.PageRouteInfo>? children})
      : super(
          CreateAccountLastRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountLastRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CreateAccountScreen]
class CreateAccountRoute extends _i65.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i65.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i13.EsfReportsDetailScreen]
class EsfReportsDetailRoute
    extends _i65.PageRouteInfo<EsfReportsDetailRouteArgs> {
  EsfReportsDetailRoute({
    _i66.Key? key,
    required _i68.Invoice invoice,
    required _i69.ESFType type,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          EsfReportsDetailRoute.name,
          args: EsfReportsDetailRouteArgs(
            key: key,
            invoice: invoice,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'EsfReportsDetailRoute';

  static const _i65.PageInfo<EsfReportsDetailRouteArgs> page =
      _i65.PageInfo<EsfReportsDetailRouteArgs>(name);
}

class EsfReportsDetailRouteArgs {
  const EsfReportsDetailRouteArgs({
    this.key,
    required this.invoice,
    required this.type,
  });

  final _i66.Key? key;

  final _i68.Invoice invoice;

  final _i69.ESFType type;

  @override
  String toString() {
    return 'EsfReportsDetailRouteArgs{key: $key, invoice: $invoice, type: $type}';
  }
}

/// generated route for
/// [_i14.EsfReportsScreen]
class EsfReportsRoute extends _i65.PageRouteInfo<EsfReportsRouteArgs> {
  EsfReportsRoute({
    _i66.Key? key,
    required _i69.ESFType type,
    required String title,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          EsfReportsRoute.name,
          args: EsfReportsRouteArgs(
            key: key,
            type: type,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'EsfReportsRoute';

  static const _i65.PageInfo<EsfReportsRouteArgs> page =
      _i65.PageInfo<EsfReportsRouteArgs>(name);
}

class EsfReportsRouteArgs {
  const EsfReportsRouteArgs({
    this.key,
    required this.type,
    required this.title,
  });

  final _i66.Key? key;

  final _i69.ESFType type;

  final String title;

  @override
  String toString() {
    return 'EsfReportsRouteArgs{key: $key, type: $type, title: $title}';
  }
}

/// generated route for
/// [_i15.EsfScreen]
class EsfRoute extends _i65.PageRouteInfo<void> {
  const EsfRoute({List<_i65.PageRouteInfo>? children})
      : super(
          EsfRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsfRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i16.EsiErrorScreen]
class EsiErrorRoute extends _i65.PageRouteInfo<void> {
  const EsiErrorRoute({List<_i65.PageRouteInfo>? children})
      : super(
          EsiErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsiErrorRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i17.GoBankScreen]
class GoBankRoute extends _i65.PageRouteInfo<void> {
  const GoBankRoute({List<_i65.PageRouteInfo>? children})
      : super(
          GoBankRoute.name,
          initialChildren: children,
        );

  static const String name = 'GoBankRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i18.GrnpCameraScreen]
class GrnpCameraRoute extends _i65.PageRouteInfo<GrnpCameraRouteArgs> {
  GrnpCameraRoute({
    _i66.Key? key,
    required _i70.CameraDescription description,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          GrnpCameraRoute.name,
          args: GrnpCameraRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'GrnpCameraRoute';

  static const _i65.PageInfo<GrnpCameraRouteArgs> page =
      _i65.PageInfo<GrnpCameraRouteArgs>(name);
}

class GrnpCameraRouteArgs {
  const GrnpCameraRouteArgs({
    this.key,
    required this.description,
  });

  final _i66.Key? key;

  final _i70.CameraDescription description;

  @override
  String toString() {
    return 'GrnpCameraRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i19.GrnpCheckScreen]
class GrnpCheckRoute extends _i65.PageRouteInfo<void> {
  const GrnpCheckRoute({List<_i65.PageRouteInfo>? children})
      : super(
          GrnpCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'GrnpCheckRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i20.GrnpSelfiePreviewScreen]
class GrnpSelfiePreviewRoute
    extends _i65.PageRouteInfo<GrnpSelfiePreviewRouteArgs> {
  GrnpSelfiePreviewRoute({
    required String? path,
    required Function onCheck,
    _i66.Key? key,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          GrnpSelfiePreviewRoute.name,
          args: GrnpSelfiePreviewRouteArgs(
            path: path,
            onCheck: onCheck,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GrnpSelfiePreviewRoute';

  static const _i65.PageInfo<GrnpSelfiePreviewRouteArgs> page =
      _i65.PageInfo<GrnpSelfiePreviewRouteArgs>(name);
}

class GrnpSelfiePreviewRouteArgs {
  const GrnpSelfiePreviewRouteArgs({
    required this.path,
    required this.onCheck,
    this.key,
  });

  final String? path;

  final Function onCheck;

  final _i66.Key? key;

  @override
  String toString() {
    return 'GrnpSelfiePreviewRouteArgs{path: $path, onCheck: $onCheck, key: $key}';
  }
}

/// generated route for
/// [_i21.GrnpSelfieScreen]
class GrnpSelfieRoute extends _i65.PageRouteInfo<void> {
  const GrnpSelfieRoute({List<_i65.PageRouteInfo>? children})
      : super(
          GrnpSelfieRoute.name,
          initialChildren: children,
        );

  static const String name = 'GrnpSelfieRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i22.HistoryScreen]
class HistoryRoute extends _i65.PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({
    _i66.Key? key,
    required String account,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          HistoryRoute.name,
          args: HistoryRouteArgs(
            key: key,
            account: account,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i65.PageInfo<HistoryRouteArgs> page =
      _i65.PageInfo<HistoryRouteArgs>(name);
}

class HistoryRouteArgs {
  const HistoryRouteArgs({
    this.key,
    required this.account,
  });

  final _i66.Key? key;

  final String account;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key, account: $account}';
  }
}

/// generated route for
/// [_i23.KKMScreen]
class KKMRoute extends _i65.PageRouteInfo<void> {
  const KKMRoute({List<_i65.PageRouteInfo>? children})
      : super(
          KKMRoute.name,
          initialChildren: children,
        );

  static const String name = 'KKMRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i24.MegaKassaEntryScreen]
class MegaKassaEntryRoute extends _i65.PageRouteInfo<MegaKassaEntryRouteArgs> {
  MegaKassaEntryRoute({
    _i66.Key? key,
    bool isAfterRegistration = false,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MegaKassaEntryRoute.name,
          args: MegaKassaEntryRouteArgs(
            key: key,
            isAfterRegistration: isAfterRegistration,
          ),
          initialChildren: children,
        );

  static const String name = 'MegaKassaEntryRoute';

  static const _i65.PageInfo<MegaKassaEntryRouteArgs> page =
      _i65.PageInfo<MegaKassaEntryRouteArgs>(name);
}

class MegaKassaEntryRouteArgs {
  const MegaKassaEntryRouteArgs({
    this.key,
    this.isAfterRegistration = false,
  });

  final _i66.Key? key;

  final bool isAfterRegistration;

  @override
  String toString() {
    return 'MegaKassaEntryRouteArgs{key: $key, isAfterRegistration: $isAfterRegistration}';
  }
}

/// generated route for
/// [_i25.MegaKassaGnsConfirmationScreen]
class MegaKassaGnsConfirmationRoute
    extends _i65.PageRouteInfo<MegaKassaGnsConfirmationRouteArgs> {
  MegaKassaGnsConfirmationRoute({
    _i66.Key? key,
    required List<_i71.PinCodeTypesModel> types,
    _i72.MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    _i73.MegaKassaKkmRegistrationEntity? registrationKkmEntity,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MegaKassaGnsConfirmationRoute.name,
          args: MegaKassaGnsConfirmationRouteArgs(
            key: key,
            types: types,
            registrationEntity: registrationEntity,
            registrationKkmEntity: registrationKkmEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'MegaKassaGnsConfirmationRoute';

  static const _i65.PageInfo<MegaKassaGnsConfirmationRouteArgs> page =
      _i65.PageInfo<MegaKassaGnsConfirmationRouteArgs>(name);
}

class MegaKassaGnsConfirmationRouteArgs {
  const MegaKassaGnsConfirmationRouteArgs({
    this.key,
    required this.types,
    this.registrationEntity,
    this.registrationKkmEntity,
  });

  final _i66.Key? key;

  final List<_i71.PinCodeTypesModel> types;

  final _i72.MegaKassaGnsRegistrationRequestEntity? registrationEntity;

  final _i73.MegaKassaKkmRegistrationEntity? registrationKkmEntity;

  @override
  String toString() {
    return 'MegaKassaGnsConfirmationRouteArgs{key: $key, types: $types, registrationEntity: $registrationEntity, registrationKkmEntity: $registrationKkmEntity}';
  }
}

/// generated route for
/// [_i26.MegaKassaKkmDetailScreen]
class MegaKassaKkmDetailRoute
    extends _i65.PageRouteInfo<MegaKassaKkmDetailRouteArgs> {
  MegaKassaKkmDetailRoute({
    _i66.Key? key,
    required _i74.MegaKassaKkmEntity cashbox,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MegaKassaKkmDetailRoute.name,
          args: MegaKassaKkmDetailRouteArgs(
            key: key,
            cashbox: cashbox,
          ),
          initialChildren: children,
        );

  static const String name = 'MegaKassaKkmDetailRoute';

  static const _i65.PageInfo<MegaKassaKkmDetailRouteArgs> page =
      _i65.PageInfo<MegaKassaKkmDetailRouteArgs>(name);
}

class MegaKassaKkmDetailRouteArgs {
  const MegaKassaKkmDetailRouteArgs({
    this.key,
    required this.cashbox,
  });

  final _i66.Key? key;

  final _i74.MegaKassaKkmEntity cashbox;

  @override
  String toString() {
    return 'MegaKassaKkmDetailRouteArgs{key: $key, cashbox: $cashbox}';
  }
}

/// generated route for
/// [_i27.MegaKassaKkmListScreen]
class MegaKassaKkmListRoute extends _i65.PageRouteInfo<void> {
  const MegaKassaKkmListRoute({List<_i65.PageRouteInfo>? children})
      : super(
          MegaKassaKkmListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MegaKassaKkmListRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i28.MegaKassaKkmRegistrationScreen]
class MegaKassaKkmRegistrationRoute extends _i65.PageRouteInfo<void> {
  const MegaKassaKkmRegistrationRoute({List<_i65.PageRouteInfo>? children})
      : super(
          MegaKassaKkmRegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MegaKassaKkmRegistrationRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i29.MegaKassaKkmRegistrationStep1Screen]
class MegaKassaKkmRegistrationStep1Route
    extends _i65.PageRouteInfo<MegaKassaKkmRegistrationStep1RouteArgs> {
  MegaKassaKkmRegistrationStep1Route({
    _i75.Key? key,
    required _i76.MegaKassaKkmRegistrationStep1Entity? stepEntity,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MegaKassaKkmRegistrationStep1Route.name,
          args: MegaKassaKkmRegistrationStep1RouteArgs(
            key: key,
            stepEntity: stepEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'MegaKassaKkmRegistrationStep1Route';

  static const _i65.PageInfo<MegaKassaKkmRegistrationStep1RouteArgs> page =
      _i65.PageInfo<MegaKassaKkmRegistrationStep1RouteArgs>(name);
}

class MegaKassaKkmRegistrationStep1RouteArgs {
  const MegaKassaKkmRegistrationStep1RouteArgs({
    this.key,
    required this.stepEntity,
  });

  final _i75.Key? key;

  final _i76.MegaKassaKkmRegistrationStep1Entity? stepEntity;

  @override
  String toString() {
    return 'MegaKassaKkmRegistrationStep1RouteArgs{key: $key, stepEntity: $stepEntity}';
  }
}

/// generated route for
/// [_i30.MegaKassaKkmRegistrationStep2Screen]
class MegaKassaKkmRegistrationStep2Route
    extends _i65.PageRouteInfo<MegaKassaKkmRegistrationStep2RouteArgs> {
  MegaKassaKkmRegistrationStep2Route({
    _i66.Key? key,
    required _i77.MegaKassaKkmRegistrationStep2Entity? stepEntity,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MegaKassaKkmRegistrationStep2Route.name,
          args: MegaKassaKkmRegistrationStep2RouteArgs(
            key: key,
            stepEntity: stepEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'MegaKassaKkmRegistrationStep2Route';

  static const _i65.PageInfo<MegaKassaKkmRegistrationStep2RouteArgs> page =
      _i65.PageInfo<MegaKassaKkmRegistrationStep2RouteArgs>(name);
}

class MegaKassaKkmRegistrationStep2RouteArgs {
  const MegaKassaKkmRegistrationStep2RouteArgs({
    this.key,
    required this.stepEntity,
  });

  final _i66.Key? key;

  final _i77.MegaKassaKkmRegistrationStep2Entity? stepEntity;

  @override
  String toString() {
    return 'MegaKassaKkmRegistrationStep2RouteArgs{key: $key, stepEntity: $stepEntity}';
  }
}

/// generated route for
/// [_i31.MegaKassaKkmRegistrationStep3Screen]
class MegaKassaKkmRegistrationStep3Route
    extends _i65.PageRouteInfo<MegaKassaKkmRegistrationStep3RouteArgs> {
  MegaKassaKkmRegistrationStep3Route({
    _i66.Key? key,
    required _i78.MegaKassaKkmRegistrationStep3Entity? stepEntity,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MegaKassaKkmRegistrationStep3Route.name,
          args: MegaKassaKkmRegistrationStep3RouteArgs(
            key: key,
            stepEntity: stepEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'MegaKassaKkmRegistrationStep3Route';

  static const _i65.PageInfo<MegaKassaKkmRegistrationStep3RouteArgs> page =
      _i65.PageInfo<MegaKassaKkmRegistrationStep3RouteArgs>(name);
}

class MegaKassaKkmRegistrationStep3RouteArgs {
  const MegaKassaKkmRegistrationStep3RouteArgs({
    this.key,
    required this.stepEntity,
  });

  final _i66.Key? key;

  final _i78.MegaKassaKkmRegistrationStep3Entity? stepEntity;

  @override
  String toString() {
    return 'MegaKassaKkmRegistrationStep3RouteArgs{key: $key, stepEntity: $stepEntity}';
  }
}

/// generated route for
/// [_i32.MegaKassaMyProfileScreen]
class MegaKassaMyProfileRoute extends _i65.PageRouteInfo<void> {
  const MegaKassaMyProfileRoute({List<_i65.PageRouteInfo>? children})
      : super(
          MegaKassaMyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MegaKassaMyProfileRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i33.MyCertficateScreen]
class MyCertficateRoute extends _i65.PageRouteInfo<MyCertficateRouteArgs> {
  MyCertficateRoute({
    _i66.Key? key,
    required _i79.CheckHasIPModel model,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          MyCertficateRoute.name,
          args: MyCertficateRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'MyCertficateRoute';

  static const _i65.PageInfo<MyCertficateRouteArgs> page =
      _i65.PageInfo<MyCertficateRouteArgs>(name);
}

class MyCertficateRouteArgs {
  const MyCertficateRouteArgs({
    this.key,
    required this.model,
  });

  final _i66.Key? key;

  final _i79.CheckHasIPModel model;

  @override
  String toString() {
    return 'MyCertficateRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i34.NalogMainScreen]
class NalogMainRoute extends _i65.PageRouteInfo<void> {
  const NalogMainRoute({List<_i65.PageRouteInfo>? children})
      : super(
          NalogMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'NalogMainRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i35.OEPCameraScreen]
class OEPCameraRoute extends _i65.PageRouteInfo<OEPCameraRouteArgs> {
  OEPCameraRoute({
    _i66.Key? key,
    required _i70.CameraDescription description,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          OEPCameraRoute.name,
          args: OEPCameraRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'OEPCameraRoute';

  static const _i65.PageInfo<OEPCameraRouteArgs> page =
      _i65.PageInfo<OEPCameraRouteArgs>(name);
}

class OEPCameraRouteArgs {
  const OEPCameraRouteArgs({
    this.key,
    required this.description,
  });

  final _i66.Key? key;

  final _i70.CameraDescription description;

  @override
  String toString() {
    return 'OEPCameraRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i36.OEPFinishScreen]
class OEPFinishRoute extends _i65.PageRouteInfo<void> {
  const OEPFinishRoute({List<_i65.PageRouteInfo>? children})
      : super(
          OEPFinishRoute.name,
          initialChildren: children,
        );

  static const String name = 'OEPFinishRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i37.OEPRegisterScreen]
class OEPRegisterRoute extends _i65.PageRouteInfo<void> {
  const OEPRegisterRoute({List<_i65.PageRouteInfo>? children})
      : super(
          OEPRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'OEPRegisterRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i38.OpenAccountScreen]
class OpenAccountRoute extends _i65.PageRouteInfo<OpenAccountRouteArgs> {
  OpenAccountRoute({
    _i66.Key? key,
    required String partyId,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          OpenAccountRoute.name,
          args: OpenAccountRouteArgs(
            key: key,
            partyId: partyId,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenAccountRoute';

  static const _i65.PageInfo<OpenAccountRouteArgs> page =
      _i65.PageInfo<OpenAccountRouteArgs>(name);
}

class OpenAccountRouteArgs {
  const OpenAccountRouteArgs({
    this.key,
    required this.partyId,
  });

  final _i66.Key? key;

  final String partyId;

  @override
  String toString() {
    return 'OpenAccountRouteArgs{key: $key, partyId: $partyId}';
  }
}

/// generated route for
/// [_i39.PdfViewScreen]
class PdfViewRoute extends _i65.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i66.Key? key,
    required String path,
    bool isNetwork = false,
    String title = '',
    List<_i65.PageRouteInfo>? children,
  }) : super(
          PdfViewRoute.name,
          args: PdfViewRouteArgs(
            key: key,
            path: path,
            isNetwork: isNetwork,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewRoute';

  static const _i65.PageInfo<PdfViewRouteArgs> page =
      _i65.PageInfo<PdfViewRouteArgs>(name);
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({
    this.key,
    required this.path,
    this.isNetwork = false,
    this.title = '',
  });

  final _i66.Key? key;

  final String path;

  final bool isNetwork;

  final String title;

  @override
  String toString() {
    return 'PdfViewRouteArgs{key: $key, path: $path, isNetwork: $isNetwork, title: $title}';
  }
}

/// generated route for
/// [_i40.PinCodeCreateScreen]
class PinCodeCreateRoute extends _i65.PageRouteInfo<PinCodeCreateRouteArgs> {
  PinCodeCreateRoute({
    _i66.Key? key,
    bool isNewPin = false,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          PinCodeCreateRoute.name,
          args: PinCodeCreateRouteArgs(
            key: key,
            isNewPin: isNewPin,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeCreateRoute';

  static const _i65.PageInfo<PinCodeCreateRouteArgs> page =
      _i65.PageInfo<PinCodeCreateRouteArgs>(name);
}

class PinCodeCreateRouteArgs {
  const PinCodeCreateRouteArgs({
    this.key,
    this.isNewPin = false,
  });

  final _i66.Key? key;

  final bool isNewPin;

  @override
  String toString() {
    return 'PinCodeCreateRouteArgs{key: $key, isNewPin: $isNewPin}';
  }
}

/// generated route for
/// [_i41.PinCodeEnterScreen]
class PinCodeEnterRoute extends _i65.PageRouteInfo<PinCodeEnterRouteArgs> {
  PinCodeEnterRoute({
    _i66.Key? key,
    bool isPushed = false,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          PinCodeEnterRoute.name,
          args: PinCodeEnterRouteArgs(
            key: key,
            isPushed: isPushed,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeEnterRoute';

  static const _i65.PageInfo<PinCodeEnterRouteArgs> page =
      _i65.PageInfo<PinCodeEnterRouteArgs>(name);
}

class PinCodeEnterRouteArgs {
  const PinCodeEnterRouteArgs({
    this.key,
    this.isPushed = false,
  });

  final _i66.Key? key;

  final bool isPushed;

  @override
  String toString() {
    return 'PinCodeEnterRouteArgs{key: $key, isPushed: $isPushed}';
  }
}

/// generated route for
/// [_i42.PinCodeRepeatScreen]
class PinCodeRepeatRoute extends _i65.PageRouteInfo<PinCodeRepeatRouteArgs> {
  PinCodeRepeatRoute({
    _i66.Key? key,
    required String firstPin,
    required bool isNewPin,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          PinCodeRepeatRoute.name,
          args: PinCodeRepeatRouteArgs(
            key: key,
            firstPin: firstPin,
            isNewPin: isNewPin,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeRepeatRoute';

  static const _i65.PageInfo<PinCodeRepeatRouteArgs> page =
      _i65.PageInfo<PinCodeRepeatRouteArgs>(name);
}

class PinCodeRepeatRouteArgs {
  const PinCodeRepeatRouteArgs({
    this.key,
    required this.firstPin,
    required this.isNewPin,
  });

  final _i66.Key? key;

  final String firstPin;

  final bool isNewPin;

  @override
  String toString() {
    return 'PinCodeRepeatRouteArgs{key: $key, firstPin: $firstPin, isNewPin: $isNewPin}';
  }
}

/// generated route for
/// [_i43.RecoveryPasswordChoiseTypeScreen]
class RecoveryPasswordChoiseTypeRoute extends _i65.PageRouteInfo<void> {
  const RecoveryPasswordChoiseTypeRoute({List<_i65.PageRouteInfo>? children})
      : super(
          RecoveryPasswordChoiseTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordChoiseTypeRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i44.RecoveryPasswordEnterInnScreen]
class RecoveryPasswordEnterInnRoute
    extends _i65.PageRouteInfo<RecoveryPasswordEnterInnRouteArgs> {
  RecoveryPasswordEnterInnRoute({
    _i66.Key? key,
    bool isSmsRecovery = false,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RecoveryPasswordEnterInnRoute.name,
          args: RecoveryPasswordEnterInnRouteArgs(
            key: key,
            isSmsRecovery: isSmsRecovery,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterInnRoute';

  static const _i65.PageInfo<RecoveryPasswordEnterInnRouteArgs> page =
      _i65.PageInfo<RecoveryPasswordEnterInnRouteArgs>(name);
}

class RecoveryPasswordEnterInnRouteArgs {
  const RecoveryPasswordEnterInnRouteArgs({
    this.key,
    this.isSmsRecovery = false,
  });

  final _i66.Key? key;

  final bool isSmsRecovery;

  @override
  String toString() {
    return 'RecoveryPasswordEnterInnRouteArgs{key: $key, isSmsRecovery: $isSmsRecovery}';
  }
}

/// generated route for
/// [_i45.RecoveryPasswordEnterNewPasswordScreen]
class RecoveryPasswordEnterNewPasswordRoute extends _i65.PageRouteInfo<void> {
  const RecoveryPasswordEnterNewPasswordRoute(
      {List<_i65.PageRouteInfo>? children})
      : super(
          RecoveryPasswordEnterNewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterNewPasswordRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i46.RecoveryPasswordEnterSmsCodeScreen]
class RecoveryPasswordEnterSmsCodeRoute
    extends _i65.PageRouteInfo<RecoveryPasswordEnterSmsCodeRouteArgs> {
  RecoveryPasswordEnterSmsCodeRoute({
    _i66.Key? key,
    bool isSmsRecovery = false,
    required String contact,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RecoveryPasswordEnterSmsCodeRoute.name,
          args: RecoveryPasswordEnterSmsCodeRouteArgs(
            key: key,
            isSmsRecovery: isSmsRecovery,
            contact: contact,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterSmsCodeRoute';

  static const _i65.PageInfo<RecoveryPasswordEnterSmsCodeRouteArgs> page =
      _i65.PageInfo<RecoveryPasswordEnterSmsCodeRouteArgs>(name);
}

class RecoveryPasswordEnterSmsCodeRouteArgs {
  const RecoveryPasswordEnterSmsCodeRouteArgs({
    this.key,
    this.isSmsRecovery = false,
    required this.contact,
  });

  final _i66.Key? key;

  final bool isSmsRecovery;

  final String contact;

  @override
  String toString() {
    return 'RecoveryPasswordEnterSmsCodeRouteArgs{key: $key, isSmsRecovery: $isSmsRecovery, contact: $contact}';
  }
}

/// generated route for
/// [_i47.RecoveryPinCodeChoiseTypeScreen]
class RecoveryPinCodeChoiseTypeRoute
    extends _i65.PageRouteInfo<RecoveryPinCodeChoiseTypeRouteArgs> {
  RecoveryPinCodeChoiseTypeRoute({
    _i66.Key? key,
    required String password,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RecoveryPinCodeChoiseTypeRoute.name,
          args: RecoveryPinCodeChoiseTypeRouteArgs(
            key: key,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeChoiseTypeRoute';

  static const _i65.PageInfo<RecoveryPinCodeChoiseTypeRouteArgs> page =
      _i65.PageInfo<RecoveryPinCodeChoiseTypeRouteArgs>(name);
}

class RecoveryPinCodeChoiseTypeRouteArgs {
  const RecoveryPinCodeChoiseTypeRouteArgs({
    this.key,
    required this.password,
  });

  final _i66.Key? key;

  final String password;

  @override
  String toString() {
    return 'RecoveryPinCodeChoiseTypeRouteArgs{key: $key, password: $password}';
  }
}

/// generated route for
/// [_i48.RecoveryPinCodeEnterEsiPasswordScreen]
class RecoveryPinCodeEnterEsiPasswordRoute extends _i65.PageRouteInfo<void> {
  const RecoveryPinCodeEnterEsiPasswordRoute(
      {List<_i65.PageRouteInfo>? children})
      : super(
          RecoveryPinCodeEnterEsiPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeEnterEsiPasswordRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i49.RecoveryPinCodeEnterSmsCodeScreen]
class RecoveryPinCodeEnterSmsCodeRoute
    extends _i65.PageRouteInfo<RecoveryPinCodeEnterSmsCodeRouteArgs> {
  RecoveryPinCodeEnterSmsCodeRoute({
    _i66.Key? key,
    required String method,
    required String userId,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RecoveryPinCodeEnterSmsCodeRoute.name,
          args: RecoveryPinCodeEnterSmsCodeRouteArgs(
            key: key,
            method: method,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeEnterSmsCodeRoute';

  static const _i65.PageInfo<RecoveryPinCodeEnterSmsCodeRouteArgs> page =
      _i65.PageInfo<RecoveryPinCodeEnterSmsCodeRouteArgs>(name);
}

class RecoveryPinCodeEnterSmsCodeRouteArgs {
  const RecoveryPinCodeEnterSmsCodeRouteArgs({
    this.key,
    required this.method,
    required this.userId,
  });

  final _i66.Key? key;

  final String method;

  final String userId;

  @override
  String toString() {
    return 'RecoveryPinCodeEnterSmsCodeRouteArgs{key: $key, method: $method, userId: $userId}';
  }
}

/// generated route for
/// [_i50.RegisterIPMainScreen]
class RegisterIPMainRoute extends _i65.PageRouteInfo<void> {
  const RegisterIPMainRoute({List<_i65.PageRouteInfo>? children})
      : super(
          RegisterIPMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIPMainRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i51.RegisterIPNextScreen]
class RegisterIPNextRoute extends _i65.PageRouteInfo<RegisterIPNextRouteArgs> {
  RegisterIPNextRoute({
    _i66.Key? key,
    required bool isPatent,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RegisterIPNextRoute.name,
          args: RegisterIPNextRouteArgs(
            key: key,
            isPatent: isPatent,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIPNextRoute';

  static const _i65.PageInfo<RegisterIPNextRouteArgs> page =
      _i65.PageInfo<RegisterIPNextRouteArgs>(name);
}

class RegisterIPNextRouteArgs {
  const RegisterIPNextRouteArgs({
    this.key,
    required this.isPatent,
  });

  final _i66.Key? key;

  final bool isPatent;

  @override
  String toString() {
    return 'RegisterIPNextRouteArgs{key: $key, isPatent: $isPatent}';
  }
}

/// generated route for
/// [_i52.RegisterIPTypeOfActivityScreen]
class RegisterIPTypeOfActivityRoute
    extends _i65.PageRouteInfo<RegisterIPTypeOfActivityRouteArgs> {
  RegisterIPTypeOfActivityRoute({
    _i66.Key? key,
    required List<_i80.TaxModel> models,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RegisterIPTypeOfActivityRoute.name,
          args: RegisterIPTypeOfActivityRouteArgs(
            key: key,
            models: models,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIPTypeOfActivityRoute';

  static const _i65.PageInfo<RegisterIPTypeOfActivityRouteArgs> page =
      _i65.PageInfo<RegisterIPTypeOfActivityRouteArgs>(name);
}

class RegisterIPTypeOfActivityRouteArgs {
  const RegisterIPTypeOfActivityRouteArgs({
    this.key,
    required this.models,
  });

  final _i66.Key? key;

  final List<_i80.TaxModel> models;

  @override
  String toString() {
    return 'RegisterIPTypeOfActivityRouteArgs{key: $key, models: $models}';
  }
}

/// generated route for
/// [_i53.RegisterIpConfirmOepScreen]
class RegisterIpConfirmOepRoute extends _i65.PageRouteInfo<void> {
  const RegisterIpConfirmOepRoute({List<_i65.PageRouteInfo>? children})
      : super(
          RegisterIpConfirmOepRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIpConfirmOepRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i54.RegisterIpSelectModesScreen]
class RegisterIpSelectModesRoute
    extends _i65.PageRouteInfo<RegisterIpSelectModesRouteArgs> {
  RegisterIpSelectModesRoute({
    _i66.Key? key,
    required List<_i80.TaxModel> models,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          RegisterIpSelectModesRoute.name,
          args: RegisterIpSelectModesRouteArgs(
            key: key,
            models: models,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIpSelectModesRoute';

  static const _i65.PageInfo<RegisterIpSelectModesRouteArgs> page =
      _i65.PageInfo<RegisterIpSelectModesRouteArgs>(name);
}

class RegisterIpSelectModesRouteArgs {
  const RegisterIpSelectModesRouteArgs({
    this.key,
    required this.models,
  });

  final _i66.Key? key;

  final List<_i80.TaxModel> models;

  @override
  String toString() {
    return 'RegisterIpSelectModesRouteArgs{key: $key, models: $models}';
  }
}

/// generated route for
/// [_i55.RegisterIpSigninScreen]
class RegisterIpSigninRoute extends _i65.PageRouteInfo<void> {
  const RegisterIpSigninRoute({List<_i65.PageRouteInfo>? children})
      : super(
          RegisterIpSigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIpSigninRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i56.ReportDetailPdfViewScreen]
class ReportDetailPdfViewRoute
    extends _i65.PageRouteInfo<ReportDetailPdfViewRouteArgs> {
  ReportDetailPdfViewRoute({
    _i66.Key? key,
    required int reportId,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          ReportDetailPdfViewRoute.name,
          args: ReportDetailPdfViewRouteArgs(
            key: key,
            reportId: reportId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportDetailPdfViewRoute';

  static const _i65.PageInfo<ReportDetailPdfViewRouteArgs> page =
      _i65.PageInfo<ReportDetailPdfViewRouteArgs>(name);
}

class ReportDetailPdfViewRouteArgs {
  const ReportDetailPdfViewRouteArgs({
    this.key,
    required this.reportId,
  });

  final _i66.Key? key;

  final int reportId;

  @override
  String toString() {
    return 'ReportDetailPdfViewRouteArgs{key: $key, reportId: $reportId}';
  }
}

/// generated route for
/// [_i57.Screen914]
class Route914 extends _i65.PageRouteInfo<Route914Args> {
  Route914({
    _i66.Key? key,
    required _i81.NalogNameModel model,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          Route914.name,
          args: Route914Args(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'Route914';

  static const _i65.PageInfo<Route914Args> page =
      _i65.PageInfo<Route914Args>(name);
}

class Route914Args {
  const Route914Args({
    this.key,
    required this.model,
  });

  final _i66.Key? key;

  final _i81.NalogNameModel model;

  @override
  String toString() {
    return 'Route914Args{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i58.Screen9141]
class Route9141 extends _i65.PageRouteInfo<Route9141Args> {
  Route9141({
    _i66.Key? key,
    required _i81.NalogNameModel model,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          Route9141.name,
          args: Route9141Args(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'Route9141';

  static const _i65.PageInfo<Route9141Args> page =
      _i65.PageInfo<Route9141Args>(name);
}

class Route9141Args {
  const Route9141Args({
    this.key,
    required this.model,
  });

  final _i66.Key? key;

  final _i81.NalogNameModel model;

  @override
  String toString() {
    return 'Route9141Args{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i59.Screen9142]
class Route9142 extends _i65.PageRouteInfo<Route9142Args> {
  Route9142({
    _i66.Key? key,
    required _i81.NalogNameModel model,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          Route9142.name,
          args: Route9142Args(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'Route9142';

  static const _i65.PageInfo<Route9142Args> page =
      _i65.PageInfo<Route9142Args>(name);
}

class Route9142Args {
  const Route9142Args({
    this.key,
    required this.model,
  });

  final _i66.Key? key;

  final _i81.NalogNameModel model;

  @override
  String toString() {
    return 'Route9142Args{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i60.SelfiePreviewScreen]
class SelfiePreviewRoute extends _i65.PageRouteInfo<SelfiePreviewRouteArgs> {
  SelfiePreviewRoute({
    required String? path,
    required Function onCheck,
    _i66.Key? key,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          SelfiePreviewRoute.name,
          args: SelfiePreviewRouteArgs(
            path: path,
            onCheck: onCheck,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelfiePreviewRoute';

  static const _i65.PageInfo<SelfiePreviewRouteArgs> page =
      _i65.PageInfo<SelfiePreviewRouteArgs>(name);
}

class SelfiePreviewRouteArgs {
  const SelfiePreviewRouteArgs({
    required this.path,
    required this.onCheck,
    this.key,
  });

  final String? path;

  final Function onCheck;

  final _i66.Key? key;

  @override
  String toString() {
    return 'SelfiePreviewRouteArgs{path: $path, onCheck: $onCheck, key: $key}';
  }
}

/// generated route for
/// [_i61.SettingsAboutScreen]
class SettingsAboutRoute extends _i65.PageRouteInfo<void> {
  const SettingsAboutRoute({List<_i65.PageRouteInfo>? children})
      : super(
          SettingsAboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsAboutRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i62.SettingsHelpScreen]
class SettingsHelpRoute extends _i65.PageRouteInfo<void> {
  const SettingsHelpRoute({List<_i65.PageRouteInfo>? children})
      : super(
          SettingsHelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsHelpRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i63.SplashScreen]
class SplashRoute extends _i65.PageRouteInfo<void> {
  const SplashRoute({List<_i65.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i65.PageInfo<void> page = _i65.PageInfo<void>(name);
}

/// generated route for
/// [_i64.SuccessOrFailureScreen]
class SuccessOrFailureRoute
    extends _i65.PageRouteInfo<SuccessOrFailureRouteArgs> {
  SuccessOrFailureRoute({
    _i66.Key? key,
    required void Function() onPress,
    required String title,
    required String subtitle,
    required String buttonText,
    bool isSuccess = true,
    List<_i65.PageRouteInfo>? children,
  }) : super(
          SuccessOrFailureRoute.name,
          args: SuccessOrFailureRouteArgs(
            key: key,
            onPress: onPress,
            title: title,
            subtitle: subtitle,
            buttonText: buttonText,
            isSuccess: isSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'SuccessOrFailureRoute';

  static const _i65.PageInfo<SuccessOrFailureRouteArgs> page =
      _i65.PageInfo<SuccessOrFailureRouteArgs>(name);
}

class SuccessOrFailureRouteArgs {
  const SuccessOrFailureRouteArgs({
    this.key,
    required this.onPress,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.isSuccess = true,
  });

  final _i66.Key? key;

  final void Function() onPress;

  final String title;

  final String subtitle;

  final String buttonText;

  final bool isSuccess;

  @override
  String toString() {
    return 'SuccessOrFailureRouteArgs{key: $key, onPress: $onPress, title: $title, subtitle: $subtitle, buttonText: $buttonText, isSuccess: $isSuccess}';
  }
}
