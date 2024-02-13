import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/get_client_info_cubit/get_client_info_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class BankInfoWidget extends StatelessWidget {
  const BankInfoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetClientInfoCubit>(),
      child: BlocBuilder<GetClientInfoCubit, GetClientInfoState>(
        builder: (context, state) {
          return state.when(
            loading: () => const AppIndicator(),
            error: (error) => AppErrorText(error: error),
            success: (model) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Счета',
                          style: AppTextStyles.s16W700(),
                        ),
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          AppRouting.pushFunction(
                            OpenAccountRoute(partyId: model.absId),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.color34C759Green,
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: model.accountsList.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset(
                        AppCurrencyFormatter.cuccancyIcon(
                            model.accountsList[index].currency),
                      ),
                      title: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Счет ...${model.accountsList[index].accountNumber.substring(model.accountsList[index].accountNumber.length - 3, model.accountsList[index].accountNumber.length)}',
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
                                      text:
                                          '${model.accountsList[index].balance} ',
                                    ),
                                    TextSpan(
                                      text: AppCurrencyFormatter.cuccancyType(
                                          model.accountsList[index].currency),
                                      style: AppTextStyles.s16W500().copyWith(
                                        decoration: model.accountsList[index]
                                                    .currency ==
                                                'KGZ'
                                            ? TextDecoration.underline
                                            : null,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
