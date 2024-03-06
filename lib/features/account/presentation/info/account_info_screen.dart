import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/features/account/presentation/info/widgets/amount_unfree_widget.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

import '../history/history_item_widget.dart';
import 'widgets/account_action_buttons.dart';
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

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          child: BlocBuilder<AccountInfoCubit, AccountInfoState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AccountCardWidget(account: account),
                    const SizedBox(height: 24),
                    AccountActionButtons(account: account),
                    const SizedBox(height: 20),
                    const AmountUnfreeWidget(),
                  ],
                ),
              );
            },
          ),
        ),
        SliverList.list(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Последние операции',
                      style: AppTextStyles.s16W700(),
                    ),
                  ),
                  Flexible(
                    child: TextButton(
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
                  ),
                ],
              ),
            ),
          ],
        ),
        SliverList.builder(
          itemCount: context.watch<HistoryCubit>().state.model.items.length,
          itemBuilder: (context, i) {
            final item = context.watch<HistoryCubit>().state.model.items[i];

            return HistoryItemWidget(item: item);
          },
        ),
      ],
    );
  }
}
