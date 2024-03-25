import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/formatters/cuccency_formatter.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/widgets/custom_app_bar.dart';
import 'package:ishker_24/src/features/client/view/client_info/client_info_cubit.dart';
import 'package:ishker_24/src/features/home/widgets/empty_account_widget.dart';
import 'package:ishker_24/src/features/widgets/app_error_text.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';
import 'package:ishker_24/src/features/widgets/styled_toasts.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

import 'check_client_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheckClientWidget(successWidget: FullHasWidget());
  }
}

class FullHasWidget extends StatefulWidget {
  const FullHasWidget({super.key});

  @override
  State<FullHasWidget> createState() => _FullHasWidgetState();
}

class _FullHasWidgetState extends State<FullHasWidget> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientInfoCubit, ClientInfoState>(
      listener: (context, state) {
        switch (state) {
          case ClientInfoFailure():
            AppSnackBar.showSnackBar(state.e.message);
          default:
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async {
            context.read<ClientInfoCubit>().init();
          },
          child: CustomScrollView(
            slivers: [
              CustomSliverAppbar(
                centerTitle: false,
                titleWidget: switch (state) {
                  ClientInfoSuccess() => Text(
                      state.info.fio,
                      style: AppTextStyles.s16W600(),
                    ),
                  _ => const SizedBox.shrink(),
                },
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.mainNotificationIcon,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: SafeArea(
                  child: switch (state) {
                    ClientInfoInitial() ||
                    ClientInfoLoading() =>
                      const AppIndicator(),
                    ClientInfoFailure() => AppErrorText(error: state.e.message),
                    ClientInfoSuccess() => state.info.accountsList.isEmpty
                        ? EmptyAccountWidget(partyId: state.info.absId)
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
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
                                      visible: state.info.accountsList.isEmpty,
                                      child: IconButton(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          // AppRouting.pushFunction(
                                          //   OpenAccountRoute(
                                          //     partyId: state.info.absId,
                                          //   ),
                                          // );
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: AppColors.color34C759Green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ...state.info.accountsList
                                    .map(
                                      (it) => ListTile(
                                        onTap: () => log('tap $it'),
                                        // AppRouting.pushFunction(
                                        //   AccountInfoRoute(
                                        //     account: it.accountNumber,
                                        //   ),
                                        // ),
                                        contentPadding: EdgeInsets.zero,
                                        leading: SvgPicture.asset(
                                          AppCurrencyFormatter.cuccancyIcon(
                                            it.currency,
                                          ),
                                        ),
                                        title: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Счет ...${it.accountNumber.substring(it.accountNumber.length - 3, it.accountNumber.length)}',
                                                  style: AppTextStyles.s12W400(
                                                    color: AppColors
                                                        .color6B7583Grey,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                RichText(
                                                  text: TextSpan(
                                                    style:
                                                        AppTextStyles.s16W500(),
                                                    children: [
                                                      TextSpan(
                                                        text: '${it.balance} ',
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            AppCurrencyFormatter
                                                                .cuccancyType(
                                                          it.currency,
                                                        ),
                                                        style: AppTextStyles
                                                                .s16W500()
                                                            .copyWith(
                                                          decoration:
                                                              it.currency ==
                                                                      'KGZ'
                                                                  ? TextDecoration
                                                                      .underline
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
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
