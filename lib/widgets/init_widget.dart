import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bottom_navigator/logic/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/domain/use_cases/get_tokens_use_case.dart';
import 'package:ishker_24/routes/mobile_auto_router.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/translations/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitWidget extends StatefulWidget {
  const InitWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  State<InitWidget> createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final token =
        sl<SharedPreferences>().getString(SharedKeys.accessToken) ?? '';
    final pin = sl<GetTokensUseCase>().pin;

    if (state == AppLifecycleState.paused) {
      final isEsfRoute = sl<AppRouter>().currentPath != '/esf-route';
      final isTokenNotEmpty = token.isNotEmpty;
      final pinIsTest = pin != '12345678987654';

      if (isTokenNotEmpty && pinIsTest && isEsfRoute) {
        sl<SharedPreferences>().remove(SharedKeys.accessToken);
        AppRouting.pushFunction(PinCodeEnterRoute(isPushed: true));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      supportedLocales: const [
        Locale('ru'),
        Locale('ky'),
      ],
      fallbackLocale: const Locale('ru'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<BottomNavigatorCubit>(),
          ),
        ],
        child: widget.child,
      ),
    );
  }
}
