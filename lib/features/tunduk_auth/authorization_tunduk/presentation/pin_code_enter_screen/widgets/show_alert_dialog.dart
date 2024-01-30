import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/spaces.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showBioDialog(BuildContext context, String pinCode) async {
  final LocalAuthentication auth = LocalAuthentication();
  final bool isSupported = await auth.isDeviceSupported();
  final prefs = sl<SharedPreferences>();
  final savedPin = prefs.getString(SharedKeys.pinCode) ?? '';

  if (isSupported && savedPin.isEmpty) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: SizedBox(
          width: context.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Platform.isAndroid
                    ? AppImages.fingerPrintIconSvg
                    : AppImages.faceIdIconSvg,
                height: 45,
              ),
              const SizedBox(height: 12),
              Text(
                'Разрешите авторизацию через биометрию, чтобы не вводить ПИН-код каждый раз',
                style: AppTextStyles.s20W600(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Нет',
                        style: AppTextStyles.s20W600(
                          color: AppColors.esiMainBlueColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      color: AppColors.esiMainBlueColor,
                      onPress: () async {
                        prefs.setString(SharedKeys.pinCode, pinCode);
                        Navigator.pop(context);
                      },
                      text: 'Разрешить',
                      textStyle: AppTextStyles.s20W600(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
