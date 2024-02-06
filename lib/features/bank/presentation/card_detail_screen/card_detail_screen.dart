import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/text_scaler.dart';
import 'package:ishker_24/features/bank/presentation/account_detail_screen/widgets/copy_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: 'Название карты',
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 259,
                    decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),
                        Center(
                          child: Container(
                            height: 4,
                            width: 32,
                            decoration: BoxDecoration(
                              color: AppColors.color617796Grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Переименование',
                          style: AppTextStyles.s16W500(),
                        ),
                        const SizedBox(height: 24),
                        const CustomTextField(
                          labelText: 'Название карты',
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          onPress: () {},
                          text: 'Переименовать',
                          color: AppColors.color54B25AMain,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: SvgPicture.asset(AppImages.editIcon),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.goldCardGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      radius: 10,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(AppImages.unselectedCardIcon),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              style: AppTextStyles.s28W700(color: Colors.white),
                              children: [
                                const TextSpan(
                                  text: '567 478.6 ',
                                ),
                                TextSpan(
                                  text: 'C',
                                  style: AppTextStyles.s28W700().copyWith(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '••5234',
                              style: AppTextStyles.s14W400(color: Colors.white),
                              textScaler: CustomTextScaler.freezed(context),
                            ),
                            SvgPicture.asset(
                              AppImages.visaLogo,
                              height: 15,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
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
                    child: InkWell(
                      radius: 10,
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 12),
                              Center(
                                child: Container(
                                  height: 4,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: AppColors.color617796Grey,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Реквизиты',
                                style: AppTextStyles.s16W500(),
                              ),
                              const SizedBox(height: 24),
                              const CopyWidget(
                                title: 'Получатель',
                                subTitle: 'Нуждин Сергей Иванович',
                              ),
                              const SizedBox(height: 24),
                              const CopyWidget(
                                title: 'Номер счета',
                                subTitle: '209091993011234',
                              ),
                              const SizedBox(height: 24),
                              const CopyWidget(
                                title: 'Банк получатель',
                                subTitle: '12312312312',
                              ),
                              const SizedBox(height: 24),
                              const CopyWidget(
                                title: 'БИК',
                                subTitle: '437673483',
                              ),
                              const SizedBox(height: 24),
                              CustomButton(
                                onPress: () {
                                  Share.share('437673483');
                                },
                                radius: 16,
                                text: 'Отправить реквизиты',
                              )
                            ],
                          ),
                        ),
                      ),
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
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Сумма в обработке',
                      textScaler: CustomTextScaler.freezed(context),
                      style: AppTextStyles.s14W400(
                          color: AppColors.color617796Grey),
                    ),
                    Flexible(
                      child: RichText(
                        textScaler: CustomTextScaler.freezed(context),
                        text: TextSpan(
                          style: AppTextStyles.s16W500(),
                          children: [
                            const TextSpan(
                              text: '12 392.3 ',
                            ),
                            TextSpan(
                              text: 'C',
                              style: AppTextStyles.s16W500().copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
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
                    flex: 1,
                    child: Text(
                      'Последние операции',
                      style: AppTextStyles.s16W700(),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () => AppRouting.pushFunction(
                          const CardOperationHistoryRoute()),
                      child: Text(
                        'Все',
                        style: AppTextStyles.s16W700(
                          color: AppColors.color54B25AMain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 692,
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      const SizedBox(height: 20, child: Text('text')),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
