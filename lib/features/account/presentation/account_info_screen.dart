import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/account/presentation/account_info_cubit/account_info_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key, required this.account});

  final String account;

  Widget infoWidget(String title, String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
            ),
            Flexible(
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
    return BlocProvider(
      create: (_) => AccountInfoCubit(useCase: sl())..load(account),
      child: Scaffold(
        appBar: CustomAppBar(title: account),
        body: SafeArea(
          child: BlocBuilder<AccountInfoCubit, AccountInfoState>(
            builder: (_, state) {
              return state.when(
                loading: () => const AppIndicator(),
                error: (e) => AppErrorText(error: e),
                success: (info) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      infoWidget(
                        'Баланс',
                        AppCurrencyFormatter.currencyCash(info.amount),
                      ),
                      infoWidget(
                        'Доступный баланс',
                        AppCurrencyFormatter.currencyCash(info.amountFree),
                      ),
                      infoWidget(
                        'В обработке',
                        AppCurrencyFormatter.currencyCash(info.amountUnfree),
                      ),
                      infoWidget(
                        'Валюта',
                        AppCurrencyFormatter.currencyName(info.currency),
                      ),
                      infoWidget('БИК', info.bic),
                      infoWidget('Банк', info.depname),
                      infoWidget('ИНН Банка', info.pin),
                      infoWidget('Адрес', info.address),
                      TextButton(
                        onPressed: () => AppRouting.pushFunction(
                          HistoryRoute(account: account),
                        ),
                        child: Text(
                          'История операций по счету',
                          style: AppTextStyles.s14W500(
                            color: AppColors.color54B25AMain,
                          ),
                        ),
                      )
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
