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
class RegisterIPScreen extends StatefulWidget {
  const RegisterIPScreen({super.key});

  @override
  State<RegisterIPScreen> createState() => _RegisterIPScreenState();
}

class _RegisterIPScreenState extends State<RegisterIPScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      const SizedBox(height: 24),
                      ExpandedList(
                        items: const ['cds', 'dcs', 'scdc'],
                        title: 'Тип предпринимателя',
                        selectedIndex: selectedIndex,
                        onSelected: (e) {
                          setState(() {
                            selectedIndex = e;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      const CustomTextField(
                        labelText: 'ИНН Налогоплательщика',
                        maxLength: 14,
                      ),
                      const SizedBox(height: 8),
                      const CustomTextField(
                        labelText: 'Область, город/область, район, село',
                      ),
                      const SizedBox(height: 8),
                      const CustomTextField(
                        labelText: 'Ул/мкр, номер квартиры/дома',
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
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Далее',
                color: AppColors.color54B25AMain,
                onPress: () {
                  AppRouting.pushFunction(const RegisterIPNextRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
