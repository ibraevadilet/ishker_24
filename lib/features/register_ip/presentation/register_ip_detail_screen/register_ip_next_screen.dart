import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/expanded_list_widget.dart';

@RoutePage()
class RegisterIPNextScreen extends StatelessWidget {
  const RegisterIPNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int? selectedIndex;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'Регистрация ИП',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppRouting.pushFunction(
                              const RegisterIPTypeOfActivityRoute());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Вид экономической деятельности',
                                style: AppTextStyles.s16W600(),
                              ),
                              const Flexible(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Наличие наемных работников',
                        style: AppTextStyles.s16W700(),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(
                                splashRadius: 14,
                                activeColor: AppColors.color54B25AMain,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => AppColors.color54B25AMain,
                                ),
                                value: true,
                                groupValue: true,
                                onChanged: (e) {},
                              ),
                              Text(
                                'Имеется',
                                style: AppTextStyles.s16W500(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                splashRadius: 14,
                                activeColor: AppColors.color54B25AMain,
                                value: false,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => AppColors.color54B25AMain,
                                ),
                                groupValue: true,
                                onChanged: (e) {},
                              ),
                              Text(
                                'Не имеется',
                                style: AppTextStyles.s16W500(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ExpandedList(
                        items: const [
                          'cds',
                          'dcs',
                          'scdc',
                        ],
                        title: 'Налоговый Режим',
                        selectedIndex: selectedIndex,
                        onSelected: (e) {},
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ставки к единому налоговому режиму',
                                style: AppTextStyles.s16W600(),
                              ),
                              const Flexible(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Далее',
                color: AppColors.color54B25AMain,
                onPress: () {
                  AppRouting.pushFunction(const RegisterIPConfirmOepRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
