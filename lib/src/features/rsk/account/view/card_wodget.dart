import 'package:flutter/material.dart';
import 'package:ishker_24/src/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/src/features/client/domain/entities/client_info.dart';
import 'package:ishker_24/src/features/widgets/transformer_page_view.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.account,
    required this.pageVisibility,
  });

  final AccountChet account;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    required double translationFactor,
    required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildText(BuildContext context) {
    Widget _amount = _applyTextEffects(
      translationFactor: 300.0,
      child: RichText(
        text: TextSpan(
          text: '${AppCurrencyFormatter.currencyCash(account.balance)} ',
          style: AppTextStyles.s28W700(color: Colors.white),
          children: [
            TextSpan(
              text: AppCurrencyFormatter.cuccancyType(
                account.currency,
              ),
              style: AppTextStyles.s28W700(
                color: Colors.white,
              ).copyWith(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );

    Widget _cardNum = _applyTextEffects(
      translationFactor: 200.0,
      child: RichText(
        text: TextSpan(
          text: '\u00b7\u00b7',
          style: AppTextStyles.s14W700(color: Colors.white),
          children: [
            TextSpan(
              text: account.accountNumber
                  .substring(account.accountNumber.length - 4),
              style: AppTextStyles.s14W400(color: Colors.white),
            )
          ],
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [_amount, _cardNum],
    );
  }

  final decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFFCFCFCF).withOpacity(.25),
        spreadRadius: 0,
        blurRadius: 8,
        offset: const Offset(0, 1),
      ),
    ],
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        AppColors.color54B25AMain,
        AppColors.colorBBD9B9,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: decoration,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildText(context),
        ),
      ),
    );
  }
}
