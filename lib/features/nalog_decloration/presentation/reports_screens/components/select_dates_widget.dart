import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/expanded_list_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_bottom_sheet_container.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class SelectDatesWidget extends StatelessWidget {
  const SelectDatesWidget({
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
                    title: 'Выберите квартал',
                    selectedIndex: value,
                    onSelected: (int index) {
                      selectedKvartalIndex.value = index;
                      kvartalSelected.value = false;
                    },
                    items: kvartals,
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 12),
        SelectBottomSheetContainer(
          selectedYear: selectedYear,
          isYearSelected: isYearSelected,
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
}

String dateFrom(int kvartalIndex, int year) {
  switch (kvartalIndex) {
    case 0:
      return '01.01.$year';
    case 1:
      return '01.04.$year';
    case 2:
      return '01.07.$year';
    case 3:
      return '01.10.$year';
    default:
      return '';
  }
}

String dateTo(int kvartalIndex, int year) {
  switch (kvartalIndex) {
    case 0:
      return '31.03.$year';
    case 1:
      return '30.06.$year';
    case 2:
      return '30.09.$year';
    case 3:
      return '31.12.$year';
    default:
      return '';
  }
}

List<String> get kvartals => [
      '1 квартал',
      '2 квартал',
      '3 квартал',
      '4 квартал',
    ];
