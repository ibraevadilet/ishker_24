import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class ForgotPinTextWidget extends StatelessWidget {
  const ForgotPinTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          TextButton(
            onPressed: () {
              AppRouting.pushFunction(
                const RecoveryPinCodeEnterEsiPasswordRoute(),
              );
            },
            child: Text(
              'Забыли пин-код?',
              style: AppTextStyles.s16W400(
                color: AppColors.esiMainBlueColor,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
