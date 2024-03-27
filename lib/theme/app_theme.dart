// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'app_colors.dart';

final lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: AppColors.backgroundColor,
    rangePickerBackgroundColor: AppColors.backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    rangePickerShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    rangeSelectionOverlayColor: MaterialStateProperty.all(Colors.teal),
    rangeSelectionBackgroundColor: AppColors.color54B25AMain.withOpacity(.5),
    dayBackgroundColor:
        const MaterialStatePropertyAll(AppColors.color54B25AMain),
    todayForegroundColor:
        const MaterialStatePropertyAll(AppColors.color54B25AMain),
  ),
  splashColor: AppColors.color54B25AMain.withOpacity(.3),
  highlightColor: Colors.transparent,
);
