import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

Future<AccountChetModel> showSelectedAccountSheet(
  BuildContext context,
  List<AccountChetModel> accoubtList,
  AccountChetModel selectedFrom,
) async {
  AccountChetModel selected = selectedFrom;
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.color6B7583Grey,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Выберите счет для зачисления',
            style: AppTextStyles.s16W500(),
          ),
          const SizedBox(height: 24),
          Column(
            children: accoubtList
                .map<Widget>(
                  (e) => InkWell(
                    onTap: () {
                      setState(() {
                        selected = e;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppCurrencyFormatter.cuccancyIcon(e.currency),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Счет ...${e.accountNumber.substring(e.accountNumber.length - 3, e.accountNumber.length)}',
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
                                      text: '${e.balance} ',
                                    ),
                                    TextSpan(
                                      text: AppCurrencyFormatter.cuccancyType(
                                          e.currency),
                                      style: AppTextStyles.s16W500().copyWith(
                                        decoration: e.currency == 'KGZ'
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
                          if (e.accountNumber == selected.accountNumber)
                            SvgPicture.asset(AppImages.starSelectedIcon),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      );
    }),
  );
  return selected;
}
