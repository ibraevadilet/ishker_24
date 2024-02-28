// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i54;
import 'package:camera/camera.dart' as _i58;
import 'package:flutter/material.dart' as _i55;
import 'package:ishker_24/features/bank/presentation/account_detail_screen/account_detail_screen.dart'
    as _i1;
import 'package:ishker_24/features/bank/presentation/card_detail_screen/card_detail_screen.dart'
    as _i6;
import 'package:ishker_24/features/bank/presentation/card_detail_screen/card_operation_history_screen/card_operation_history_screen.dart'
    as _i7;
import 'package:ishker_24/features/bank/presentation/create_account_screen/create_account_finish_screen.dart'
    as _i9;
import 'package:ishker_24/features/bank/presentation/create_account_screen/create_account_last_screen.dart'
    as _i10;
import 'package:ishker_24/features/bank/presentation/create_account_screen/create_account_screen.dart'
    as _i11;
import 'package:ishker_24/features/bank/presentation/create_account_screen/go_bank_screen.dart'
    as _i18;
import 'package:ishker_24/features/bank/presentation/create_account_screen/open_account_screen.dart'
    as _i29;
import 'package:ishker_24/features/bottom_navigator/bottom_navigator_screen.dart'
    as _i5;
import 'package:ishker_24/features/esf/data/models/esf_model.dart' as _i57;
import 'package:ishker_24/features/esf/presentation/screens/esf_income_screen/esf_income_detail_screen.dart'
    as _i12;
import 'package:ishker_24/features/esf/presentation/screens/esf_income_screen/esf_income_screen.dart'
    as _i13;
import 'package:ishker_24/features/esf/presentation/screens/esf_invoice_screen/esf_invoice_detail_screen.dart'
    as _i15;
import 'package:ishker_24/features/esf/presentation/screens/esf_invoice_screen/esf_invoice_screen.dart'
    as _i14;
import 'package:ishker_24/features/esf/presentation/screens/esf_screen.dart'
    as _i16;
import 'package:ishker_24/features/grnp_check/presentation/grnp_camera_screen/grnp_camera_screen.dart'
    as _i19;
import 'package:ishker_24/features/grnp_check/presentation/grnp_camera_screen/grnp_selfie_ident_screen.dart'
    as _i22;
import 'package:ishker_24/features/grnp_check/presentation/grnp_camera_screen/grnp_selife_preview_screen.dart'
    as _i21;
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/grnp_screen.dart'
    as _i20;
import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart'
    as _i59;
import 'package:ishker_24/features/kkm/presentation/screens/kkm_screen.dart'
    as _i23;
import 'package:ishker_24/features/my_ip/presentation/my_certificate_screen/my_certficate_screen.dart'
    as _i24;
import 'package:ishker_24/features/nalog_decloration/presentation/screens/main_screen.dart'
    as _i25;
import 'package:ishker_24/features/nalog_decloration/presentation/screens/screen_91_4.dart'
    as _i47;
import 'package:ishker_24/features/nalog_decloration/presentation/screens/screen_91_4_1.dart'
    as _i48;
import 'package:ishker_24/features/nalog_decloration/presentation/screens/screen_91_4_2.dart'
    as _i49;
import 'package:ishker_24/features/pdf_view_screen.dart' as _i30;
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart'
    as _i60;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_confirm_oep_screen.dart'
    as _i44;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_main_screen.dart'
    as _i41;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_next_screen.dart'
    as _i42;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_select_modes_screen.dart'
    as _i45;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_signin_screen.dart'
    as _i46;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_type_of_activity_screen.dart'
    as _i43;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/ces_selfie_ident_screen.dart'
    as _i8;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/oep_camera_screen.dart'
    as _i26;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/selife_preview_screen.dart'
    as _i50;
import 'package:ishker_24/features/register_oep/presentation/oep_finish_screen/oep_finish_screen.dart'
    as _i27;
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/oep_register_screen.dart'
    as _i28;
import 'package:ishker_24/features/settings/presentation/settings_about_screen/settings_about_screen.dart'
    as _i51;
import 'package:ishker_24/features/settings/presentation/settings_help_screen/settings_help_screen.dart'
    as _i52;
import 'package:ishker_24/features/splash/splash_screen.dart' as _i53;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart'
    as _i56;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_confirm_code_screen/auth_confirm_code_screen.dart'
    as _i2;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/auth_screen.dart'
    as _i3;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/auth_send_confirm_screen.dart'
    as _i4;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/error_screen/error_screen.dart'
    as _i17;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_create_screen/pin_code_create_screen.dart'
    as _i31;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/pin_code_enter_screen.dart'
    as _i32;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_repeat_screen/pin_code_repeat_screen.dart'
    as _i33;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_choise_type_screen/recovery_password_choise_type_screen.dart'
    as _i34;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_inn_screen/recovery_password_enter_inn_screen.dart'
    as _i35;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_new_password_screen/recovery_password_enter_new_password_screen.dart'
    as _i36;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_sms_code_screen/recovery_password_enter_sms_code_screen.dart'
    as _i37;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/recovery_pin_code_choise_type_screen.dart'
    as _i38;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_esi_password_screen/recovery_pin_code_enter_esi_password_screen.dart'
    as _i39;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_sms_code_screen/recovery_pin_code_enter_sms_code_screen.dart'
    as _i40;

