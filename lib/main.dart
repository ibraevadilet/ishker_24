import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app.dart';
import 'src/core/utils/bloc_observer.dart';
import 'src/di.dart' as locator;
import 'translations/codegen_loader.g.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
// final appRouter = sl<AppRouter>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);
  Bloc.observer = const AppBlocObserver();

  await locator.init();

  // android emu dev mode workaround through HandshakeException CERTIFICATE_VERIFY_FAILED
  if (kDebugMode) HttpOverrides.global = MyHttpOverrides();

  // Bloc.observer = const AppBlocObserver();

  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      supportedLocales: const [Locale('ru'), Locale('ky')],
      fallbackLocale: const Locale('ru'),
      child: const App(),
      // child: MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //       create: (context) => sl<BottomNavigatorCubit>(),
      //     ),
      //   ],
      //   child: widget.child,
      // ),
    ),
  );
}

// void main() async {
//   await initServiceLocator();

//   HttpOverrides.global = MyHttpOverrides();

//   runApp(const Main());
// }

// class Main extends StatelessWidget {
//   const Main({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InitWidget(
//       child: Builder(
//         builder: (context) => MaterialApp.router(
//           scaffoldMessengerKey: scaffoldKey,
//           theme: lightTheme,
//           title: AppTextConstants.appTitle,
//           debugShowCheckedModeBanner: false,
//           routeInformationParser: appRouter.defaultRouteParser(),
//           routerDelegate: AutoRouterDelegate(appRouter),
//           routeInformationProvider: appRouter.routeInfoProvider(),
//           supportedLocales: context.supportedLocales,
//           localizationsDelegates: context.localizationDelegates,
//           locale: context.locale,
//         ),
//       ),
//     );
//   }
// }
