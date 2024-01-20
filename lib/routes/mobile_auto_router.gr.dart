// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:camera/camera.dart' as _i33;
import 'package:flutter/material.dart' as _i32;
import 'package:ishker_24/features/bottom_navigator/bottom_navigator_screen.dart'
    as _i4;
import 'package:ishker_24/features/my_ip/presentation/my_certificate_screen/my_certficate_screen.dart'
    as _i7;
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart'
    as _i34;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_confirm_oep_screen.dart'
    as _i24;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_main_screen.dart'
    as _i21;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_next_screen.dart'
    as _i22;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_select_modes_screen.dart'
    as _i25;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_signin_screen.dart'
    as _i26;
import 'package:ishker_24/features/register_ip/presentation/screens/register_ip_type_of_activity_screen.dart'
    as _i23;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/ces_selfie_ident_screen.dart'
    as _i5;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/oep_camera_screen.dart'
    as _i8;
import 'package:ishker_24/features/register_oep/presentation/oep_camera_screen/selife_preview_screen.dart'
    as _i27;
import 'package:ishker_24/features/register_oep/presentation/oep_finish_screen/oep_finish_screen.dart'
    as _i9;
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/oep_register_screen.dart'
    as _i10;
import 'package:ishker_24/features/settings/presentation/settings_about_screen/settings_about_screen.dart'
    as _i28;
import 'package:ishker_24/features/settings/presentation/settings_help_screen/settings_help_screen.dart'
    as _i29;
import 'package:ishker_24/features/splash/splash_screen.dart' as _i30;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_confirm_code_screen/auth_confirm_code_screen.dart'
    as _i1;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_screen/auth_screen.dart'
    as _i2;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/auth_send_confirm_screen.dart'
    as _i3;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/error_screen/error_screen.dart'
    as _i6;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_create_screen/pin_code_create_screen.dart'
    as _i11;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_enter_screen/pin_code_enter_screen.dart'
    as _i12;
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/pin_code_repeat_screen/pin_code_repeat_screen.dart'
    as _i13;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_choise_type_screen/recovery_password_choise_type_screen.dart'
    as _i14;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_inn_screen/recovery_password_enter_inn_screen.dart'
    as _i15;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_new_password_screen/recovery_password_enter_new_password_screen.dart'
    as _i16;
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_sms_code_screen/recovery_password_enter_sms_code_screen.dart'
    as _i17;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_choise_type_screen/recovery_pin_code_choise_type_screen.dart'
    as _i18;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_esi_password_screen/recovery_pin_code_enter_esi_password_screen.dart'
    as _i19;
import 'package:ishker_24/features/tunduk_auth/recovery_pin_code/presentation/recovery_pin_code_enter_sms_code_screen/recovery_pin_code_enter_sms_code_screen.dart'
    as _i20;

