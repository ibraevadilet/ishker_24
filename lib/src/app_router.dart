import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/src/features/auth/domain/entity/auth_entity.dart';
import 'package:ishker_24/src/features/auth/domain/entity/confirm_code_entity.dart';
import 'package:ishker_24/src/features/auth/view/grnp/grnp_screen.dart';

import 'features/auth/view/confirm/confirm_page.dart';
import 'features/auth/view/grnp/grnp_create/grnp_camera_page.dart';
import 'features/auth/view/grnp/grnp_create/grnp_create_page.dart';
import 'features/auth/view/login/login_page.dart';
import 'features/auth/view/pincode/enter/pincode_enter_page.dart';
import 'features/auth/view/pincode/create/pincode_create_page.dart';
import 'features/auth/view/signup_page.dart';
import 'features/auth/view/splash/splash_page.dart';
import 'features/auth/view/widgets/pdf_view_screen.dart';
import 'features/home/home_page.dart';

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
const String grnpCameraRoute = '/grnpCamera';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pdfRoute:
        final path = settings.arguments as String;

        return MaterialPageRoute(builder: (_) => PdfViewScreen(path: path));

      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());

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
        return MaterialPageRoute(builder: (_) => const HomePage());

      case grnpRoute:
        return MaterialPageRoute(builder: (_) => const CheckGrnpPage());

      case grnpCreateRoute:
        return MaterialPageRoute(builder: (_) => const GrnpCreatePage());

      case grnpCameraRoute:
        final description = settings.arguments as CameraDescription;

        return MaterialPageRoute(
          builder: (_) => GrnpCameraPage(description: description),
        );

      default:
        return MaterialPageRoute(builder: (_) => const InitialPage());
    }
  }
}
