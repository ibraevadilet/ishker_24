import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishker_24/core/constants/shared_keys.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/core/utils/extensions.dart';
import 'package:ishker_24/features/account/domain/entities/refill_initial_data.dart';
import 'package:ishker_24/features/account/presentation/refill/refill_button.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/get_client_info_cubit/get_client_info_cubit.dart';
import 'package:ishker_24/features/qr/presentation/qr_main_screen/widgets/show_select_account_sheet.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/detail_row.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubits/refill_cubit/refill_cubit.dart';
import 'cubits/refill_validate/refill_validate_cubit.dart';

@RoutePage()
class RefillScreen extends StatelessWidget {
  const RefillScreen({
    super.key,
    required this.qrData,
  });

  final RefillInitialData qrData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<GetClientInfoCubit>()),
        BlocProvider(
          create: (context) => RefillCubit(
            qrData: qrData,
            infoCubit: context.read<GetClientInfoCubit>(),
          ),
        ),
      ],
      child: RefillView(qrData: qrData),
    );
  }
}

class RefillView extends StatefulWidget {
  const RefillView({super.key, required this.qrData});

  final RefillInitialData qrData;

  @override
  State<RefillView> createState() => _RefillViewState();
}

class _RefillViewState extends State<RefillView> {
  RefillInitialData get qrData => widget.qrData;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  AccountChetModel? account;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final sum = context.read<RefillCubit>().state.qrData.sum;
    _controller.text = sum.toString();
    // setState(() {

    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'Оплата по QR',
            centerTitle: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Откуда:',
                        style: AppTextStyles.s14W400(
                            color: AppColors.color6B7583Grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  BlocConsumer<GetClientInfoCubit, GetClientInfoState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: (model) {
                          final acc = sl<SharedPreferences>()
                              .getString(SharedKeys.savedAccount);

                          if (model.accountsList.isEmpty) {
                            AppSnackBar.showSnackBar(
                              'Нет рассчетного счета для выбора',
                            );

                            return;
                          }

                          account = model.accountsList.first;

                          if (acc != null && acc.isNotEmpty) {
                            account = model.accountsList.firstWhere(
                              (it) => it.accountNumber == acc,
                              orElse: () => model.accountsList.first,
                            );
                          }

                          setState(() {});
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const SizedBox(
                          height: 60,
                          child: AppIndicator(),
                        ),
                        success: (model) => CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            if (model.accountsList.isEmpty) return;

                            final result = await showSelectedAccountSheet(
                              context,
                              model.accountsList,
                              model.accountsList.first,
                            );

                            account = result;
                            await sl<SharedPreferences>().setString(
                              SharedKeys.savedAccount,
                              account!.accountNumber,
                            );
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppCurrencyFormatter.cuccancyIcon(
                                    account?.currency ?? '',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Счет ...${account != null ? account!.accountNumber.substring(account!.accountNumber.length - 3) : ''}',
                                      style: AppTextStyles.s12W400(
                                        color: AppColors.color6B7583Grey,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      text: TextSpan(
                                        style: AppTextStyles.s16W500(),
                                        children: [
                                          TextSpan(
                                            text: account != null
                                                ? '${account!.balance} '
                                                : ' ',
                                          ),
                                          TextSpan(
                                            text: AppCurrencyFormatter
                                                .cuccancyType(
                                              account?.currency ?? 'KGZ',
                                            ),
                                            style: AppTextStyles.s16W500()
                                                .copyWith(
                                              decoration: account?.isKGZ == true
                                                  ? TextDecoration.underline
                                                  : null,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(AppImages.starSelectedIcon),
                                const SizedBox(width: 12),
                                SvgPicture.asset(AppImages.arrowForwardIcon),
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
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<RefillCubit, RefillState>(
                // listenWhen: (p, c) => p.sum != c.sum,
                // listener: (context, state) {
                //   _controller.text = (state.sum / 100).toString();
                //   setState(() {});
                // },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        DetailRow(
                          title: 'accountNumber'.tr(),
                          value: state.qrData.account.obscureFirstNumbers,
                        ),
                        DetailRow(title: 'ФИО', value: state.qrData.name),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _controller,
                          labelText: 'Сумма перевода',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: [AppInputFormatters.amountFormatter],
                          onChanged: (val) => log('val: $val'),
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Обязательное поле для заполнения';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<RefillValidateCubit, RefillValidateState>(
          listener: (context, state) {
            switch (state) {
              default:
            }
          },
          builder: (context, vState) => switch (vState) {
            RefillValidateLoading() => const AppIndicator(),
            // TrValidateSuccess() => BlocConsumer<TransferCubit, TransferState>(
            //     listener: (context, pState) {
            //       switch (pState) {
            //         case TransferFailure():
            //           AppSnackBar.showSnackBar(pState.e.message);
            //         case TransferSuccess():
            //           showDialog(
            //             context: context,
            //             builder: (state) {
            //               return AlertDialog(
            //                 title: const Text('Перевод в обработке'),
            //                 content: SizedBox(
            //                   width: MediaQuery.sizeOf(context).width - 40,
            //                   child: Column(
            //                     mainAxisSize: MainAxisSize.min,
            //                     // mainAxisAlignment:
            //                     //     MainAxisAlignment.spaceBetween,
            //                     crossAxisAlignment: CrossAxisAlignment.stretch,
            //                     children: [
            //                       detailRow(
            //                         'Сумма',
            //                         (vState.params.summa / 100).toString(),
            //                       ),
            //                       detailRow(
            //                         'Комиссия',
            //                         (vState.params.fee ?? 0).toString(),
            //                       ),
            //                       detailRow(
            //                         'Валюта',
            //                         AppCurrencyFormatter.currencyName(
            //                           vState.params.currency,
            //                         ),
            //                       ),
            //                       detailRow('Куда', vState.params.account),
            //                       detailRow(
            //                         'Откуда',
            //                         vState.params.accountDt.obscureFirstNumbers,
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 actions: <Widget>[
            //                   TextButton(
            //                     onPressed: () => Navigator.of(context).pop(),
            //                     style: TextButton.styleFrom(
            //                       foregroundColor: AppColors.color54B25AMain,
            //                     ),
            //                     child: const Text('Ок'),
            //                   ),
            //                 ],
            //               );
            //             },
            //           );
            //         default:
            //       }
            //     },
            //     builder: (context, state) => switch (state) {
            //       TransferLoading() => const AppIndicator(),
            //       _ => CustomButton(
            //           onPress: () =>
            //               context.read<TransferCubit>().perform(vState.params),
            //           text: 'Перевести',
            //         ),
            //     },
            //   ),
            _ => CustomButton(
                onPress: () {
                  final dv = double.tryParse(_controller.text.trim()) ?? 0.0;

                  if (account == null) {
                    AppSnackBar.showSnackBar('Выберите счет');

                    return;
                  }

                  if (_formKey.currentState?.validate() == true) {
                    context.read<RefillValidateCubit>().validate(
                          card: qrData.account,
                          summa: (dv * 100).toInt(),
                          currency: account!.currency,
                          accountNum: account!.accountNumber,
                        );
                  }
                },
                text: 'Далее',
                radius: 16,
              ),
          },
        ),
      ),
    );
  }
}
