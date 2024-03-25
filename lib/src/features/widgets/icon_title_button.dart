import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

import 'shimmers.dart';

class IconTitleButton extends StatelessWidget {
  const IconTitleButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.imagePath,
    this.btnKey,
  });

  final VoidCallback onTap;
  final String title;
  final String imagePath;
  final Key? btnKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          child: InkWell(
            key: btnKey,
            onTap: onTap,
            highlightColor: AppColors.color54B25AMain.withOpacity(.15),
            splashColor: AppColors.esiMainBlueColor.withOpacity(.15),
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 40,
              height: 40,
              child: imagePath.endsWith('.svg')
                  ? SvgPicture.asset(
                      imagePath,
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    )
                  : Image.asset(
                      imagePath,
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            title,
            style: AppTextStyles.s14W400(color: AppColors.color2C2C2CBlack),
          ),
        )
      ],
    );
  }
}

class IconTitleButtonShimmer extends StatelessWidget {
  const IconTitleButtonShimmer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return shimmer(
      Column(
        children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            child: const SizedBox(width: 40, height: 40),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: AppTextStyles.s14W400(color: AppColors.color2C2C2CBlack),
            ),
          )
        ],
      ),
    );
  }
}
