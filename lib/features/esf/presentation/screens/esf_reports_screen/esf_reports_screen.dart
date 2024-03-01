// ignore_for_file: prefer_if_null_operators

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/esf/data/repo_impls/esf_invoice_repo_impl.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_invoice_cubit/esf_invoice_cubit.dart';
import 'package:ishker_24/features/esf/presentation/widgets/esf_container.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/esf_expanded_list.dart';
import 'package:ishker_24/widgets/expanded_list_widget.dart';
import 'package:ishker_24/widgets/show_calendar/show_calendar.dart';

@RoutePage()
class EsfReportsScreen extends StatefulWidget {
  const EsfReportsScreen({
    super.key,
    required this.type,
    required this.title,
  });
  final ESFType type;
  final String title;

  @override
  State<EsfReportsScreen> createState() => _EsfReportsScreenState();
}

class _EsfReportsScreenState extends State<EsfReportsScreen> {
  List<String> status = [];
  String title = 'Статус';
  DateTime? createDateFrom;
  DateTime? createDateTo;
  int? selectedIndex;

  final TextEditingController contractorController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  @override
  void dispose() {
    contractorController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<EsfInvoiceCubit>()..esfReports(typeFrom: widget.type),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: false,
          title: widget.title,
        ),
        body: BlocBuilder<EsfInvoiceCubit, EsfInvoiceState>(
          builder: (context, state) {
            return state.when(
              loading: () => const AppIndicator(),
              error: (error) => AppErrorText(error: error),
              success: (data, statuses) {
                status = statuses.content.map((e) => e.name).toList();
                return SingleChildScrollView(
                  controller: context.read<EsfInvoiceCubit>().scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EsfExpandedList(
                          title: 'Фильтр',
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    showCalendar(context, (start) {
                                      setState(() {
                                        createDateFrom = start;
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.color7A7A7AGrey),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Дата создания C',
                                          style: AppTextStyles.s12W400(),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          createDateFrom == null
                                              ? ''
                                              : AppDateFormats.formatDdMMYyyy
                                                  .format(createDateFrom!),
                                          style: AppTextStyles.s16W600(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: () {
                                    showCalendar(
                                        context,
                                        (start) => setState(() {
                                              createDateTo = start;
                                            }));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.color7A7A7AGrey),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Дата создания ПО',
                                          style: AppTextStyles.s12W400(),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          createDateTo == null
                                              ? ''
                                              : AppDateFormats.formatDdMMYyyy
                                                  .format(createDateTo!),
                                          style: AppTextStyles.s16W600(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ExpandedList(
                              borderColor: AppColors.color6B7583Grey,
                              title: title,
                              selectedIndex: selectedIndex,
                              onSelected: (e) {
                                setState(() {
                                  selectedIndex = e;
                                });
                              },
                              items: status,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              labelText: 'Контрагент',
                              controller: contractorController,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              labelText: 'Номер ЭСФ',
                              controller: numberController,
                            ),
                            const SizedBox(height: 8),
                            CustomButton(
                              radius: 16,
                              onPress: () {
                                context.read<EsfInvoiceCubit>().esfReports(
                                      isFilter: true,
                                      createdDateFromFrom: createDateFrom,
                                      createdDateToFrom: createDateTo,
                                      statusCodeFrom: selectedIndex == null
                                          ? null
                                          : statuses.content[selectedIndex!].id
                                              .toString(),
                                      invoiceNumberFrom:
                                          numberController.text.isEmpty
                                              ? null
                                              : numberController.text,
                                      contractorTinFrom:
                                          contractorController.text.isEmpty
                                              ? null
                                              : contractorController.text,
                                    );
                              },
                              text: 'Поиск',
                            ),
                            const SizedBox(height: 8),
                            CustomButton(
                              onPress: () {
                                contractorController.clear();
                                numberController.clear();
                                setState(() {
                                  selectedIndex = null;
                                  createDateFrom = null;
                                  createDateTo = null;
                                });
                                context.read<EsfInvoiceCubit>().clear();
                                context.read<EsfInvoiceCubit>().esfReports();
                              },
                              text: 'Очистить фильтр',
                              radius: 16,
                              textColor: AppColors.color54B25AMain,
                              color: Colors.transparent,
                              borderColor: AppColors.color54B25AMain,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => EsfContainer(
                            type: widget.type,
                            model: data.invoices[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: data.invoices.length,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
