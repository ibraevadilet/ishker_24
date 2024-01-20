import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/shapes.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/spaces.dart';

Future<void> showSuccessRegisterDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: AppShapes.bottomNavigatorShape(radius: 10),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      content: SizedBox(
        width: context.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ваша заявка  получена! Ожидайте\nответа в течение трех рабочих дней.',
              textAlign: TextAlign.center,
              style: AppTextStyles.s16W600(),
            ),
            const SizedBox(height: 24),
            CustomButton(
              onPress: () {
                AppRouting.pushAndPopUntilFunction(
                  const BottomNavigatorRoute(),
                );
              },
              text: 'Ок',
            ),
          ],
        ),
      ),
    ),
  );
}
