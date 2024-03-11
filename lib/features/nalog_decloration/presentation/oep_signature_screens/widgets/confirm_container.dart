import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class ConfirmContainer extends StatelessWidget {
  const ConfirmContainer({
    super.key,
    required this.reportTypeName,
  });
  final String reportTypeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
            )
          ]),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.signatureConfirmImage,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Подтверждение\nзаявки',
                  style: AppTextStyles.s20W500(),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              style: AppTextStyles.s16W400(),
              children: [
                const TextSpan(text: 'Для предоставления'),
                TextSpan(
                  text: ' "$reportTypeName" ',
                  style: AppTextStyles.s16W700(),
                ),
                const TextSpan(
                    text:
                        'требуется подписать его с использованием облачной электронной подписи (ОЭП).'),
              ],
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
