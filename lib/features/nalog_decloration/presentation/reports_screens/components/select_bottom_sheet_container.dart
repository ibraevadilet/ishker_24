import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ishker_24/core/formatters/shapes.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class SelectBottomSheetContainer extends StatefulWidget {
  const SelectBottomSheetContainer({
    super.key,
    required this.selectedYear,
    required this.isYearSelected,
  });
  final ValueNotifier<int?> selectedYear;
  final ValueNotifier<bool> isYearSelected;

  @override
  State<SelectBottomSheetContainer> createState() =>
      _SelectBottomSheetContainerState();
}

class _SelectBottomSheetContainerState
    extends State<SelectBottomSheetContainer> {
  final String nowYear = DateFormat.y().format(DateTime.now());
  late List<int> years =
      List.generate(30, (index) => int.parse(nowYear) - 15 + index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape: AppShapes.bottomNavigatorShape(),
          context: context,
          builder: (context) => Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 300,
            child: CupertinoPicker(
              diameterRatio: 1.0,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                widget.selectedYear.value = years[index];
                widget.isYearSelected.value = false;
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
}
