import 'package:flutter/material.dart';
import 'package:ishker_24/features/my_ip/presentation/my_ip_main_screen/widgets/copy_container_widget.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class MyIpMainScreen extends StatelessWidget {
  const MyIpMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 26),
              CustomButton(
                color: Colors.white,
                onPress: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Свидетельство ИП',
                      style: AppTextStyles.s16W500(),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const CopyContainerWidget(
                title: 'ФИО',
                subTitle: 'Нуждин Сергей Иванович',
              ),
              const CopyContainerWidget(
                title: 'ИНН',
                subTitle: '209091993011234',
              ),
              const CopyContainerWidget(
                title: 'ОКПО',
                subTitle: '28294729',
              ),
              const CopyContainerWidget(
                title: 'Регистрационный номер',
                subTitle: '003-2023-234-1294',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
