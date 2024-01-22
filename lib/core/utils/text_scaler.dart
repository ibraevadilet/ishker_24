import 'dart:math';

import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
final class CustomTextScaler {
  static TextScaler freezed(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    final val = (MediaQuery.sizeOf(context).width / 1400) * maxTextScaleFactor;
    return TextScaler.linear(max(1, min(val, maxTextScaleFactor)));
  }
}
