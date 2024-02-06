import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/text_scaler.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class CardOperationRowWidget extends StatelessWidget {
  const CardOperationRowWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8.0,
                    color: Color(0xffCFCFCF),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(AppImages.paymentIcon),
            ),
            const SizedBox(height: 8),
            Text(
              'Оплатить',
              style: AppTextStyles.s14W400(),
              textScaler: CustomTextScaler.freezed(context),
            ),
          ],
        ),
        Flexible(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: Color(0xffCFCFCF),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(AppImages.replenishIcon),
              ),
              const SizedBox(height: 8),
              Text(
                'Пополнить',
                style: AppTextStyles.s14W400(),
                textScaler: CustomTextScaler.freezed(context),
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: Color(0xffCFCFCF),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(AppImages.transferIcon),
              ),
              const SizedBox(height: 8),
              Text(
                'Перевести',
                style: AppTextStyles.s14W400(),
                textScaler: CustomTextScaler.freezed(context),
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8.0,
                      color: Color(0xffCFCFCF),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(AppImages.requisitesIcon),
              ),
              const SizedBox(height: 8),
              Text(
                'Реквизиты',
                style: AppTextStyles.s14W400(),
                textScaler: CustomTextScaler.freezed(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
