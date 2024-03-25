import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/history_item_widget.dart';
import 'package:ishker_24/src/features/widgets/shimmers.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

import 'cubit/history_cubit.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({super.key});

  Widget get _shimmerTile => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: shimmerTile(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return defaultAnimatedSwitcher(
          switch (state.status) {
            RequestInitial() || RequestLoading() => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: shimmer(
                      SizedBox(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            accountHistoryRoute,
                            arguments: context.read<HistoryCubit>(),
                          ),
                          // AppRouting.pushFunction(
                          //   HistoryRoute(account: account),
                          // ),
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
                  ...state.model.items.map((e) => HistoryItemWidget(item: e)),
                ],
              ),
          },
        );
      },
    );
  }
}
