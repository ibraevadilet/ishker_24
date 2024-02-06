import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class BankButton extends StatelessWidget {
  const BankButton(
      {super.key, this.onTap, this.title, this.subTitle, this.assetsName});
  final void Function()? onTap;
  final String? title;
  final String? subTitle;
  final String? assetsName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              blurStyle: BlurStyle.inner,
            )
          ],
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        title ?? '',
                        style: AppTextStyles.s16W700(),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        subTitle ?? '',
                        style: AppTextStyles.s12W400(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: SvgPicture.asset(assetsName ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
