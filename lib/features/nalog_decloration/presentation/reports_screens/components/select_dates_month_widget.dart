import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/expanded_list_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_bottom_sheet_container.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class SelectDatesMonthWidget extends StatelessWidget {
  const SelectDatesMonthWidget({
    super.key,
    required this.selectedKvartalIndex,
    required this.kvartalSelected,
    required this.selectedYear,
    required this.isYearSelected,
    required this.onDaySelected,
  });
  final ValueNotifier<int?> selectedKvartalIndex;
  final ValueNotifier<bool> kvartalSelected;
  final ValueNotifier<int?> selectedYear;
  final ValueNotifier<bool> isYearSelected;
  final Function(String startdate, String enddate) onDaySelected;

  @override
  Widget build(BuildContext context) {
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
              valueListenable: selectedKvartalIndex,
              builder: (_, value, child) {
                return ValueListenableBuilder(
                  valueListenable: kvartalSelected,
                  builder: (_, isKvartalSelected, child) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: isKvartalSelected
                            ? Border.all(
                                color: Colors.red,
                              )
                            : null,
                      ),
                      child: ExpandedList(
                        color: AppColors.colorF3F4F5Grey,
                        title: 'Выберите месяц',
                        selectedIndex: value,
                        onSelected: (int index) {
                          selectedKvartalIndex.value = index;
                          kvartalSelected.value = false;
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
          selectedKvartalIndex: selectedKvartalIndex,
          isMonth: true,
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: selectedKvartalIndex,
          builder: (_, kvartalIndex, child) {
            return ValueListenableBuilder(
              valueListenable: selectedYear,
              builder: (_, year, child) {
                if (kvartalIndex != null && year != null) {
                  onDaySelected(
                    dateFrom(kvartalIndex, year),
                    dateTo(kvartalIndex, year),
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
                            kvartalIndex != null && year != null
                                ? dateFrom(
                                    kvartalIndex,
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
                            kvartalIndex != null && year != null
                                ? dateTo(
                                    kvartalIndex,
                                    year,
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
  }

  List<String> months() {
    final year = selectedYear.value!;
    final int nowYear = int.parse(DateFormat.y().format(DateTime.now()));
    final int nowMonth = int.parse(DateFormat.M().format(DateTime.now()));

    List<String> monthsForSlect = [];

    if (nowYear == year) {
      switch (nowMonth) {
        case 1:
          monthsForSlect.add('Январь');
          break;
        case 2:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
            ],
          );
          break;
        case 3:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
            ],
          );
          break;
        case 4:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
            ],
          );
          break;
        case 5:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
            ],
          );
          break;
        case 6:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
            ],
          );
          break;
        case 7:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
              'Июль',
            ],
          );
          break;
        case 8:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
              'Июль',
              'Август',
            ],
          );
          break;
        case 9:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
              'Июль',
              'Август',
              'Сентябрь',
            ],
          );
          break;
        case 10:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
              'Июль',
              'Август',
              'Сентябрь',
              'Октябрь',
            ],
          );
          break;
        case 11:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
              'Июль',
              'Август',
              'Сентябрь',
              'Октябрь',
              'Ноябрь',
            ],
          );
          break;
        case 12:
          monthsForSlect.addAll(
            [
              'Январь',
              'Февраль',
              'Март',
              'Апрель',
              'Май',
              'Июнь',
              'Июль',
              'Август',
              'Сентябрь',
              'Октябрь',
              'Ноябрь',
              'Декабрь',
            ],
          );
          break;
      }
    } else {
      monthsForSlect.addAll(
        [
          'Январь',
          'Февраль',
          'Март',
          'Апрель',
          'Май',
          'Июнь',
          'Июль',
          'Август',
          'Сентябрь',
          'Октябрь',
          'Ноябрь',
          'Декабрь',
        ],
      );
    }
    return monthsForSlect;
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

String dateTo(int monthIndex, int year) {
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
