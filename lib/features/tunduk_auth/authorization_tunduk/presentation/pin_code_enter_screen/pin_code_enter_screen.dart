// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/forgot_pin_text_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/number_key_board_for_pin_code.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/pin_code_input_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class PinCodeEnterScreen extends StatefulWidget {
  const PinCodeEnterScreen({super.key});

  @override
  State<PinCodeEnterScreen> createState() => _PinCodeEnterScreenState();
}

class _PinCodeEnterScreenState extends State<PinCodeEnterScreen> {
  @override
  void initState() {
    initBiometric();
    super.initState();
  }

  final pinController = TextEditingController();

  Future<void> initBiometric() async {
    final prefs = sl<SharedPreferences>();
    final isBiometric = prefs.getBool(SharedKeys.isBiometric) ?? false;
    final LocalAuthentication auth = LocalAuthentication();
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      print(availableBiometrics);
      final bool didAuthenticate = await auth.authenticate(
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackgroundImageWidget(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(
              AppImages.esiPinTextLogoWhite,
              height: 36,
            ),
            const SizedBox(height: 32),
            Text(
              'Введите пин-код',
              style: AppTextStyles.s22W400(
                color: AppColors.color36424BGrey,
              ),
            ),
            const SizedBox(height: 12),
            PinCodeInputWidget(
              controller: pinController,
              onCompleted: (val) {
                AppRouting.pushAndPopUntilFunction(
                    const BottomNavigatorRoute());
              },
            ),
            const SizedBox(height: 20),
            NumberKeyBoardForPinCode(
              pinPutController: pinController,
              isBiometric: true,
            ),
            const ForgotPinTextWidget(),
          ],
        ),
      ),
    );
  }
}
