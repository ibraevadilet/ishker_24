import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/features/account/presentation/info/widgets/amount_unfree_widget.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/shimmers.dart';

import '../history/history_item_widget.dart';
import 'widgets/account_card_widget.dart';

@RoutePage()
class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key, required this.account});

  final String account;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AccountInfoCubit(sl())..load(account),
        ),
        BlocProvider(
          create: (_) => HistoryCubit(
            historyUseCase: sl(),
            account: account,
          )..load(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: AccountInfoView(account: account),
      ),
    );
  }
}

class AccountInfoView extends StatefulWidget {
  const AccountInfoView({super.key, required this.account});

  final String account;

  @override
  State<AccountInfoView> createState() => _AccountInfoViewState();
}

class _AccountInfoViewState extends State<AccountInfoView> {
  String get account => widget.account;

  Widget get _shimmerTile => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: shimmerTile(),
      );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.color54B25AMain,
      onRefresh: () async {
        context.read<AccountInfoCubit>().load(account);
        context.read<HistoryCubit>().load();
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(account),
            titleTextStyle: AppTextStyles.s20W700(),
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
            centerTitle: false,
            iconTheme: const IconThemeData(color: AppColors.color727D8DGrey),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AccountCardWidget(account: account),
                  const SizedBox(height: 24),
                  AccountActionButtons(account: account),
                  const SizedBox(height: 20),
                  const AmountUnfreeWidget(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<HistoryCubit, HistoryState>(
                builder: (context, state) {
                  return defaultAnimatedSwitcher(
                    switch (state.status) {
                      RequestInitial() || RequestLoading() => Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: shimmer(
                                SizedBox(
                                  height: 48,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      shimmerContainer(width: 120, height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 16,
                                        ),
                                        child: shimmerContainer(
                                          width: 40,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ...[_shimmerTile, _shimmerTile, _shimmerTile],
                          ],
                        ),
                      _ => Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      'Последние операции',
                                      style: AppTextStyles.s16W700(),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => AppRouting.pushFunction(
                                      HistoryRoute(account: account),
                                    ),
                                    child: Text(
                                      'Все',
                                      style: AppTextStyles.s16W700(
                                        color: AppColors.color54B25AMain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ...state.model.items
                                .map((e) => HistoryItemWidget(item: e)),
                          ],
                        ),
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
