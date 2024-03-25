import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/features/auth/domain/entity/auth_entity.dart';
import 'package:ishker_24/src/features/auth/domain/entity/confirm_code_entity.dart';
import 'package:ishker_24/src/features/auth/view/grnp/grnp_screen.dart';
import 'package:ishker_24/src/features/auth/view/oep_signup_page.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/cubit/history_cubit.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/history_page.dart';

import 'core/widgets/camera_page.dart';
import 'features/auth/view/confirm/confirm_page.dart';
import 'features/auth/view/grnp/grnp_create/grnp_create_page.dart';
import 'features/auth/view/login/login_page.dart';
import 'features/auth/view/pincode/create/pincode_create_page.dart';
import 'features/auth/view/pincode/enter/pincode_enter_page.dart';
import 'features/auth/view/splash/splash_page.dart';
import 'features/auth/view/widgets/pdf_view_screen.dart';
import 'features/client/view/has_ip_widget.dart';

//routes
const String initialRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String pinCodeRoute = '/pincode';
const String pinCodeEnterRoute = '/pincodeEnter';
const String pdfRoute = '/pdf';
const String confirmRoute = '/confirm';
const String grnpRoute = '/grnp';
const String grnpCreateRoute = '/grnpCreate';
const String cameraRoute = '/grnpCamera';
const String accountHistoryRoute = '/accountHistory';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pdfRoute:
        final path = settings.arguments as String;

        return MaterialPageRoute(builder: (_) => PdfViewScreen(path: path));

      case signupRoute:
        return MaterialPageRoute(builder: (_) => const OepSignUpPage());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case confirmRoute:
        final authEntity = settings.arguments as AuthEntity;

        return MaterialPageRoute(
          builder: (_) => ConfirmPage(authEntity: authEntity),
        );

      case pinCodeRoute:
        final confirm = settings.arguments as ConfirmCodeEntity?;

        return MaterialPageRoute(builder: (_) => PinCodePage(confirm: confirm));

      case pinCodeEnterRoute:
        return MaterialPageRoute(builder: (_) => const PinCodeEnterPage());

      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HasIpWidget());

      case grnpRoute:
        return MaterialPageRoute(builder: (_) => const CheckGrnpPage());

      case grnpCreateRoute:
        return MaterialPageRoute(builder: (_) => const GrnpCreatePage());

      case cameraRoute:
        final description = settings.arguments as CameraDescription;

        return MaterialPageRoute(
          builder: (_) => CameraPage(description: description),
        );

      case accountHistoryRoute:
        final cubit = settings.arguments as HistoryCubit;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const HistoryPage(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const InitialPage());
    }
  }
}
