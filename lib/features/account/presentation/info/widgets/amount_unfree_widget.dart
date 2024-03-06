import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class AmountUnfreeWidget extends StatelessWidget {
  const AmountUnfreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<AccountInfoCubit, AccountInfoState>(
        builder: (context, state) {
          return switch (state) {
            AccountInfoSuccess() => ListTile(
                tileColor: Colors.white,
                title: Text(
                  'Сумма в обработке',
                  style: AppTextStyles.s14W400(
                    color: AppColors.color6B7583Grey,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                trailing: RichText(
                  text: TextSpan(
                    text: '${AppCurrencyFormatter.currencyCash(
                      state.account.amountUnfree,
                    )} ',
                    style: AppTextStyles.s16W700(
                      color: AppColors.color2C2C2CBlack,
                    ),
                    children: [
                      TextSpan(
                        text: AppCurrencyFormatter.cuccancyType(
                          state.account.currency,
                        ),
                        style: AppTextStyles.s16W500(
                          color: AppColors.color2C2C2CBlack,
                        ).copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
