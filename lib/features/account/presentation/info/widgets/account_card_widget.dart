import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/shimmers.dart';

import '../cubit/account_info_cubit.dart';

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({super.key, required this.account});

  final String account;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountInfoCubit, AccountInfoState>(
      builder: (context, state) {
        return defaultAnimatedSwitcher(
          switch (state) {
            AccountInfoInitial() || AccountInfoLoading() => shimmer(
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                ),
              ),
            _ => Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.color54B25AMain,
                      AppColors.colorBBD9B9,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFCFCFCF).withOpacity(.25),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        switch (state) {
                          AccountInfoSuccess() => RichText(
                              text: TextSpan(
                                text:
                                    '${AppCurrencyFormatter.currencyCash(state.account.amount)} ',
                                style:
                                    AppTextStyles.s28W700(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: AppCurrencyFormatter.cuccancyType(
                                      state.account.currency,
                                    ),
                                    style: AppTextStyles.s28W700(
                                      color: Colors.white,
                                    ).copyWith(
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                              ),
                            ),
                          _ => const SizedBox.shrink(),
                        },
                        RichText(
                          text: TextSpan(
                            text: '\u00b7\u00b7',
                            style: AppTextStyles.s14W700(color: Colors.white),
                            children: [
                              TextSpan(
                                text: account.substring(account.length - 4),
                                style:
                                    AppTextStyles.s14W400(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          },
        );
      },
    );
  }
}
