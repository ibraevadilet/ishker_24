import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/cubits/get_my_reports_cubit/get_my_reports_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class MyReportsWidget extends StatelessWidget {
  const MyReportsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetMyReportsCubit>(),
      child: BlocBuilder<GetMyReportsCubit, GetMyReportsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const AppIndicator(),
            error: (error) => AppErrorText(error: error),
            success: (model) => model.isEmpty
                ? Center(
                    child: Text(
                      'У вас еще нет отчетов',
                      style: AppTextStyles.s16W500(),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        AppRouting.pushFunction(
                          ReportDetailPdfViewRoute(
                            reportId: model[index].reportId,
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model[index].sendDate,
                            style: AppTextStyles.s16W400(),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  imageByStatus(model[index].status),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model[index].reportName,
                                        style: AppTextStyles.s16W500(),
                                      ),
                                      const SizedBox(height: 12),
                                      if (model[index].period.isNotEmpty)
                                        Text(
                                          'Период: ${model[index].period}',
                                          style: AppTextStyles.s16W400(),
                                        ),
                                      if (model[index].formType.isNotEmpty)
                                        Text(
                                          'Тип документа: ${model[index].formType}',
                                          style: AppTextStyles.s16W400(),
                                        ),
                                      Text(
                                        'Статус: ${nameByStatus(model[index].status)}',
                                        style: AppTextStyles.s16W400(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: model.length,
                  ),
          );
        },
      ),
    );
  }
}

String imageByStatus(String status) {
  switch (status) {
    case 'IN_PROCESS':
      return AppImages.edNalogIconInProcess;
    case 'APPROVED':
      return AppImages.edNalogIcon;
    case 'REJECTED':
      return AppImages.edNalogIconReject;
    default:
      return AppImages.edNalogIcon;
  }
}

String nameByStatus(String status) {
  switch (status) {
    case 'IN_PROCESS':
      return 'в обработке';
    case 'APPROVED':
      return 'принят';
    case 'REJECTED':
      return 'отказано';
    default:
      return 'принят';
  }
}
