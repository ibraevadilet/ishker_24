import 'dart:developer' as dev;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/utils/extensions.dart';
import 'package:ishker_24/src/core/widgets/custom_app_bar.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/client/view/client_info/client_info_cubit.dart';
import 'package:ishker_24/src/features/home/widgets/empty_account_widget.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/cubit/history_cubit.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/history_list.dart';
import 'package:ishker_24/src/features/rsk/account/view/info/card_buttons.dart';
import 'package:ishker_24/src/features/rsk/account/view/info/card_widget.dart';
import 'package:ishker_24/src/features/rsk/account/view/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/src/features/widgets/app_error_text.dart';
import 'package:ishker_24/src/features/widgets/app_indicator.dart';
import 'package:ishker_24/src/features/widgets/transformer_page_view.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AccountInfoCubit(sl())),
        BlocProvider(
          create: (_) => HistoryCubit(historyUseCase: sl()),
        ),
      ],
      child: const FullHasWidget(),
    );
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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => load());
  }

  Future<void> load() async {
    final infoCubit = context.read<ClientInfoCubit>();
    final accInfoCubit = context.read<AccountInfoCubit>();
    final historyCubit = context.read<HistoryCubit>();

    final state = infoCubit.state;
    if (state is ClientInfoSuccess && state.info.accountsList.isNotEmpty) {
      final acc = state.info.accountsList.first;

      accInfoCubit.load(acc.accountNumber);
      historyCubit.load(
        account: acc.accountNumber,
        start: DateTime.now().days90,
        size: 5,
      );

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: () async => load(),
      child: CustomScrollView(
        slivers: [
          CustomSliverAppbar(
            centerTitle: false,
            titleWidget: Text(
              'myBank'.tr(context: context),
              style: AppTextStyles.s16W600(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<ClientInfoCubit, ClientInfoState>(
                builder: (context, state) {
                  return switch (state) {
                    ClientInfoInitial() ||
                    ClientInfoLoading() =>
                      const AppIndicator(),
                    ClientInfoFailure() => AppErrorText(error: state.e.message),
                    ClientInfoSuccess() => state.info.accountsList.isEmpty
                        ? EmptyAccountWidget(partyId: state.info.absId)
                        : SizedBox(
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            child: PageTransformer(
                              pageViewBuilder: (context, visibilityResolver) {
                                return PageView.builder(
                                  controller:
                                      PageController(viewportFraction: .9),
                                  onPageChanged: (value) {
                                    // context.read()
                                    dev.log('pagechanged: $value');
                                  },
                                  itemCount: state.info.accountsList.length,
                                  itemBuilder: (context, i) {
                                    final account = state.info.accountsList[i];
                                    final pageVisibility = visibilityResolver
                                        .resolvePageVisibility(i);

                                    return CardWidget(
                                      account: account,
                                      pageVisibility: pageVisibility,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                  };
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CardButtons(),
            ),
          ),
          const SliverToBoxAdapter(child: HistoryListWidget()),
        ],
      ),
    );
  }
}