abstract class $AppRouter extends _i31.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    AuthConfirmCodeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthConfirmCodeScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    AuthSendConfirmRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AuthSendConfirmScreen(),
      );
    },
    BottomNavigatorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BottomNavigatorScreen(),
      );
    },
    CesSelfieRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CesSelfieScreen(),
      );
    },
    EsiErrorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EsiErrorScreen(),
      );
    },
    MyCertficateRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MyCertficateScreen(),
      );
    },
    OEPCameraRoute.name: (routeData) {
      final args = routeData.argsAs<OEPCameraRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OEPCameraScreen(
          key: args.key,
          description: args.description,
        ),
      );
    },
    OEPFinishRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OEPFinishScreen(),
      );
    },
    OEPRegisterRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OEPRegisterScreen(),
      );
    },
    PinCodeCreateRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeCreateRouteArgs>(
          orElse: () => const PinCodeCreateRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.PinCodeCreateScreen(
          key: args.key,
          isNewPin: args.isNewPin,
        ),
      );
    },
    PinCodeEnterRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PinCodeEnterScreen(),
      );
    },
    PinCodeRepeatRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeRepeatRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.PinCodeRepeatScreen(
          key: args.key,
          firstPin: args.firstPin,
        ),
      );
    },
    RecoveryPasswordChoiseTypeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RecoveryPasswordChoiseTypeScreen(),
      );
    },
    RecoveryPasswordEnterInnRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPasswordEnterInnRouteArgs>(
          orElse: () => const RecoveryPasswordEnterInnRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.RecoveryPasswordEnterInnScreen(
          key: args.key,
          isSmsRecovery: args.isSmsRecovery,
        ),
      );
    },
    RecoveryPasswordEnterNewPasswordRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.RecoveryPasswordEnterNewPasswordScreen(),
      );
    },
    RecoveryPasswordEnterSmsCodeRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryPasswordEnterSmsCodeRouteArgs>(
          orElse: () => const RecoveryPasswordEnterSmsCodeRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.RecoveryPasswordEnterSmsCodeScreen(
          key: args.key,
          isSmsRecovery: args.isSmsRecovery,
        ),
      );
    },
    RecoveryPinCodeChoiseTypeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RecoveryPinCodeChoiseTypeScreen(),
      );
    },
    RecoveryPinCodeEnterEsiPasswordRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RecoveryPinCodeEnterEsiPasswordScreen(),
      );
    },
    RecoveryPinCodeEnterSmsCodeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RecoveryPinCodeEnterSmsCodeScreen(),
      );
    },
    RegisterIPMainRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.RegisterIPMainScreen(),
      );
    },
    RegisterIPNextRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIPNextRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.RegisterIPNextScreen(
          key: args.key,
          isPatent: args.isPatent,
        ),
      );
    },
    RegisterIPTypeOfActivityRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIPTypeOfActivityRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.RegisterIPTypeOfActivityScreen(
          key: args.key,
          models: args.models,
        ),
      );
    },
    RegisterIpConfirmOepRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.RegisterIpConfirmOepScreen(),
      );
    },
    RegisterIpSelectModesRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterIpSelectModesRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.RegisterIpSelectModesScreen(
          key: args.key,
          models: args.models,
        ),
      );
    },
    RegisterIpSigninRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.RegisterIpSigninScreen(),
      );
    },
    SelfiePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<SelfiePreviewRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.SelfiePreviewScreen(
          args.path,
          args.onCheck,
          key: args.key,
        ),
      );
    },
    SettingsAboutRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SettingsAboutScreen(),
      );
    },
    SettingsHelpRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SettingsHelpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthConfirmCodeScreen]
class AuthConfirmCodeRoute extends _i31.PageRouteInfo<void> {
  const AuthConfirmCodeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AuthConfirmCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConfirmCodeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i31.PageRouteInfo<void> {
  const AuthRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthSendConfirmScreen]
class AuthSendConfirmRoute extends _i31.PageRouteInfo<void> {
  const AuthSendConfirmRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AuthSendConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthSendConfirmRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BottomNavigatorScreen]
class BottomNavigatorRoute extends _i31.PageRouteInfo<void> {
  const BottomNavigatorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          BottomNavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigatorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CesSelfieScreen]
class CesSelfieRoute extends _i31.PageRouteInfo<void> {
  const CesSelfieRoute({List<_i31.PageRouteInfo>? children})
      : super(
          CesSelfieRoute.name,
          initialChildren: children,
        );

