import 'package:flutter/material.dart';
import 'package:ishker_24/main.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class AppSnackBar {
  static showSnackBar(String text, {bool isSuccess = false}) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
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
}