abstract class $AppRouter extends _i54.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i54.PageFactory> pagesMap = {
    AccountDetailRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountDetailScreen(),
      );
    },
    AuthConfirmCodeRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthConfirmCodeScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthScreen(),
      );
    },
    AuthSendConfirmRoute.name: (routeData) {
      final args = routeData.argsAs<AuthSendConfirmRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AuthSendConfirmScreen(
          key: args.key,
          authModel: args.authModel,
        ),
      );
    },
    BottomNavigatorRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.BottomNavigatorScreen(),
      );
    },
    CardDetailRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CardDetailScreen(),
      );
    },
    CardOperationHistoryRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CardOperationHistoryScreen(),
      );
    },
    CesSelfieRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CesSelfieScreen(),
      );
    },
    CreateAccountFinishRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountFinishRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CreateAccountFinishScreen(
          key: args.key,
          accountNumber: args.accountNumber,
        ),
      );
    },
    CreateAccountLastRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CreateAccountLastScreen(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CreateAccountScreen(),
      );
    },
    EsfIncomeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EsfIncomeDetailRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.EsfIncomeDetailScreen(
          key: args.key,
          invoice: args.invoice,
        ),
      );
    },
    EsfIncomeRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.EsfIncomeScreen(),
      );
    },
    EsfInvoiceRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.EsfInvoiceScreen(),
      );
    },
    EsfRealizationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EsfRealizationDetailRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.EsfRealizationDetailScreen(
          key: args.key,
          invoice: args.invoice,
        ),
      );
    },
    EsfRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.EsfScreen(),
      );
    },
    EsiErrorRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.EsiErrorScreen(),
      );
    },
    GoBankRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.GoBankScreen(),
      );
    },
    GrnpCameraRoute.name: (routeData) {
      final args = routeData.argsAs<GrnpCameraRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.GrnpCameraScreen(
          key: args.key,
          description: args.description,
        ),
      );
    },
    GrnpCheckRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.GrnpCheckScreen(),
      );
    },
    GrnpSelfiePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<GrnpSelfiePreviewRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.GrnpSelfiePreviewScreen(
          args.path,
          args.onCheck,
          key: args.key,
        ),
      );
    },
    GrnpSelfieRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.GrnpSelfieScreen(),
      );
    },
    KKMRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.KKMScreen(),
      );
    },
    MyCertficateRoute.name: (routeData) {
      final args = routeData.argsAs<MyCertficateRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.MyCertficateScreen(
          key: args.key,
          certUrl: args.certUrl,
          model: args.model,
        ),
      );
    },
    NalogMainRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.NalogMainScreen(),
      );
    },
    OEPCameraRoute.name: (routeData) {
      final args = routeData.argsAs<OEPCameraRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.OEPCameraScreen(
          key: args.key,
          description: args.description,
        ),
      );
    },
    OEPFinishRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.OEPFinishScreen(),
      );
    },
    OEPRegisterRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.OEPRegisterScreen(),
      );
    },
    OpenAccountRoute.name: (routeData) {
      final args = routeData.argsAs<OpenAccountRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.OpenAccountScreen(
          key: args.key,
          partyId: args.partyId,
        ),
      );
    },
    PdfViewRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.PdfViewScreen(
          key: args.key,
          path: args.path,
          isNetwork: args.isNetwork,
        ),
      );
    },
    PinCodeCreateRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeCreateRouteArgs>(
          orElse: () => const PinCodeCreateRouteArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.PinCodeCreateScreen(
          key: args.key,
          isNewPin: args.isNewPin,
        ),
      );
    },
    PinCodeEnterRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeEnterRouteArgs>(
          orElse: () => const PinCodeEnterRouteArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.PinCodeEnterScreen(
          key: args.key,
          isPushed: args.isPushed,
        ),
      );
    },
    PinCodeRepeatRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeRepeatRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.PinCodeRepeatScreen(
          key: args.key,
          firstPin: args.firstPin,
          isNewPin: args.isNewPin,
        ),
      );
    },
    RecoveryPasswordChoiseTypeRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.RecoveryPasswordChoiseTypeScreen(),
      );
    },
    RecoveryPasswordEnterInnRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPasswordEnterInnRouteArgs>(
          orElse: () => const RecoveryPasswordEnterInnRouteArgs());
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.RecoveryPasswordEnterInnScreen(
          key: args.key,
          isSmsRecovery: args.isSmsRecovery,
        ),
      );
    },
    RecoveryPasswordEnterNewPasswordRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.RecoveryPasswordEnterNewPasswordScreen(),
      );
    },
    RecoveryPasswordEnterSmsCodeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPasswordEnterSmsCodeRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.RecoveryPasswordEnterSmsCodeScreen(
          key: args.key,
          isSmsRecovery: args.isSmsRecovery,
          contact: args.contact,
        ),
      );
    },
    RecoveryPinCodeChoiseTypeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPinCodeChoiseTypeRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.RecoveryPinCodeChoiseTypeScreen(
          key: args.key,
          password: args.password,
        ),
      );
    },
    RecoveryPinCodeEnterEsiPasswordRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.RecoveryPinCodeEnterEsiPasswordScreen(),
      );
    },
    RecoveryPinCodeEnterSmsCodeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPinCodeEnterSmsCodeRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.RecoveryPinCodeEnterSmsCodeScreen(
          key: args.key,
          method: args.method,
          userId: args.userId,
        ),
      );
    },
    RegisterIPMainRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.RegisterIPMainScreen(),
      );
    },
    RegisterIPNextRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIPNextRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i42.RegisterIPNextScreen(
          key: args.key,
          isPatent: args.isPatent,
        ),
      );
    },
    RegisterIPTypeOfActivityRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIPTypeOfActivityRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i43.RegisterIPTypeOfActivityScreen(
          key: args.key,
          models: args.models,
        ),
      );
    },
    RegisterIpConfirmOepRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i44.RegisterIpConfirmOepScreen(),
      );
    },
    RegisterIpSelectModesRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIpSelectModesRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i45.RegisterIpSelectModesScreen(
          key: args.key,
          models: args.models,
        ),
      );
    },
    RegisterIpSigninRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.RegisterIpSigninScreen(),
      );
    },
    Route914.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.Screen914(),
      );
    },
    Route9141.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.Screen9141(),
      );
    },
    Route9142.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i49.Screen9142(),
      );
    },
    SelfiePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<SelfiePreviewRouteArgs>();
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i50.SelfiePreviewScreen(
          args.path,
          args.onCheck,
          key: args.key,
        ),
      );
    },
    SettingsAboutRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i51.SettingsAboutScreen(),
      );
    },
    SettingsHelpRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i52.SettingsHelpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i54.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountDetailScreen]
