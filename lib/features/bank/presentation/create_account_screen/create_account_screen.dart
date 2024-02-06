import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/expanded_list_widget.dart';

@RoutePage()
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'Создание счета',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: CustomTextField(
                              labelText: 'ID/AN',
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            flex: 4,
                            child: CustomTextField(
                              labelText: 'Номер Паспорта',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const CustomTextField(
                        labelText: 'Номер телефона',
                      ),
                      const SizedBox(height: 8),
                      const CustomTextField(
                        labelText: 'Адрес электронной почты',
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.color6B7583Grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ExpandedList(
                          title: 'Основной вид деятельности',
                          selectedIndex: 0,
                          items: const ['Основной вид деятельности', '', ''],
                          onSelected: (e) {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  onPress: () =>
                      AppRouting.pushFunction(const CreateAccountNextRoute()),
                  text: 'Далее',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
