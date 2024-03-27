import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';

void showSheet(BuildContext context, Widget child) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
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

final botttomSheetChertochka = Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    const SizedBox(height: 12),
    Center(
      child: Container(
        height: 4,
        width: 32,
        decoration: BoxDecoration(
          color: AppColors.color617796Grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    const SizedBox(height: 12),
  ],
);
