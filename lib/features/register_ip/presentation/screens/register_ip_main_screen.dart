import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/expanded_list_widget.dart';

@RoutePage()
class RegisterIPMainScreen extends StatefulWidget {
  const RegisterIPMainScreen({super.key});

  @override
  State<RegisterIPMainScreen> createState() => _RegisterIPMainScreenState();
}

class _RegisterIPMainScreenState extends State<RegisterIPMainScreen> {
  int? selectedIndex;
  List<String> ipTypes = [
    'ИП',
    'ИП на основе патента',
  ];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetUserInfoCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Регистрация ИП',
          centerTitle: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const AppIndicator(),
                  error: (error) => AppErrorText(error: error),
                  success: () => Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                ExpandedList(
                                  items: ipTypes,
                                  title: 'Тип предпринимателя',
                                  selectedIndex: selectedIndex,
                                  onSelected: (e) {
                                    setState(() {
                                      selectedIndex = e;
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                CustomTextField(
                                  labelText: 'ИНН Налогоплательщика',
                                  maxLength: 14,
                                  controller: context
                                      .read<GetUserInfoCubit>()
                                      .useCase
                                      .innController,
                                  validator: AppInputValidators.innValidator,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText:
                                      'Область, город/область, район, село',
                                  controller: context
                                      .read<GetUserInfoCubit>()
                                      .useCase
                                      .regionController,
                                  validator: AppInputValidators.emptyValidator,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText: 'Ул/мкр, номер квартиры/дома',
                                  controller: context
                                      .read<GetUserInfoCubit>()
                                      .useCase
                                      .adressController,
                                  validator: AppInputValidators.emptyValidator,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText: 'Номер телефона',
                                  prefixText: '+996 ',
                                  controller: context
                                      .read<GetUserInfoCubit>()
                                      .useCase
                                      .numberController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    AppInputFormatters.phoneFormatter,
                                  ],
                                  validator: AppInputValidators.phoneValidator,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText: 'Адрес электронной почты',
                                  controller: context
                                      .read<GetUserInfoCubit>()
                                      .useCase
                                      .emailController,
                                  validator: AppInputValidators.emptyValidator,
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
                            if (selectedIndex != null &&
                                formKey.currentState!.validate()) {
                              AppRouting.pushFunction(
                                RegisterIPNextRoute(
                                  isPatent: selectedIndex == 0,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
