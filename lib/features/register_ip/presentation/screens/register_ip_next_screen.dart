import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
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
import 'package:ishker_24/widgets/expanded_list_widget.dart';

@RoutePage()
class RegisterIPNextScreen extends StatefulWidget {
  const RegisterIPNextScreen({super.key, required this.isPatent});
  final bool isPatent;

  @override
  State<RegisterIPNextScreen> createState() => _RegisterIPNextScreenState();
}

class _RegisterIPNextScreenState extends State<RegisterIPNextScreen> {
  int? selectedIndex;
  List<String> nalogTypes = [];

  ///For back
  TaxModel? selectedVidDeatelnost;
  bool selectedRadioValue = true;
  List<String> nalogTypeIds = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TaxAndSelectedModesCubit>()..getModels(widget.isPatent),
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
            child: BlocConsumer<TaxAndSelectedModesCubit,
                TaxAndSelectedModesState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (model) {
                    if (widget.isPatent) {
                      nalogTypes =
                          model.nalogTypes.map<String>((e) => e.text).toList();
                    } else {
                      nalogTypes.add('Патент');
                    }
                  },
                );
              },
              builder: (context, state) {
                return state.when(
                  loading: () => const AppIndicator(),
                  error: (error) => AppErrorText(error: error),
                  success: (model) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
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
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
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
                              const SizedBox(height: 16),
                              Text(
                                'Наличие наемных работников',
                                style: AppTextStyles.s16W700(),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedRadioValue = true;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio(
                                          splashRadius: 14,
                                          activeColor:
                                              AppColors.color54B25AMain,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                            (states) =>
                                                AppColors.color54B25AMain,
                                          ),
                                          value: true,
                                          groupValue: selectedRadioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedRadioValue = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Имеется',
                                          style: AppTextStyles.s16W500(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedRadioValue = false;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio(
                                          splashRadius: 14,
                                          activeColor:
                                              AppColors.color54B25AMain,
                                          value: false,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                            (states) =>
                                                AppColors.color54B25AMain,
                                          ),
                                          groupValue: selectedRadioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedRadioValue = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Не имеется',
                                          style: AppTextStyles.s16W500(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              ExpandedList(
                                items: nalogTypes,
                                title: 'Налоговый Режим',
                                selectedIndex: selectedIndex,
                                onSelected: (e) {
                                  setState(() {
                                    selectedIndex = e;
                                  });
                                },
                              ),
                              const SizedBox(height: 8),
                              if (selectedIndex != null && selectedIndex == 2)
                                GestureDetector(
                                  onTap: () async {
                                    nalogTypeIds.clear();
                                    List<String>? result =
                                        await context.router.push(
                                      RegisterIpSelectModesRoute(
                                        models: model.ediniyNalog,
                                      ),
                                    ) as List<String>?;
                                    if (result != null) {
                                      nalogTypeIds.addAll(result);
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                nalogTypeIds.isEmpty
                                                    ? 'Ставки к единому\nналоговому режиму'
                                                    : 'Выбранные по Единому налоговому режиму',
                                                style: AppTextStyles.s16W400(),
                                              ),
                                            ),
                                            Icon(
                                              nalogTypeIds.isEmpty
                                                  ? Icons.arrow_forward_ios
                                                  : Icons
                                                      .keyboard_arrow_down_rounded,
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: model.ediniyNalog
                                              .where(
                                                (e) =>
                                                    nalogTypeIds.contains(e.id),
                                              )
                                              .map<Widget>(
                                                (e) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Text(
                                                    '- ${e.text}',
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        text: 'Далее',
                        color: AppColors.color54B25AMain,
                        onPress: () {
                          if (selectedVidDeatelnost != null &&
                              selectedIndex != null &&
                              selectedIndex != 2) {
                            AppRouting.pushFunction(
                              const RegisterIpSigninRoute(),
                            );
                          }
                          if (selectedVidDeatelnost != null &&
                              selectedIndex != null &&
                              selectedIndex == 2 &&
                              nalogTypeIds.isNotEmpty) {
                            AppRouting.pushFunction(
                              const RegisterIpSigninRoute(),
                            );
                          }
                        },
                      ),
                    ],
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
