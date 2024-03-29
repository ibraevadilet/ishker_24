import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:ishker_24/main.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class AppSnackBar {
  static showSnackBar(
    String text, {
    bool isSuccess = false,
    int seconds = 2,
  }) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                isSuccess ? const Color(0xFF026405) : const Color(0xFFFF1100),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W400(color: Colors.white),
          ),
        ),
      ),
    );
  }

  static showToastAbaveSheet(
    BuildContext context,
    String text, {
    bool isSuccess = false,
    Duration? duration,
  }) {
    showToast(
      text,
      backgroundColor:
          isSuccess ? const Color(0xFF026405) : const Color(0xFFFF1100),
      context: context,
      animation: StyledToastAnimation.fade,
      duration: duration ?? const Duration(seconds: 5),
    );
  }

  static showUnimplementedSnackBar([int seconds = 1]) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.color54B25AMain.withOpacity(.85),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'В разработке...',
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W400(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
