import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/src/core/widgets/custom_app_bar.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/date_picker.dart';
import 'package:ishker_24/src/features/rsk/account/view/history/history_item_widget.dart';
import 'package:ishker_24/src/theme/app_colors.dart';
import 'package:ishker_24/src/theme/app_text_styles.dart';

import 'cubit/history_cubit.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          final items = state.model.items;

          return NotificationListener<ScrollEndNotification>(
            onNotification: (scrollEnd) {
              final metrics = scrollEnd.metrics;
              if (metrics.atEdge && metrics.pixels != 0) {
                context.read<HistoryCubit>().next();
              }

              return true;
            },
            child: CustomScrollView(
              slivers: [
                CustomSliverAppbar(
                  backgroundColor: AppColors.backgroundColor,
                  titleWidget: Text(
                    'history'.tr(context: context),
                    style: AppTextStyles.s16W600(
                        color: AppColors.color2C2C2CBlack),
                  ),
                  centerTitle: false,
                  actions: const [DatePickWidget()],
                ),
                items.isEmpty
                    ? SliverToBoxAdapter(
                        child: Center(
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
                        ),
                      )
                    : SliverList.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) =>
                            HistoryItemWidget(item: items[index]),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
