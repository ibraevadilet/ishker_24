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
class CreateAccountNextScreen extends StatelessWidget {
  const CreateAccountNextScreen({super.key});
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
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomTextField(
                      labelText: 'ОКПО',
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'ОГРН',
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Серия документа гос. регистрации',
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Номер документа гос. регистрации',
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Место выдачи документа гос. регистрации',
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'Дата выдачи документа гос. регистрации',
                    ),
                    SizedBox(height: 42),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
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
                      Expanded(
                        child: Text(
                          'Просмотреть или скачать\nсвидетельство о гос. регистрации',
                          style: AppTextStyles.s16W500(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                onPress: () =>
                    AppRouting.pushFunction(const CreateAccountLastRoute()),
                text: 'Далее',
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
