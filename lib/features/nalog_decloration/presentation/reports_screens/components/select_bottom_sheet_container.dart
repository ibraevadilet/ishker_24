import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ishker_24/core/formatters/shapes.dart';
import 'package:ishker_24/core/functions/un_focuser_func.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class SelectBottomSheetContainer extends StatefulWidget {
  const SelectBottomSheetContainer({
    super.key,
    required this.selectedYear,
    required this.isYearSelected,
    required this.selectedKvartalIndex,
    this.isMonth = false,
  });
  final ValueNotifier<int?> selectedYear;
  final ValueNotifier<bool> isYearSelected;
  final ValueNotifier<int?> selectedKvartalIndex;
  final bool isMonth;

  @override
  State<SelectBottomSheetContainer> createState() =>
      _SelectBottomSheetContainerState();
}

class _SelectBottomSheetContainerState
    extends State<SelectBottomSheetContainer> {
  final String nowYear = DateFormat.y().format(DateTime.now());
  late List<int> years =
      List.generate(50, (index) => int.parse(nowYear) - index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        unFocuserFunc(context);
        showModalBottomSheet(
          shape: AppShapes.bottomNavigatorShape(),
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 300,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: years.indexOf(
                      widget.selectedYear.value ?? years.first,
                    ),
                  ),
                  diameterRatio: 1.0,
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    widget.selectedYear.value = years[index];
                    widget.isYearSelected.value = false;
                    if (widget.isMonth) {
                      selectMonth(index);
                    } else {
                      selectKvartal(index);
                    }
                  },
                  children: years
                      .map<Widget>(
                        (e) => Center(
                          child: Text(
                            e.toString(),
                            style: AppTextStyles.s20W500(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: CustomButton(
                  onPress: () {
                    widget.selectedYear.value ??= years.first;
                    Navigator.pop(context);
                  },
                  text: 'Выбрать',
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
      child: ValueListenableBuilder(
        valueListenable: widget.selectedYear,
        builder: (_, value, child) {
          return ValueListenableBuilder(
            valueListenable: widget.isYearSelected,
            builder: (_, isSelected, child) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colorF3F4F5Grey,
                  border: isSelected ? Border.all(color: Colors.red) : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value == null ? 'Год' : value.toString(),
                        style: AppTextStyles.s14W600(),
                      ),
                    ),
                    const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.color7A7A7AGrey,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  selectKvartal(int index) {
    final int nowYear = DateTime.now().year;
    final int nowMonth = DateTime.now().month;
    int kvINdex = 0;
    final selectedKvartalIndex = widget.selectedKvartalIndex.value ?? 0;
    switch (nowMonth) {
      case 1:
        kvINdex = 0;
        break;
      case 2:
        kvINdex = 0;
        break;
      case 3:
        kvINdex = 0;
        break;
      case 4:
        kvINdex = 1;
        break;
      case 5:
        kvINdex = 1;
        break;
      case 6:
        kvINdex = 1;
        break;
      case 7:
        kvINdex = 2;
        break;
      case 8:
        kvINdex = 2;
        break;
      case 9:
        kvINdex = 2;
        break;
      case 10:
        kvINdex = 3;
        break;
      case 11:
        kvINdex = 3;
        break;
      case 12:
        kvINdex = 3;
        break;
      default:
        kvINdex = 0;
    }
    if (years[index] == nowYear) {
      if (selectedKvartalIndex > kvINdex) {
        widget.selectedKvartalIndex.value = null;
      }
    }
  }

  selectMonth(int index) {
    final int nowYear = DateTime.now().year;
    final int nowMonth = DateTime.now().month;
    final selectedMonthIndex = widget.selectedKvartalIndex.value ?? 0;

    if (years[index] == nowYear) {
      if (selectedMonthIndex > nowMonth - 1) {
        widget.selectedKvartalIndex.value = null;
      }
    }
  }
}
