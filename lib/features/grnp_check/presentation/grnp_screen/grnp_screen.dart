import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/grnp_check/presentation/grnp_screen/grnp_cubit/grnp_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class GrnpCheckScreen extends StatelessWidget {
  const GrnpCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GRNPCubit>(
      create: (context) => sl<GRNPCubit>(),
      child: AppUnfocuser(
        child: Scaffold(
          body: SafeArea(
            child: Builder(
              builder: (context) => Form(
                key: context.read<GRNPCubit>().useCase.formKey,
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
                                      controller: context
                                          .read<GRNPCubit>()
                                          .useCase
                                          .idController,
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
                                  Flexible(
                                    flex: 4,
                                    child: CustomTextField(
                                      controller: context
                                          .read<GRNPCubit>()
                                          .useCase
                                          .passNumberController,
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
                              CustomTextField(
                                controller: context
                                    .read<GRNPCubit>()
                                    .useCase
                                    .innController,
                                maxLength: 14,
                                labelText: 'ИНН',
                                keyboardType: TextInputType.number,
                                validator: AppInputValidators.innValidator,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                controller: context
                                    .read<GRNPCubit>()
                                    .useCase
                                    .phoneNumber,
                                prefixText: '+996 ',
                                labelText: 'Номер телефона',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  AppInputFormatters.phoneFormatter,
                                ],
                                validator: AppInputValidators.phoneValidator,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        radius: 16,
                        color: AppColors.color1EA31EGreen,
                        onPress: () {
                          final bool isValidate = context
                              .read<GRNPCubit>()
                              .useCase
                              .formKey
                              .currentState!
                              .validate();
                          if (isValidate) {
                            AppRouting.pushFunction(
                              const GrnpSelfieRoute(),
                            );
                          }
                        },
                        child: Text(
                          'Далее',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s16W700(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
