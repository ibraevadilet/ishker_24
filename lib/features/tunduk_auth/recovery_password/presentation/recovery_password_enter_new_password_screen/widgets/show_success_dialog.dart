import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/shapes.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/spaces.dart';

Future<void> showSuccessDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: AppShapes.dialogShape(),
      content: SizedBox(
        width: context.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.esiSuccessIcon,
              height: 70,
            ),
            const SizedBox(height: 22),
            Text(
              'Вы успешно\nсбросили пароль',
              style: AppTextStyles.s22W600(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            CustomButton(
              color: AppColors.esiMainBlueColor,
              onPress: () {
                Navigator.pop(context);
              },
              text: 'OK',
            )
          ],
        ),
      ),
    ),
  );
}
