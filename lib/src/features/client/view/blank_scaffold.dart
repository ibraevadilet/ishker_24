import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishker_24/src/core/utils/extensions.dart';
import 'package:ishker_24/src/features/widgets/custom_button.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class BlankScaffold extends StatelessWidget {
  const BlankScaffold({
    super.key,
    required this.text,
    required this.assetPath,
    this.onPressed,
    this.btnLabel,
    this.sliverAppBar,
  });

  final String text;
  final String assetPath;
  final VoidCallback? onPressed;
  final String? btnLabel;
  final SliverAppBar? sliverAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          if (sliverAppBar != null) sliverAppBar!,
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  assetPath.isSvg
                      ? SvgPicture.asset(assetPath)
                      : Image.asset(assetPath),
                  const Spacer(),
                  Text(
                    text,
                    style: AppTextStyles.s16W500(),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  if (onPressed != null && btnLabel != null)
                    CustomButton(onPress: onPressed, text: btnLabel),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
