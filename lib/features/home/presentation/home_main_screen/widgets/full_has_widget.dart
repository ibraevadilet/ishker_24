import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/text_scaler.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class FullHasWidget extends StatelessWidget {
  const FullHasWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'ИП Нуждин Сергей Иванович',
                style: AppTextStyles.s16W600(),
              ),
            ),
            SvgPicture.asset(AppImages.notificationIconSvg),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                Container(
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
                    color: Colors.white,
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
                                  'Получите документ',
                                  style: AppTextStyles.s16W700(),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Текст',
                                  style: AppTextStyles.s12W400(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: SvgPicture.asset(
                          AppImages.folderImageSvg,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Счета и карты',
                        style: AppTextStyles.s16W700(),
                      ),
                    ),
                    Text(
                      'Все',
                      style: AppTextStyles.s16W700(
                        color: AppColors.color54B25AMain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Stack(
                    children: [
                      SvgPicture.asset(
                        AppImages.cardIcon,
                      ),
                      Positioned(
                        right: 25,
                        top: 23.5,
                        child: Text(
                          '5234',
                          style: AppTextStyles.s10Bold(color: Colors.white),
                          textScaler: CustomTextScaler.freezed(context),
                        ),
                      ),
                    ],
                  ),
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Карта ••5234',
                            style: AppTextStyles.s12W400(
                              color: AppColors.color6B7583Grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.s16W500(),
                              children: [
                                const TextSpan(
                                  text: '567 478.6 ',
                                ),
                                TextSpan(
                                  text: 'C',
                                  style: AppTextStyles.s16W500().copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppImages.favoriteIcon)
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    AppImages.bankAcoountIcon,
                  ),
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Счет ••7960',
                            style: AppTextStyles.s12W400(
                              color: AppColors.color6B7583Grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.s16W500(),
                              children: [
                                const TextSpan(
                                  text: '394 489.2 ',
                                ),
                                TextSpan(
                                  text: 'C',
                                  style: AppTextStyles.s16W500().copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Мой банк',
                  style: AppTextStyles.s16W700(),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(AppImages.paymentIcon),
                        const SizedBox(height: 8),
                        Text(
                          'Платежи',
                          style: AppTextStyles.s14W400(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      children: [
                        SvgPicture.asset(AppImages.transferIcon),
                        const SizedBox(height: 8),
                        Text(
                          'Перевод',
                          style: AppTextStyles.s14W400(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      children: [
                        SvgPicture.asset(AppImages.paymentIcon),
                        const SizedBox(height: 8),
                        Text(
                          'Платежи',
                          style: AppTextStyles.s14W400(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      child: Column(
                        children: [
                          SvgPicture.asset(AppImages.transferIcon),
                          const SizedBox(height: 8),
                          Text(
                            'Перевод',
                            style: AppTextStyles.s14W400(),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
