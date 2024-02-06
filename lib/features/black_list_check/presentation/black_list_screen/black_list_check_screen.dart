import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class BlackListCheckScreen extends StatelessWidget {
  const BlackListCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        body: SafeArea(
          child: Builder(
            builder: (context) => Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            Text(
                              'Для завершения процесса регистрации и обеспечения безопасности вашего аккаунта, просим вас предоставить следующую дополнительную информацию: номер паспорта и ИНН.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.s16W500(),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: CustomTextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(
                                          '[a-zA-Z]',
                                        ),
                                      ),
                                    ],
                                    isId: true,
                                    labelText: 'ID/AN',
                                    maxLength: 2,
                                    validator:
                                        AppInputValidators.emptyValidator,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Flexible(
                                  flex: 4,
                                  child: CustomTextField(
                                    maxLength: 7,
                                    labelText: 'Номер Паспорта',
                                    keyboardType: TextInputType.number,
                                    validator:
                                        AppInputValidators.emptyValidator,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const CustomTextField(
                              maxLength: 14,
                              labelText: 'ИНН',
                              keyboardType: TextInputType.number,
                              validator: AppInputValidators.innValidator,
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      radius: 16,
                      color: AppColors.color1EA31EGreen,
                      onPress: () {
                        AppRouting.pushAndPopUntilFunction(
                          const BlackListSelfieRoute(),
                        );
                      },
                      child: Text(
                        'Далее',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s16W700(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
