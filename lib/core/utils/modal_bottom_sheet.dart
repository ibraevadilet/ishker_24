import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';

void showSheet(BuildContext context, Widget child) async {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(child: child),
      ),
    ),
  );
}
