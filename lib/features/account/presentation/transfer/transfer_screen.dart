import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/errors/exceptions.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/presentation/transfer/cubit/transfer_cubit.dart';
import 'package:ishker_24/features/account/presentation/transfer/cubits/transfer_validate/transfer_validate_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

import 'package:ishker_24/widgets/styled_toasts.dart';

@RoutePage()
class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key, required this.model, required this.inn});

  final AccountModel model;
  final String inn;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TransferValidateCubit(
            validateUseCase: sl(),
            accountModel: model,
            inn: inn,
          ),
        ),
        BlocProvider(create: (_) => TransferCubit(performUseCase: sl())),
      ],
      child: const PayScreenView(),
    );
  }
}

class PayScreenView extends StatefulWidget {
  const PayScreenView({super.key});

  @override
  State<PayScreenView> createState() => _PayScreenViewState();
}

class _PayScreenViewState extends State<PayScreenView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _cardController = TextEditingController();
  final _sumController = TextEditingController();

  @override
  void dispose() {
    _cardController.dispose();
    _sumController.dispose();
    super.dispose();
  }

  Widget detailRow(String title, String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
            ),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: AppTextStyles.s16W500(color: AppColors.color2C2C2CBlack),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              title: const Text('Перевести'),
              titleTextStyle: AppTextStyles.s20W700(),
              elevation: 0,
              backgroundColor: AppColors.backgroundColor,
              // centerTitle: false,
              iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
              pinned: true,
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: _cardController,
                        labelText: 'Номер карты',
                        keyboardType: TextInputType.number,
                        inputFormatters: [AppInputFormatters.cardFormatter],
                        onChanged: (val) =>
                            context.read<TransferValidateCubit>().reset(),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Введите номер карты';
                          }

                          final unmasked = AppInputFormatters.cardFormatter
                              .getUnmaskedText();
                          if (unmasked.length < 16) {
                            return 'Неверный номер карты';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _sumController,
                        labelText: 'Сумма перевода',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [AppInputFormatters.amountFormatter],
                        onChanged: (val) =>
                            context.read<TransferValidateCubit>().reset(),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Обязательное поле для заполнения';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<TransferValidateCubit, TransferValidateState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ФИО',
                                style: AppTextStyles.s16W400(
                                  color: AppColors.color6B7583Grey,
                                ),
                              ),
                              Text(
                                switch (state) {
                                  TrValidateSuccess() => state.entity.fio,
                                  _ => '',
                                },
                                style: AppTextStyles.s16W600(),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<TransferValidateCubit, TransferValidateState>(
            listener: (context, state) {
              switch (state) {
                case TrValidateFailure():
                  AppSnackBar.showSnackBar(state.e.message);
                default:
              }
            },
            builder: (context, vState) => switch (vState) {
              TrValidateLoading() => const AppIndicator(),
              TrValidateSuccess() => BlocConsumer<TransferCubit, TransferState>(
                  listener: (context, pState) {
                    switch (pState) {
                      case TransferFailure():
                        AppSnackBar.showSnackBar(pState.e.message);
                      case TransferSuccess():
                        showDialog(
                          context: context,
                          builder: (state) {
                            return AlertDialog(
                              title: const Text('Перевод в обработке'),
                              content: SizedBox(
                                width: MediaQuery.sizeOf(context).width - 40,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    detailRow(
                                      'Сумма',
                                      (vState.params.summa / 100).toString(),
                                    ),
                                    detailRow(
                                      'Комиссия',
                                      (vState.params.fee ?? 0).toString(),
                                    ),
                                    detailRow(
                                      'Валюта',
                                      AppCurrencyFormatter.currencyName(
                                        vState.params.currency,
                                      ),
                                    ),
                                    detailRow('Куда', vState.params.account),
                                    detailRow(
                                      'Откуда',
                                      vState
                                          .params.accountDt.obscureFirstNumbers,
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.color54B25AMain,
                                  ),
                                  child: const Text('Ок'),
                                ),
                              ],
                            );
                          },
                        );
                      default:
                    }
                  },
                  builder: (context, state) => switch (state) {
                    TransferLoading() => const AppIndicator(),
                    _ => CustomButton(
                        onPress: () => context
                            .read<TransferCubit>()
                            .perform(vState.params),
                        text: 'Перевести',
                      ),
                  },
                ),
              _ => CustomButton(
                  onPress: () {
                    final isValid = _formKey.currentState?.validate();
                    if (isValid == false) return;

                    final card = _cardController.text.trim();
                    final amount = _sumController.text.trim();

                    final dv = double.tryParse(amount) ?? 0.0;

                    setState(() => _sumController.text = dv.toString());

                    context
                        .read<TransferValidateCubit>()
                        .validate(card, (dv * 100).toInt());
                  },
                  text: 'Далее',
                ),
            },
          ),
        ),
      ),
    );
  }
}

class TransferValidateButton extends StatelessWidget {
  const TransferValidateButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferValidateCubit, TransferValidateState>(
      listener: (context, state) {
        switch (state) {
          case TrValidateFailure():
            AppSnackBar.showSnackBar(state.e.message);
          default:
        }
      },
      builder: (context, state) => switch (state) {
        TrValidateLoading() => const AppIndicator(),
        _ => CustomButton(onPress: onPressed, text: 'Далее'),
      },
    );
  }
}
