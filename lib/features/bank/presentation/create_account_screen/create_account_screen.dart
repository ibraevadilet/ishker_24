import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';
import 'package:ishker_24/features/bank/presentation/create_account_screen/cubits/get_client_passport_cubit/get_client_passport_cubit.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/tax_and_selected_modes_cubit/tax_and_selected_modes_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TaxModel? selectedVidDeatelnost;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetClientPassportCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<TaxAndSelectedModesCubit>()..getModels(false),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'Создание счета',
          centerTitle: false,
        ),
        body: SafeArea(
          child: BlocBuilder<GetClientPassportCubit, GetClientPassportState>(
            builder: (context, state) {
              return state.when(
                loading: () => const AppIndicator(),
                error: (error) => AppErrorText(error: error),
                success: (model) => Form(
                  key: sl<RegisterClientUseCase>().formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.black),
                                        color: AppColors.colorD0D0D0Grey,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ID/AN',
                                            style: AppTextStyles.s12W600(
                                              color: AppColors.color6B7583Grey,
                                            ),
                                          ),
                                          Text(
                                            model.idDocNumber,
                                            style: AppTextStyles.s16W600(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.black),
                                        color: AppColors.colorD0D0D0Grey,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Номер Паспорта',
                                            style: AppTextStyles.s12W600(
                                              color: AppColors.color6B7583Grey,
                                            ),
                                          ),
                                          Text(
                                            model.idDocSeries,
                                            style: AppTextStyles.s16W600(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                prefixText: '+996 ',
                                keyboardType: TextInputType.number,
                                labelText: 'Номер телефона',
                                controller: sl<RegisterClientUseCase>()
                                    .numberController,
                                inputFormatters: [
                                  AppInputFormatters.phoneFormatter,
                                ],
                                validator: AppInputValidators.phoneValidator,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                validator: AppInputValidators.emptyValidator,
                                labelText: 'Адрес электронной почты',
                                controller:
                                    sl<RegisterClientUseCase>().emailController,
                              ),
                              const SizedBox(height: 8),
                              BlocBuilder<TaxAndSelectedModesCubit,
                                  TaxAndSelectedModesState>(
                                builder: (context, state) {
                                  return state.when(
                                    loading: () => const AppIndicator(),
                                    error: (error) =>
                                        AppErrorText(error: error),
                                    success: (model) => GestureDetector(
                                      onTap: () async {
                                        final TaxModel? result =
                                            await context.router.push(
                                          RegisterIPTypeOfActivityRoute(
                                            models: model.vidDeatelnosti,
                                          ),
                                        ) as TaxModel?;
                                        // print(result);
                                        setState(() {
                                          selectedVidDeatelnost = result;
                                        });

                                        sl<RegisterClientUseCase>()
                                            .selectedVidDeatelnost = result;
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.color7A7A7AGrey,
                                            width: 1,
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                selectedVidDeatelnost?.text ??
                                                    'Вид экономической деятельности',
                                                style: AppTextStyles.s16W400(),
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
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomButton(
                          onPress: () {
                            if (sl<RegisterClientUseCase>()
                                .formKey
                                .currentState!
                                .validate()) {
                              if (selectedVidDeatelnost != null) {
                                AppRouting.pushFunction(
                                    const CreateAccountNextRoute());
                              }
                            }
                          },
                          text: 'Далее',
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