  static const String name = 'CesSelfieRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EsiErrorScreen]
class EsiErrorRoute extends _i31.PageRouteInfo<void> {
  const EsiErrorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          EsiErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'EsiErrorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MyCertficateScreen]
class MyCertficateRoute extends _i31.PageRouteInfo<void> {
  const MyCertficateRoute({List<_i31.PageRouteInfo>? children})
      : super(
          MyCertficateRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCertficateRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OEPCameraScreen]
class OEPCameraRoute extends _i31.PageRouteInfo<OEPCameraRouteArgs> {
  OEPCameraRoute({
    _i32.Key? key,
    required _i33.CameraDescription description,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          OEPCameraRoute.name,
          args: OEPCameraRouteArgs(
            key: key,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'OEPCameraRoute';

  static const _i31.PageInfo<OEPCameraRouteArgs> page =
      _i31.PageInfo<OEPCameraRouteArgs>(name);
}

class OEPCameraRouteArgs {
  const OEPCameraRouteArgs({
    this.key,
    required this.description,
  });

  final _i32.Key? key;

  final _i33.CameraDescription description;

  @override
  String toString() {
    return 'OEPCameraRouteArgs{key: $key, description: $description}';
  }
}

/// generated route for
/// [_i9.OEPFinishScreen]
class OEPFinishRoute extends _i31.PageRouteInfo<void> {
  const OEPFinishRoute({List<_i31.PageRouteInfo>? children})
      : super(
          OEPFinishRoute.name,
          initialChildren: children,
        );

  static const String name = 'OEPFinishRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OEPRegisterScreen]
class OEPRegisterRoute extends _i31.PageRouteInfo<void> {
  const OEPRegisterRoute({List<_i31.PageRouteInfo>? children})
      : super(
          OEPRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'OEPRegisterRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PinCodeCreateScreen]
class PinCodeCreateRoute extends _i31.PageRouteInfo<PinCodeCreateRouteArgs> {
  PinCodeCreateRoute({
    _i32.Key? key,
    bool isNewPin = false,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PinCodeCreateRoute.name,
          args: PinCodeCreateRouteArgs(
            key: key,
            isNewPin: isNewPin,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeCreateRoute';

  static const _i31.PageInfo<PinCodeCreateRouteArgs> page =
      _i31.PageInfo<PinCodeCreateRouteArgs>(name);
}

class PinCodeCreateRouteArgs {
  const PinCodeCreateRouteArgs({
    this.key,
    this.isNewPin = false,
  });

  final _i32.Key? key;

  final bool isNewPin;

  @override
  String toString() {
    return 'PinCodeCreateRouteArgs{key: $key, isNewPin: $isNewPin}';
  }
}

/// generated route for
/// [_i12.PinCodeEnterScreen]
class PinCodeEnterRoute extends _i31.PageRouteInfo<void> {
  const PinCodeEnterRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PinCodeEnterRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeEnterRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PinCodeRepeatScreen]
class PinCodeRepeatRoute extends _i31.PageRouteInfo<PinCodeRepeatRouteArgs> {
  PinCodeRepeatRoute({
    _i32.Key? key,
    required String firstPin,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          PinCodeRepeatRoute.name,
          args: PinCodeRepeatRouteArgs(
            key: key,
            firstPin: firstPin,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeRepeatRoute';

  static const _i31.PageInfo<PinCodeRepeatRouteArgs> page =
      _i31.PageInfo<PinCodeRepeatRouteArgs>(name);
}

class PinCodeRepeatRouteArgs {
  const PinCodeRepeatRouteArgs({
    this.key,
    required this.firstPin,
  });

  final _i32.Key? key;

  final String firstPin;

  @override
  String toString() {
    return 'PinCodeRepeatRouteArgs{key: $key, firstPin: $firstPin}';
  }
}

/// generated route for
/// [_i14.RecoveryPasswordChoiseTypeScreen]
class RecoveryPasswordChoiseTypeRoute extends _i31.PageRouteInfo<void> {
  const RecoveryPasswordChoiseTypeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RecoveryPasswordChoiseTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordChoiseTypeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RecoveryPasswordEnterInnScreen]
class RecoveryPasswordEnterInnRoute
    extends _i31.PageRouteInfo<RecoveryPasswordEnterInnRouteArgs> {
  RecoveryPasswordEnterInnRoute({
    _i32.Key? key,
    bool isSmsRecovery = false,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          RecoveryPasswordEnterInnRoute.name,
          args: RecoveryPasswordEnterInnRouteArgs(
            key: key,
            isSmsRecovery: isSmsRecovery,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterInnRoute';

  static const _i31.PageInfo<RecoveryPasswordEnterInnRouteArgs> page =
      _i31.PageInfo<RecoveryPasswordEnterInnRouteArgs>(name);
}

class RecoveryPasswordEnterInnRouteArgs {
  const RecoveryPasswordEnterInnRouteArgs({
    this.key,
    this.isSmsRecovery = false,
  });

  final _i32.Key? key;

  final bool isSmsRecovery;

  @override
  String toString() {
    return 'RecoveryPasswordEnterInnRouteArgs{key: $key, isSmsRecovery: $isSmsRecovery}';
  }
}

/// generated route for
/// [_i16.RecoveryPasswordEnterNewPasswordScreen]
class RecoveryPasswordEnterNewPasswordRoute extends _i31.PageRouteInfo<void> {
  const RecoveryPasswordEnterNewPasswordRoute(
      {List<_i31.PageRouteInfo>? children})
      : super(
          RecoveryPasswordEnterNewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterNewPasswordRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i17.RecoveryPasswordEnterSmsCodeScreen]
class RecoveryPasswordEnterSmsCodeRoute
    extends _i31.PageRouteInfo<RecoveryPasswordEnterSmsCodeRouteArgs> {
  RecoveryPasswordEnterSmsCodeRoute({
    _i32.Key? key,
    bool isSmsRecovery = false,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          RecoveryPasswordEnterSmsCodeRoute.name,
          args: RecoveryPasswordEnterSmsCodeRouteArgs(
            key: key,
            isSmsRecovery: isSmsRecovery,
          ),
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordEnterSmsCodeRoute';

  static const _i31.PageInfo<RecoveryPasswordEnterSmsCodeRouteArgs> page =
      _i31.PageInfo<RecoveryPasswordEnterSmsCodeRouteArgs>(name);
}

class RecoveryPasswordEnterSmsCodeRouteArgs {
  const RecoveryPasswordEnterSmsCodeRouteArgs({
    this.key,
    this.isSmsRecovery = false,
  });

  final _i32.Key? key;

  final bool isSmsRecovery;

  @override
  String toString() {
    return 'RecoveryPasswordEnterSmsCodeRouteArgs{key: $key, isSmsRecovery: $isSmsRecovery}';
  }
}

/// generated route for
/// [_i18.RecoveryPinCodeChoiseTypeScreen]
class RecoveryPinCodeChoiseTypeRoute extends _i31.PageRouteInfo<void> {
  const RecoveryPinCodeChoiseTypeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RecoveryPinCodeChoiseTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeChoiseTypeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RecoveryPinCodeEnterEsiPasswordScreen]
class RecoveryPinCodeEnterEsiPasswordRoute extends _i31.PageRouteInfo<void> {
  const RecoveryPinCodeEnterEsiPasswordRoute(
      {List<_i31.PageRouteInfo>? children})
      : super(
          RecoveryPinCodeEnterEsiPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeEnterEsiPasswordRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RecoveryPinCodeEnterSmsCodeScreen]
class RecoveryPinCodeEnterSmsCodeRoute extends _i31.PageRouteInfo<void> {
  const RecoveryPinCodeEnterSmsCodeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RecoveryPinCodeEnterSmsCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPinCodeEnterSmsCodeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i21.RegisterIPMainScreen]
class RegisterIPMainRoute extends _i31.PageRouteInfo<void> {
  const RegisterIPMainRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RegisterIPMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIPMainRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i22.RegisterIPNextScreen]
class RegisterIPNextRoute extends _i31.PageRouteInfo<RegisterIPNextRouteArgs> {
  RegisterIPNextRoute({
    _i32.Key? key,
    required bool isPatent,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          RegisterIPNextRoute.name,
          args: RegisterIPNextRouteArgs(
            key: key,
            isPatent: isPatent,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIPNextRoute';

  static const _i31.PageInfo<RegisterIPNextRouteArgs> page =
      _i31.PageInfo<RegisterIPNextRouteArgs>(name);
}

class RegisterIPNextRouteArgs {
  const RegisterIPNextRouteArgs({
    this.key,
    required this.isPatent,
  });

  final _i32.Key? key;

  final bool isPatent;

  @override
  String toString() {
    return 'RegisterIPNextRouteArgs{key: $key, isPatent: $isPatent}';
  }
}

/// generated route for
/// [_i23.RegisterIPTypeOfActivityScreen]
class RegisterIPTypeOfActivityRoute
    extends _i31.PageRouteInfo<RegisterIPTypeOfActivityRouteArgs> {
  RegisterIPTypeOfActivityRoute({
    _i32.Key? key,
    required List<_i34.TaxModel> models,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          RegisterIPTypeOfActivityRoute.name,
          args: RegisterIPTypeOfActivityRouteArgs(
            key: key,
            models: models,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIPTypeOfActivityRoute';

  static const _i31.PageInfo<RegisterIPTypeOfActivityRouteArgs> page =
      _i31.PageInfo<RegisterIPTypeOfActivityRouteArgs>(name);
}

class RegisterIPTypeOfActivityRouteArgs {
  const RegisterIPTypeOfActivityRouteArgs({
    this.key,
    required this.models,
  });

  final _i32.Key? key;

  final List<_i34.TaxModel> models;

  @override
  String toString() {
    return 'RegisterIPTypeOfActivityRouteArgs{key: $key, models: $models}';
  }
}

/// generated route for
/// [_i24.RegisterIpConfirmOepScreen]
class RegisterIpConfirmOepRoute extends _i31.PageRouteInfo<void> {
  const RegisterIpConfirmOepRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RegisterIpConfirmOepRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIpConfirmOepRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i25.RegisterIpSelectModesScreen]
class RegisterIpSelectModesRoute
    extends _i31.PageRouteInfo<RegisterIpSelectModesRouteArgs> {
  RegisterIpSelectModesRoute({
    _i32.Key? key,
    required List<_i34.TaxModel> models,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          RegisterIpSelectModesRoute.name,
          args: RegisterIpSelectModesRouteArgs(
            key: key,
            models: models,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterIpSelectModesRoute';

  static const _i31.PageInfo<RegisterIpSelectModesRouteArgs> page =
      _i31.PageInfo<RegisterIpSelectModesRouteArgs>(name);
}

class RegisterIpSelectModesRouteArgs {
  const RegisterIpSelectModesRouteArgs({
    this.key,
    required this.models,
  });

  final _i32.Key? key;

  final List<_i34.TaxModel> models;

  @override
  String toString() {
    return 'RegisterIpSelectModesRouteArgs{key: $key, models: $models}';
  }
}

/// generated route for
/// [_i26.RegisterIpSigninScreen]
class RegisterIpSigninRoute extends _i31.PageRouteInfo<void> {
  const RegisterIpSigninRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RegisterIpSigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterIpSigninRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SelfiePreviewScreen]
class SelfiePreviewRoute extends _i31.PageRouteInfo<SelfiePreviewRouteArgs> {
  SelfiePreviewRoute({
    required String? path,
    required Function onCheck,
    _i32.Key? key,
    List<_i31.PageRouteInfo>? children,
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

  static const _i31.PageInfo<SelfiePreviewRouteArgs> page =
      _i31.PageInfo<SelfiePreviewRouteArgs>(name);
}

class SelfiePreviewRouteArgs {
  const SelfiePreviewRouteArgs({
    required this.path,
    required this.onCheck,
    this.key,
  });

  final String? path;

  final Function onCheck;

  final _i32.Key? key;

  @override
  String toString() {
    return 'SelfiePreviewRouteArgs{path: $path, onCheck: $onCheck, key: $key}';
  }
}

/// generated route for
/// [_i28.SettingsAboutScreen]
class SettingsAboutRoute extends _i31.PageRouteInfo<void> {
  const SettingsAboutRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SettingsAboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsAboutRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SettingsHelpScreen]
class SettingsHelpRoute extends _i31.PageRouteInfo<void> {
  const SettingsHelpRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SettingsHelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsHelpRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i30.SplashScreen]
class SplashRoute extends _i31.PageRouteInfo<void> {
  const SplashRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}