class AccountDetailRoute extends _i54.PageRouteInfo<void> {
  const AccountDetailRoute({List<_i54.PageRouteInfo>? children})
      : super(
          AccountDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDetailRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthConfirmCodeScreen]
class AuthConfirmCodeRoute extends _i54.PageRouteInfo<void> {
  const AuthConfirmCodeRoute({List<_i54.PageRouteInfo>? children})
      : super(
          AuthConfirmCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConfirmCodeRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthScreen]
class AuthRoute extends _i54.PageRouteInfo<void> {
  const AuthRoute({List<_i54.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AuthSendConfirmScreen]
class AuthSendConfirmRoute
    extends _i54.PageRouteInfo<AuthSendConfirmRouteArgs> {
  AuthSendConfirmRoute({
    _i55.Key? key,
    required _i56.AuthModel authModel,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          AuthSendConfirmRoute.name,
          args: AuthSendConfirmRouteArgs(
            key: key,
            authModel: authModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthSendConfirmRoute';

  static const _i54.PageInfo<AuthSendConfirmRouteArgs> page =
      _i54.PageInfo<AuthSendConfirmRouteArgs>(name);
}

class AuthSendConfirmRouteArgs {
  const AuthSendConfirmRouteArgs({
    this.key,
    required this.authModel,
  });

  final _i55.Key? key;

  final _i56.AuthModel authModel;

  @override
  String toString() {
    return 'AuthSendConfirmRouteArgs{key: $key, authModel: $authModel}';
  }
}

/// generated route for
/// [_i5.BottomNavigatorScreen]
class BottomNavigatorRoute extends _i54.PageRouteInfo<void> {
  const BottomNavigatorRoute({List<_i54.PageRouteInfo>? children})
      : super(
          BottomNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigatorRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CardDetailScreen]
class CardDetailRoute extends _i54.PageRouteInfo<void> {
  const CardDetailRoute({List<_i54.PageRouteInfo>? children})
      : super(
          CardDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardDetailRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CardOperationHistoryScreen]
class CardOperationHistoryRoute extends _i54.PageRouteInfo<void> {
  const CardOperationHistoryRoute({List<_i54.PageRouteInfo>? children})
      : super(
          CardOperationHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardOperationHistoryRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CesSelfieScreen]
class CesSelfieRoute extends _i54.PageRouteInfo<void> {
  const CesSelfieRoute({List<_i54.PageRouteInfo>? children})
      : super(
          CesSelfieRoute.name,
          initialChildren: children,
        );

  static const String name = 'CesSelfieRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CreateAccountFinishScreen]
class CreateAccountFinishRoute
    extends _i54.PageRouteInfo<CreateAccountFinishRouteArgs> {
  CreateAccountFinishRoute({
    _i55.Key? key,
    required String accountNumber,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          CreateAccountFinishRoute.name,
          args: CreateAccountFinishRouteArgs(
            key: key,
            accountNumber: accountNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAccountFinishRoute';

  static const _i54.PageInfo<CreateAccountFinishRouteArgs> page =
      _i54.PageInfo<CreateAccountFinishRouteArgs>(name);
}

class CreateAccountFinishRouteArgs {
  const CreateAccountFinishRouteArgs({
    this.key,
    required this.accountNumber,
  });

  final _i55.Key? key;

  final String accountNumber;

  @override
  String toString() {
    return 'CreateAccountFinishRouteArgs{key: $key, accountNumber: $accountNumber}';
  }
}

/// generated route for
/// [_i10.CreateAccountLastScreen]
class CreateAccountLastRoute extends _i54.PageRouteInfo<void> {
  const CreateAccountLastRoute({List<_i54.PageRouteInfo>? children})
      : super(
          CreateAccountLastRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountLastRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CreateAccountScreen]
class CreateAccountRoute extends _i54.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i54.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i12.EsfIncomeDetailScreen]
class EsfIncomeDetailRoute
    extends _i54.PageRouteInfo<EsfIncomeDetailRouteArgs> {
  EsfIncomeDetailRoute({
    _i55.Key? key,
    required _i57.Invoice invoice,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          EsfIncomeDetailRoute.name,
          args: EsfIncomeDetailRouteArgs(
            key: key,
            invoice: invoice,
          ),
          initialChildren: children,
        );

  static const String name = 'EsfIncomeDetailRoute';

  static const _i54.PageInfo<EsfIncomeDetailRouteArgs> page =
      _i54.PageInfo<EsfIncomeDetailRouteArgs>(name);
}

class EsfIncomeDetailRouteArgs {
  const EsfIncomeDetailRouteArgs({
    this.key,
    required this.invoice,
  });

  final _i55.Key? key;

  final _i57.Invoice invoice;

  @override
  String toString() {
    return 'EsfIncomeDetailRouteArgs{key: $key, invoice: $invoice}';
  }
}

/// generated route for
/// [_i13.EsfIncomeScreen]
class EsfIncomeRoute extends _i54.PageRouteInfo<void> {
  const EsfIncomeRoute({List<_i54.PageRouteInfo>? children})
      : super(
          EsfIncomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsfIncomeRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i14.EsfInvoiceScreen]
class EsfInvoiceRoute extends _i54.PageRouteInfo<void> {
  const EsfInvoiceRoute({List<_i54.PageRouteInfo>? children})
      : super(
          EsfInvoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsfInvoiceRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i15.EsfRealizationDetailScreen]
class EsfRealizationDetailRoute
    extends _i54.PageRouteInfo<EsfRealizationDetailRouteArgs> {
  EsfRealizationDetailRoute({
    _i55.Key? key,
    required _i57.Invoice invoice,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          EsfRealizationDetailRoute.name,
          args: EsfRealizationDetailRouteArgs(
            key: key,
            invoice: invoice,
          ),
          initialChildren: children,
        );

  static const String name = 'EsfRealizationDetailRoute';

  static const _i54.PageInfo<EsfRealizationDetailRouteArgs> page =
      _i54.PageInfo<EsfRealizationDetailRouteArgs>(name);
}

class EsfRealizationDetailRouteArgs {
  const EsfRealizationDetailRouteArgs({
    this.key,
    required this.invoice,
  });

  final _i55.Key? key;

  final _i57.Invoice invoice;

  @override
  String toString() {
    return 'EsfRealizationDetailRouteArgs{key: $key, invoice: $invoice}';
  }
}

/// generated route for
/// [_i16.EsfScreen]
class EsfRoute extends _i54.PageRouteInfo<void> {
  const EsfRoute({List<_i54.PageRouteInfo>? children})
      : super(
          EsfRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsfRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i17.EsiErrorScreen]
class EsiErrorRoute extends _i54.PageRouteInfo<void> {
  const EsiErrorRoute({List<_i54.PageRouteInfo>? children})
      : super(
          EsiErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsiErrorRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i18.GoBankScreen]
class GoBankRoute extends _i54.PageRouteInfo<void> {
  const GoBankRoute({List<_i54.PageRouteInfo>? children})
      : super(
          GoBankRoute.name,
          initialChildren: children,
        );

  static const String name = 'GoBankRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i19.GrnpCameraScreen]
class GrnpCameraRoute extends _i54.PageRouteInfo<GrnpCameraRouteArgs> {
  GrnpCameraRoute({
    _i55.Key? key,
    required _i58.CameraDescription description,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          GrnpCameraRoute.name,
          args: GrnpCameraRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'GrnpCameraRoute';

  static const _i54.PageInfo<GrnpCameraRouteArgs> page =
      _i54.PageInfo<GrnpCameraRouteArgs>(name);
}

class GrnpCameraRouteArgs {
  const GrnpCameraRouteArgs({
    this.key,
    required this.description,
  });

  final _i55.Key? key;

  final _i58.CameraDescription description;

  @override
  String toString() {
    return 'GrnpCameraRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i20.GrnpCheckScreen]
class GrnpCheckRoute extends _i54.PageRouteInfo<void> {
  const GrnpCheckRoute({List<_i54.PageRouteInfo>? children})
      : super(
          GrnpCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'GrnpCheckRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i21.GrnpSelfiePreviewScreen]
class GrnpSelfiePreviewRoute
    extends _i54.PageRouteInfo<GrnpSelfiePreviewRouteArgs> {
  GrnpSelfiePreviewRoute({
    required String? path,
    required Function onCheck,
    _i55.Key? key,
    List<_i54.PageRouteInfo>? children,
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

  static const _i54.PageInfo<GrnpSelfiePreviewRouteArgs> page =
      _i54.PageInfo<GrnpSelfiePreviewRouteArgs>(name);
}

class GrnpSelfiePreviewRouteArgs {
  const GrnpSelfiePreviewRouteArgs({
    required this.path,
    required this.onCheck,
    this.key,
  });

  final String? path;

  final Function onCheck;

  final _i55.Key? key;

  @override
  String toString() {
    return 'GrnpSelfiePreviewRouteArgs{path: $path, onCheck: $onCheck, key: $key}';
  }
}

/// generated route for
/// [_i22.GrnpSelfieScreen]
class GrnpSelfieRoute extends _i54.PageRouteInfo<void> {
  const GrnpSelfieRoute({List<_i54.PageRouteInfo>? children})
      : super(
          GrnpSelfieRoute.name,
          initialChildren: children,
        );

  static const String name = 'GrnpSelfieRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i23.KKMScreen]
class KKMRoute extends _i54.PageRouteInfo<void> {
  const KKMRoute({List<_i54.PageRouteInfo>? children})
      : super(
          KKMRoute.name,
          initialChildren: children,
        );

  static const String name = 'KKMRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i24.MyCertficateScreen]
class MyCertficateRoute extends _i54.PageRouteInfo<MyCertficateRouteArgs> {
  MyCertficateRoute({
    _i55.Key? key,
    String? certUrl,
    required _i59.CheckHasIPModel model,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          MyCertficateRoute.name,
          args: MyCertficateRouteArgs(
            key: key,
            certUrl: certUrl,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'MyCertficateRoute';

  static const _i54.PageInfo<MyCertficateRouteArgs> page =
      _i54.PageInfo<MyCertficateRouteArgs>(name);
}

class MyCertficateRouteArgs {
  const MyCertficateRouteArgs({
    this.key,
    this.certUrl,
    required this.model,
  });

  final _i55.Key? key;

  final String? certUrl;

  final _i59.CheckHasIPModel model;

  @override
  String toString() {
    return 'MyCertficateRouteArgs{key: $key, certUrl: $certUrl, model: $model}';
  }
}

/// generated route for
/// [_i25.NalogMainScreen]
class NalogMainRoute extends _i54.PageRouteInfo<void> {
  const NalogMainRoute({List<_i54.PageRouteInfo>? children})
      : super(
          NalogMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'NalogMainRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i26.OEPCameraScreen]
class OEPCameraRoute extends _i54.PageRouteInfo<OEPCameraRouteArgs> {
  OEPCameraRoute({
    _i55.Key? key,
    required _i58.CameraDescription description,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          OEPCameraRoute.name,
          args: OEPCameraRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'OEPCameraRoute';

  static const _i54.PageInfo<OEPCameraRouteArgs> page =
      _i54.PageInfo<OEPCameraRouteArgs>(name);
}

class OEPCameraRouteArgs {
  const OEPCameraRouteArgs({
    this.key,
    required this.description,
  });

  final _i55.Key? key;

  final _i58.CameraDescription description;

  @override
  String toString() {
    return 'OEPCameraRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i27.OEPFinishScreen]
class OEPFinishRoute extends _i54.PageRouteInfo<void> {
  const OEPFinishRoute({List<_i54.PageRouteInfo>? children})
      : super(
          OEPFinishRoute.name,
          initialChildren: children,
        );

  static const String name = 'OEPFinishRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i28.OEPRegisterScreen]
class OEPRegisterRoute extends _i54.PageRouteInfo<void> {
  const OEPRegisterRoute({List<_i54.PageRouteInfo>? children})
      : super(
          OEPRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'OEPRegisterRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i29.OpenAccountScreen]
class OpenAccountRoute extends _i54.PageRouteInfo<OpenAccountRouteArgs> {
  OpenAccountRoute({
    _i55.Key? key,
    required String partyId,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          OpenAccountRoute.name,
          args: OpenAccountRouteArgs(
            key: key,
            partyId: partyId,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenAccountRoute';

  static const _i54.PageInfo<OpenAccountRouteArgs> page =
      _i54.PageInfo<OpenAccountRouteArgs>(name);
}

class OpenAccountRouteArgs {
  const OpenAccountRouteArgs({
    this.key,
    required this.partyId,
  });

  final _i55.Key? key;

  final String partyId;

  @override
  String toString() {
    return 'OpenAccountRouteArgs{key: $key, partyId: $partyId}';
  }
}

/// generated route for
/// [_i30.PdfViewScreen]
class PdfViewRoute extends _i54.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i55.Key? key,
    required String path,
    bool isNetwork = false,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          PdfViewRoute.name,
          args: PdfViewRouteArgs(
            key: key,
            path: path,
            isNetwork: isNetwork,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewRoute';

  static const _i54.PageInfo<PdfViewRouteArgs> page =
      _i54.PageInfo<PdfViewRouteArgs>(name);
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({
    this.key,
    required this.path,
    this.isNetwork = false,
  });

  final _i55.Key? key;

  final String path;

  final bool isNetwork;

  @override
  String toString() {
    return 'PdfViewRouteArgs{key: $key, path: $path, isNetwork: $isNetwork}';
  }
}

/// generated route for
/// [_i31.PinCodeCreateScreen]
class PinCodeCreateRoute extends _i54.PageRouteInfo<PinCodeCreateRouteArgs> {
  PinCodeCreateRoute({
    _i55.Key? key,
    bool isNewPin = false,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          PinCodeCreateRoute.name,
          args: PinCodeCreateRouteArgs(
            key: key,
            isNewPin: isNewPin,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeCreateRoute';

  static const _i54.PageInfo<PinCodeCreateRouteArgs> page =
      _i54.PageInfo<PinCodeCreateRouteArgs>(name);
}

class PinCodeCreateRouteArgs {
  const PinCodeCreateRouteArgs({
    this.key,
    this.isNewPin = false,
  });

  final _i55.Key? key;

  final bool isNewPin;

  @override
  String toString() {
    return 'PinCodeCreateRouteArgs{key: $key, isNewPin: $isNewPin}';
  }
}

/// generated route for
/// [_i32.PinCodeEnterScreen]
class PinCodeEnterRoute extends _i54.PageRouteInfo<PinCodeEnterRouteArgs> {
  PinCodeEnterRoute({
    _i55.Key? key,
    bool isPushed = false,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          PinCodeEnterRoute.name,
          args: PinCodeEnterRouteArgs(
            key: key,
            isPushed: isPushed,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeEnterRoute';

  static const _i54.PageInfo<PinCodeEnterRouteArgs> page =
      _i54.PageInfo<PinCodeEnterRouteArgs>(name);
}

class PinCodeEnterRouteArgs {
  const PinCodeEnterRouteArgs({
    this.key,
    this.isPushed = false,
  });

  final _i55.Key? key;

  final bool isPushed;

  @override
  String toString() {
    return 'PinCodeEnterRouteArgs{key: $key, isPushed: $isPushed}';
  }
}

/// generated route for
/// [_i33.PinCodeRepeatScreen]
class PinCodeRepeatRoute extends _i54.PageRouteInfo<PinCodeRepeatRouteArgs> {
  PinCodeRepeatRoute({
    _i55.Key? key,
    required String firstPin,
    required bool isNewPin,
    List<_i54.PageRouteInfo>? children,
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

  static const _i54.PageInfo<PinCodeRepeatRouteArgs> page =
      _i54.PageInfo<PinCodeRepeatRouteArgs>(name);
}

class PinCodeRepeatRouteArgs {
  const PinCodeRepeatRouteArgs({
    this.key,
    required this.firstPin,
    required this.isNewPin,
  });

  final _i55.Key? key;

  final String firstPin;

  final bool isNewPin;

  @override
  String toString() {
    return 'PinCodeRepeatRouteArgs{key: $key, firstPin: $firstPin, isNewPin: $isNewPin}';
  }
}

/// generated route for
/// [_i34.RecoveryPasswordChoiseTypeScreen]
class RecoveryPasswordChoiseTypeRoute extends _i54.PageRouteInfo<void> {
  const RecoveryPasswordChoiseTypeRoute({List<_i54.PageRouteInfo>? children})
      : super(
          RecoveryPasswordChoiseTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordChoiseTypeRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i35.RecoveryPasswordEnterInnScreen]
class RecoveryPasswordEnterInnRoute
    extends _i54.PageRouteInfo<RecoveryPasswordEnterInnRouteArgs> {
  RecoveryPasswordEnterInnRoute({
    _i55.Key? key,
    bool isSmsRecovery = false,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          RecoveryPasswordEnterInnRoute.name,
          args: RecoveryPasswordEnterInnRouteArgs(
            key: key,
            isSmsRecovery: isSmsRecovery,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterInnRoute';

  static const _i54.PageInfo<RecoveryPasswordEnterInnRouteArgs> page =
      _i54.PageInfo<RecoveryPasswordEnterInnRouteArgs>(name);
}

class RecoveryPasswordEnterInnRouteArgs {
  const RecoveryPasswordEnterInnRouteArgs({
    this.key,
    this.isSmsRecovery = false,
  });

  final _i55.Key? key;

  final bool isSmsRecovery;

  @override
  String toString() {
    return 'RecoveryPasswordEnterInnRouteArgs{key: $key, isSmsRecovery: $isSmsRecovery}';
  }
}

/// generated route for
/// [_i36.RecoveryPasswordEnterNewPasswordScreen]
class RecoveryPasswordEnterNewPasswordRoute extends _i54.PageRouteInfo<void> {
  const RecoveryPasswordEnterNewPasswordRoute(
      {List<_i54.PageRouteInfo>? children})
      : super(
          RecoveryPasswordEnterNewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterNewPasswordRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i37.RecoveryPasswordEnterSmsCodeScreen]
class RecoveryPasswordEnterSmsCodeRoute
    extends _i54.PageRouteInfo<RecoveryPasswordEnterSmsCodeRouteArgs> {
  RecoveryPasswordEnterSmsCodeRoute({
    _i55.Key? key,
    bool isSmsRecovery = false,
    required String contact,
    List<_i54.PageRouteInfo>? children,
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

  static const _i54.PageInfo<RecoveryPasswordEnterSmsCodeRouteArgs> page =
      _i54.PageInfo<RecoveryPasswordEnterSmsCodeRouteArgs>(name);
}

class RecoveryPasswordEnterSmsCodeRouteArgs {
  const RecoveryPasswordEnterSmsCodeRouteArgs({
    this.key,
    this.isSmsRecovery = false,
    required this.contact,
  });

  final _i55.Key? key;

  final bool isSmsRecovery;

  final String contact;

  @override
  String toString() {
    return 'RecoveryPasswordEnterSmsCodeRouteArgs{key: $key, isSmsRecovery: $isSmsRecovery, contact: $contact}';
  }
}

/// generated route for
/// [_i38.RecoveryPinCodeChoiseTypeScreen]
class RecoveryPinCodeChoiseTypeRoute
    extends _i54.PageRouteInfo<RecoveryPinCodeChoiseTypeRouteArgs> {
  RecoveryPinCodeChoiseTypeRoute({
    _i55.Key? key,
    required String password,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          RecoveryPinCodeChoiseTypeRoute.name,
          args: RecoveryPinCodeChoiseTypeRouteArgs(
            key: key,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeChoiseTypeRoute';

  static const _i54.PageInfo<RecoveryPinCodeChoiseTypeRouteArgs> page =
      _i54.PageInfo<RecoveryPinCodeChoiseTypeRouteArgs>(name);
}

class RecoveryPinCodeChoiseTypeRouteArgs {
  const RecoveryPinCodeChoiseTypeRouteArgs({
    this.key,
    required this.password,
  });

  final _i55.Key? key;

  final String password;

  @override
  String toString() {
    return 'RecoveryPinCodeChoiseTypeRouteArgs{key: $key, password: $password}';
  }
}

/// generated route for
/// [_i39.RecoveryPinCodeEnterEsiPasswordScreen]
class RecoveryPinCodeEnterEsiPasswordRoute extends _i54.PageRouteInfo<void> {
  const RecoveryPinCodeEnterEsiPasswordRoute(
      {List<_i54.PageRouteInfo>? children})
      : super(
          RecoveryPinCodeEnterEsiPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeEnterEsiPasswordRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i40.RecoveryPinCodeEnterSmsCodeScreen]
class RecoveryPinCodeEnterSmsCodeRoute
    extends _i54.PageRouteInfo<RecoveryPinCodeEnterSmsCodeRouteArgs> {
  RecoveryPinCodeEnterSmsCodeRoute({
    _i55.Key? key,
    required String method,
    required String userId,
    List<_i54.PageRouteInfo>? children,
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

  static const _i54.PageInfo<RecoveryPinCodeEnterSmsCodeRouteArgs> page =
      _i54.PageInfo<RecoveryPinCodeEnterSmsCodeRouteArgs>(name);
}

class RecoveryPinCodeEnterSmsCodeRouteArgs {
  const RecoveryPinCodeEnterSmsCodeRouteArgs({
    this.key,
    required this.method,
    required this.userId,
  });

  final _i55.Key? key;

  final String method;

  final String userId;

  @override
  String toString() {
    return 'RecoveryPinCodeEnterSmsCodeRouteArgs{key: $key, method: $method, userId: $userId}';
  }
}

/// generated route for
/// [_i41.RegisterIPMainScreen]
class RegisterIPMainRoute extends _i54.PageRouteInfo<void> {
  const RegisterIPMainRoute({List<_i54.PageRouteInfo>? children})
      : super(
          RegisterIPMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIPMainRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i42.RegisterIPNextScreen]
class RegisterIPNextRoute extends _i54.PageRouteInfo<RegisterIPNextRouteArgs> {
  RegisterIPNextRoute({
    _i55.Key? key,
    required bool isPatent,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          RegisterIPNextRoute.name,
          args: RegisterIPNextRouteArgs(
            key: key,
            isPatent: isPatent,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIPNextRoute';

  static const _i54.PageInfo<RegisterIPNextRouteArgs> page =
      _i54.PageInfo<RegisterIPNextRouteArgs>(name);
}

class RegisterIPNextRouteArgs {
  const RegisterIPNextRouteArgs({
    this.key,
    required this.isPatent,
  });

  final _i55.Key? key;

  final bool isPatent;

  @override
  String toString() {
    return 'RegisterIPNextRouteArgs{key: $key, isPatent: $isPatent}';
  }
}

/// generated route for
/// [_i43.RegisterIPTypeOfActivityScreen]
class RegisterIPTypeOfActivityRoute
    extends _i54.PageRouteInfo<RegisterIPTypeOfActivityRouteArgs> {
  RegisterIPTypeOfActivityRoute({
    _i55.Key? key,
    required List<_i60.TaxModel> models,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          RegisterIPTypeOfActivityRoute.name,
          args: RegisterIPTypeOfActivityRouteArgs(
            key: key,
            models: models,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIPTypeOfActivityRoute';

  static const _i54.PageInfo<RegisterIPTypeOfActivityRouteArgs> page =
      _i54.PageInfo<RegisterIPTypeOfActivityRouteArgs>(name);
}

class RegisterIPTypeOfActivityRouteArgs {
  const RegisterIPTypeOfActivityRouteArgs({
    this.key,
    required this.models,
  });

  final _i55.Key? key;

  final List<_i60.TaxModel> models;

  @override
  String toString() {
    return 'RegisterIPTypeOfActivityRouteArgs{key: $key, models: $models}';
  }
}

/// generated route for
/// [_i44.RegisterIpConfirmOepScreen]
class RegisterIpConfirmOepRoute extends _i54.PageRouteInfo<void> {
  const RegisterIpConfirmOepRoute({List<_i54.PageRouteInfo>? children})
      : super(
          RegisterIpConfirmOepRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIpConfirmOepRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i45.RegisterIpSelectModesScreen]
class RegisterIpSelectModesRoute
    extends _i54.PageRouteInfo<RegisterIpSelectModesRouteArgs> {
  RegisterIpSelectModesRoute({
    _i55.Key? key,
    required List<_i60.TaxModel> models,
    List<_i54.PageRouteInfo>? children,
  }) : super(
          RegisterIpSelectModesRoute.name,
          args: RegisterIpSelectModesRouteArgs(
            key: key,
            models: models,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIpSelectModesRoute';

  static const _i54.PageInfo<RegisterIpSelectModesRouteArgs> page =
      _i54.PageInfo<RegisterIpSelectModesRouteArgs>(name);
}

class RegisterIpSelectModesRouteArgs {
  const RegisterIpSelectModesRouteArgs({
    this.key,
    required this.models,
  });

  final _i55.Key? key;

  final List<_i60.TaxModel> models;

  @override
  String toString() {
    return 'RegisterIpSelectModesRouteArgs{key: $key, models: $models}';
  }
}

/// generated route for
/// [_i46.RegisterIpSigninScreen]
class RegisterIpSigninRoute extends _i54.PageRouteInfo<void> {
  const RegisterIpSigninRoute({List<_i54.PageRouteInfo>? children})
      : super(
          RegisterIpSigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIpSigninRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i47.Screen914]
class Route914 extends _i54.PageRouteInfo<void> {
  const Route914({List<_i54.PageRouteInfo>? children})
      : super(
          Route914.name,
          args: Route914Args(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'Route914';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i48.Screen9141]
class Route9141 extends _i54.PageRouteInfo<void> {
  const Route9141({List<_i54.PageRouteInfo>? children})
      : super(
          Route9141.name,
          args: Route9141Args(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'Route9141';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i49.Screen9142]
class Route9142 extends _i54.PageRouteInfo<void> {
  const Route9142({List<_i54.PageRouteInfo>? children})
      : super(
          Route9142.name,
          args: Route9142Args(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'Route9142';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i50.SelfiePreviewScreen]
class SelfiePreviewRoute extends _i54.PageRouteInfo<SelfiePreviewRouteArgs> {
  SelfiePreviewRoute({
    required String? path,
    required Function onCheck,
    _i55.Key? key,
    List<_i54.PageRouteInfo>? children,
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

  static const _i54.PageInfo<SelfiePreviewRouteArgs> page =
      _i54.PageInfo<SelfiePreviewRouteArgs>(name);
}

class SelfiePreviewRouteArgs {
  const SelfiePreviewRouteArgs({
    required this.path,
    required this.onCheck,
    this.key,
  });

  final String? path;

  final Function onCheck;

  final _i55.Key? key;

  @override
  String toString() {
    return 'SelfiePreviewRouteArgs{path: $path, onCheck: $onCheck, key: $key}';
  }
}

/// generated route for
/// [_i51.SettingsAboutScreen]
class SettingsAboutRoute extends _i54.PageRouteInfo<void> {
  const SettingsAboutRoute({List<_i54.PageRouteInfo>? children})
      : super(
          SettingsAboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsAboutRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i52.SettingsHelpScreen]
class SettingsHelpRoute extends _i54.PageRouteInfo<void> {
  const SettingsHelpRoute({List<_i54.PageRouteInfo>? children})
      : super(
          SettingsHelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsHelpRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}

/// generated route for
/// [_i53.SplashScreen]
class SplashRoute extends _i54.PageRouteInfo<void> {
  const SplashRoute({List<_i54.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i54.PageInfo<void> page = _i54.PageInfo<void>(name);
}
