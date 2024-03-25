import 'package:flutter/material.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmer(
  Widget child, {
  Color? baseColor,
  Color? highlightColor,
}) =>
    Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.colorDADBDCGrey.withOpacity(.45),
      highlightColor: highlightColor ?? AppColors.colorF3F4F5Grey,
      child: child,
    );

Widget shimmerContainer({
  double? width,
  double? height,
  BorderRadius? borderRadius,
}) =>
    Container(
      width: width ?? 60,
      height: height ?? 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
    );

Widget shimmerTile({BorderRadius? borderRadius}) => shimmer(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
      ),
    );

AnimatedSwitcher defaultAnimatedSwitcher(Widget child) => AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: child,
    );

Widget shimmerCustomScrollView(Widget shimmer) => Scaffold(
      body: CustomScrollView(
        slivers: [SliverFillRemaining(child: shimmer)],
      ),
    );
