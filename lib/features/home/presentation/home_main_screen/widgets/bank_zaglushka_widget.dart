import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class BankZaglushkaWidget extends StatelessWidget {
  const BankZaglushkaWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Вы успешно зарегистрировали ИП',
        style: AppTextStyles.s16W500(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
