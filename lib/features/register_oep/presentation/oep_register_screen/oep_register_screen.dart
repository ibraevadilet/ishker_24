import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/get_terms_cubit/get_terms_cubit.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/register_oep_cubit/register_oep_cubit.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/widgets/register_oep_check_box_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class OEPRegisterScreen extends StatelessWidget {
  const OEPRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<RegisterOepCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<GetTermsCubit>(),
        ),
      ],
      child: AppUnfocuser(
        child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Удаленное получение ОЭП',
          ),
          body: SafeArea(
            child: Builder(
              builder: (context) => Form(
                key: context.read<RegisterOepCubit>().useCase.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
                              CustomTextField(
                                maxLength: 14,
                                labelText: 'ИНН',
                                keyboardType: TextInputType.number,
                                validator: AppInputValidators.innValidator,
                                controller: context
                                    .read<RegisterOepCubit>()
                                    .useCase
                                    .innController,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: CustomTextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[a-zA-Z]')),
                                      ],
                                      isId: true,
                                      controller: context
                                          .read<RegisterOepCubit>()
                                          .useCase
                                          .idController,
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
                                          .read<RegisterOepCubit>()
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
                                prefixText: '+996 ',
                                controller: context
                                    .read<RegisterOepCubit>()
                                    .useCase
                                    .phoneNumber,
                                labelText: 'Номер телефона',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  AppInputFormatters.phoneFormatter,
                                ],
                                validator: AppInputValidators.phoneValidator,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                controller: context
                                    .read<RegisterOepCubit>()
                                    .useCase
                                    .emailController,
                                labelText: 'Адрес электронной почты',
                                keyboardType: TextInputType.emailAddress,
                                validator: AppInputValidators.emptyValidator,
                              ),
                              const SizedBox(height: 16),
                              const RegisterOEPCheckBoxWidget(),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        radius: 16,
                        color: AppColors.color1EA31EGreen,
                        onPress: () {
                          final bool isChecked = context
                              .read<RegisterOepCubit>()
                              .useCase
                              .isCheckedGetter;
                          final bool isValidate = context
                              .read<RegisterOepCubit>()
                              .useCase
                              .formKey
                              .currentState!
                              .validate();
                          if (isChecked && isValidate) {
                            AppRouting.pushFunction(const CesSelfieRoute());
                          }
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
      ),
    );
  }
}
