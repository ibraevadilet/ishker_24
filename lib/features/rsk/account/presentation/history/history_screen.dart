import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/utils/request_status.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/features/rsk/account/presentation/history/history_item_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

import 'date_picker.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.account});

  final String account;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HistoryCubit(historyUseCase: sl(), account: account)..load(),
      child: const HistoryView(),
    );
  }
}

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        titleWidget: Text(
          'history'.tr(context: context),
          style: AppTextStyles.s16W600(color: AppColors.color2C2C2CBlack),
        ),
        centerTitle: false,
        actions: const [DatePickWidget()],
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state.status is RequestLoading) return const AppIndicator();

          final items = state.model.items;

          return items.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset('assets/images/file_icon.svg'),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            bottom: 20,
                          ),
                          child: Text(
                            'operationsEmpty'.tr(context: context),
                            style: AppTextStyles.s16W500(
                              color: AppColors.color2C2C2CBlack,
                            ),
                          ),
                        ),
                        Text(
                          'operationsEmptyMsg'.tr(context: context),
                          style: AppTextStyles.s16W500(
                            color: AppColors.color6B7583Grey,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              : NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) {
                    final metrics = scrollEnd.metrics;
                    if (metrics.atEdge && metrics.pixels != 0) {
                      context.read<HistoryCubit>().next();
                    }

                    return true;
                  },
                  child: SafeArea(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) =>
                          HistoryItemWidget(item: items[index]),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
