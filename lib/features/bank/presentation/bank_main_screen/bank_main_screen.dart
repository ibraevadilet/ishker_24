import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/text_scaler.dart';
import 'package:ishker_24/features/bank/presentation/bank_main_screen/widgets/bank_button.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

class BankMainScreen extends StatelessWidget {
  const BankMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool? hasAccount = true;
    bool? hasBankCard = false;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'Мой банк',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Счета',
                  style: AppTextStyles.s16W700(),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () =>
                      AppRouting.pushFunction(const CreateAccountRoute()),
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.color34C759Green,
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return hasAccount == false
                    ? Row(
                        children: [
                          SvgPicture.asset(AppImages.emptyAccontIcon),
                          const SizedBox(width: 16),
                          Text(
                            'Здесь будут показаны ваши банковские\nпродукты',
                            style: AppTextStyles.s12W400(
                              color: AppColors.color6B7583Grey,
                            ),
                          ),
                        ],
                      )
                    : ListTile(
                        onTap: () =>
                            AppRouting.pushFunction(const AccountDetailRoute()),
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 40,
                          width: 56,
                          decoration: BoxDecoration(
                            gradient: AppColors.billGradient,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'C',
                              style: AppTextStyles.s18W700().copyWith(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                decorationColor: Colors.white,
                              ),
                              textScaler: CustomTextScaler.freezed(context),
                            ),
                          ),
                        ),
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Счет ••5478',
                              style: AppTextStyles.s12W400(
                                  color: AppColors.color6B7583Grey),
                            ),
                            const SizedBox(height: 4),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  style: AppTextStyles.s18W500(),
                                  children: [
                                    const TextSpan(
                                      text: '394 489.2 ',
                                    ),
                                    TextSpan(
                                      text: 'C',
                                      style: AppTextStyles.s18W500().copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
              itemCount: hasAccount == false ? 1 : 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Карты',
                  style: AppTextStyles.s16W700(),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.color34C759Green,
                    size: 24,
                  ),
                ),
              ],
            ),
            hasBankCard == false
                ? Row(
                    children: [
                      SvgPicture.asset(AppImages.emptyAccontIcon),
                      const SizedBox(width: 16),
                      Text(
                        'Здесь будут показаны ваши банковские\nпродукты',
                        style: AppTextStyles.s12W400(
                          color: AppColors.color6B7583Grey,
                        ),
                      ),
                    ],
                  )
                : ListTile(
                    onTap: () =>
                        AppRouting.pushFunction(const CardDetailRoute()),
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
                                style: AppTextStyles.s18W500(),
                                children: [
                                  const TextSpan(
                                    text: '567 478.6 ',
                                  ),
                                  TextSpan(
                                    text: 'C',
                                    style: AppTextStyles.s18W500().copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Flexible(
                          flex: 0,
                          child: SvgPicture.asset(AppImages.favoriteIcon),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
            const SizedBox(height: 24),
            const BankButton(
              title: 'Кредит для бизнеса',
              subTitle: 'Откройте сейчас',
              assetsName: AppImages.creditIcon,
            ),
            const SizedBox(height: 24),
            const BankButton(
              title: 'Депозит для бизнеса',
              subTitle: 'Откройте сейчас',
              assetsName: AppImages.depositIcon,
            )
          ],
        ),
      ),
    );
  }
}
