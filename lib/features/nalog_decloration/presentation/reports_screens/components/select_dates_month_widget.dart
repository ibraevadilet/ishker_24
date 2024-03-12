import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/date_format.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/expanded_list_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_bottom_sheet_container.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class SelectDatesMonthWidget extends StatelessWidget {
  const SelectDatesMonthWidget({
    super.key,
    required this.selectedMonthIndex,
    required this.monthSelected,
    required this.selectedYear,
    required this.isYearSelected,
    required this.onDaySelected,
    required this.isDocType3,
  });
  final ValueNotifier<int?> selectedMonthIndex;
  final ValueNotifier<bool> monthSelected;
  final ValueNotifier<int?> selectedYear;
  final ValueNotifier<bool> isYearSelected;
  final Function(String startdate, String enddate) onDaySelected;
  final ValueNotifier<bool> isDocType3;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDocType3,
      builder: (_, isDocType3Value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Налоговый период (201 - 202)',
              style: AppTextStyles.s14W600(),
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: selectedYear,
              builder: (_, __, child) {
                return ValueListenableBuilder(
                  valueListenable: selectedMonthIndex,
                  builder: (_, selectedMonthIndexValue, child) {
                    return ValueListenableBuilder(
                      valueListenable: monthSelected,
                      builder: (_, monthSelectedValue, child) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: monthSelectedValue
                                ? Border.all(
                                    color: Colors.red,
                                  )
                                : null,
                          ),
                          child: ExpandedList(
                            tapEnabled: !isDocType3Value,
                            color: AppColors.colorF3F4F5Grey,
                            title: 'Выберите месяц',
                            selectedIndex: selectedMonthIndexValue,
                            onSelected: (int index) {
                              selectedMonthIndex.value = index;
                              monthSelected.value = false;
                            },
                            items: months(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            SelectBottomSheetContainer(
              selectedYear: selectedYear,
              isYearSelected: isYearSelected,
              selectedKvartalIndex: selectedMonthIndex,
              isMonth: true,
              isTapped: !isDocType3Value,
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: selectedMonthIndex,
              builder: (_, selectedMonthIndexValue, child) {
                return ValueListenableBuilder(
                  valueListenable: selectedYear,
                  builder: (_, year, child) {
                    if (selectedMonthIndexValue != null && year != null) {
                      onDaySelected(
                        dateFrom(selectedMonthIndexValue, year),
                        dateTo(selectedMonthIndexValue, year, isDocType3Value),
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Дата с', style: AppTextStyles.s16W500()),
                            const SizedBox(height: 12),
                            Container(
                              height: 47,
                              width: 140,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.colorF3F4F5Grey,
                              ),
                              child: Text(
                                selectedMonthIndexValue != null && year != null
                                    ? dateFrom(
                                        selectedMonthIndexValue,
                                        year,
                                      )
                                    : '',
                                style: AppTextStyles.s16W500(),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('по', style: AppTextStyles.s16W500()),
                            const SizedBox(height: 12),
                            Container(
                              height: 47,
                              width: 140,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.colorF3F4F5Grey,
                              ),
                              child: Text(
                                selectedMonthIndexValue != null && year != null
                                    ? dateTo(
                                        selectedMonthIndexValue,
                                        year,
                                        isDocType3Value,
                                      )
                                    : '',
                                style: AppTextStyles.s16W500(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  List<String> months() {
    final year = selectedYear.value!;
    final int nowYear = DateTime.now().year;
    final int nowMonth = DateTime.now().month;
    List<String> monthsForSelect = List.generate(
      12,
      (index) => DateFormat('MMMM').format(DateTime(year, index + 1, 1)),
    );

    if (nowYear == year) {
      monthsForSelect = monthsForSelect.sublist(0, nowMonth);
    }

    return monthsForSelect;
  }
}

String dateFrom(int monthIndex, int year) {
  switch (monthIndex) {
    case 0:
      return '01.01.$year';
    case 1:
      return '01.02.$year';
    case 2:
      return '01.03.$year';
    case 3:
      return '01.04.$year';
    case 4:
      return '01.05.$year';
    case 5:
      return '01.06.$year';
    case 6:
      return '01.07.$year';
    case 7:
      return '01.08.$year';
    case 8:
      return '01.09.$year';
    case 9:
      return '01.10.$year';
    case 10:
      return '01.11.$year';
    case 11:
      return '01.12.$year';
    default:
      return '';
  }
}

bool isLeapYear(int year) {
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    return true; // Год високосный
  } else {
    return false; // Год не високосный
  }
}

String dateTo(int monthIndex, int year, bool isDoc3) {
  if (isDoc3) {
    return AppDateFormats.formatDdMMYyyy.format(DateTime.now());
  } else {
    bool leapYear = isLeapYear(year);

    switch (monthIndex) {
      case 0:
        return '31.01.$year';
      case 1:
        return leapYear ? '29.02.$year' : '28.02.$year';
      case 2:
        return '31.03.$year';
      case 3:
        return '30.04.$year';
      case 4:
        return '31.05.$year';
      case 5:
        return '30.06.$year';
      case 6:
        return '31.07.$year';
      case 7:
        return '31.08.$year';
      case 8:
        return '30.09.$year';
      case 9:
        return '31.10.$year';
      case 10:
        return '30.11.$year';
      case 11:
        return '31.12.$year';
      default:
        return '';
    }
  }
}
