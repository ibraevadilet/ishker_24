import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/main.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/utils/app_device_info.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/translations/codegen_loader.g.dart';

import 'core/constants/constants.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      supportedLocales: const [Locale('ru'), Locale('ky')],
      fallbackLocale: const Locale('ru'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthCubit(sl<AppDeviceInfo>(), exitUseCase: sl()),
          )
        ],
        child: MaterialApp(
          title: AppTextConstants.appTitle,
          navigatorKey: rootNavigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: initialRoute,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
