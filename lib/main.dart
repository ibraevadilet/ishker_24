import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:ishker_24/core/utils/text_scaler.dart';
import 'package:ishker_24/routes/mobile_auto_router.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/init_widget.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appRouter = sl<AppRouter>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  await initServiceLocator();

  // Bloc.observer = const AppBlocObserver();

  // android emu dev mode workaround through HandshakeException CERTIFICATE_VERIFY_FAILED
  if (kDebugMode) HttpOverrides.global = MyHttpOverrides();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: CustomTextScaler.freezed(context),
        ),
        child: Builder(
          builder: (context) => MaterialApp.router(
            scaffoldMessengerKey: scaffoldKey,
            theme: lightTheme,
            title: AppTextConstants.appTitle,
            debugShowCheckedModeBanner: false,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(appRouter),
            routeInformationProvider: appRouter.routeInfoProvider(),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
