import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class CreateAccountLastScreen extends StatelessWidget {
  const CreateAccountLastScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'Создание счета',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'У меня отсутствует бенифициар',
                              style: AppTextStyles.s16W500(),
                            ),
                          ),
                          Checkbox(
                            activeColor: AppColors.color54B25AMain,
                            value: true,
                            onChanged: (e) {},
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Я не являюсь должностным лицом',
                              style: AppTextStyles.s16W500(),
                            ),
                          ),
                          Checkbox(
                            activeColor: AppColors.color54B25AMain,
                            value: true,
                            onChanged: (e) {},
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Мой вид деятельности\nнелицензирован',
                              style: AppTextStyles.s16W500(),
                            ),
                          ),
                          Checkbox(
                            activeColor: AppColors.color54B25AMain,
                            value: true,
                            onChanged: (e) {},
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const CustomTextField(
                      labelText: 'Кодовое слово',
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Ваш счет будет открыт в головном\nфилиале РСК банка по адресу:\nг. Бишкек, ул.Московская, 80/1',
              style: AppTextStyles.s16W400(color: AppColors.color6B7583Grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                onPress: () =>
                    AppRouting.pushFunction(const CreateAccountFinishRoute()),
                text: 'Открыть счет',
              ),
            )
          ],
        ),
      ),
    );
  }
}
