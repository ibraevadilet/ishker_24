import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/account/presentation/info/account_info_screen.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/get_client_info_cubit/get_client_info_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_account_widget.dart';
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
            emptyAccount: (partyId) => EmptyAccountWidget(partyId: partyId),
            loading: () => const AppIndicator(),
            error: (error) => AppErrorText(error: error),
            success: (model) => model.accountsList.isEmpty
                ? Column(
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
                          Visibility(
                            visible: model.accountsList.isEmpty,
                            child: IconButton(
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
                          ),
                        ],
                      ),
                    ],
                  )
                : AccountInfoScreen(
                    account: model.accountsList.first.accountNumber,
                  ),
          );
        },
      ),
    );
  }
}
