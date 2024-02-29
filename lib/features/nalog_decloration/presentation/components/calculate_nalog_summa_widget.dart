import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/custom_text_field.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/static_container_info_widget.dart';

class CalculateNalogSummaWidget extends StatelessWidget {
  const CalculateNalogSummaWidget({
    super.key,
    required this.numberFiled,
    required this.numberPercent,
    required this.numberSumma,
    required this.percent,
    required this.controller,
    required this.nalogSumm,
    this.onChanged,
  });
  final String numberFiled;
  final String numberPercent;
  final String numberSumma;
  final num percent;

  final TextEditingController controller;
  final ValueNotifier<num> nalogSumm;
  final Function(num summa)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        FieldNameWidget(
          number: numberFiled,
          title: 'Выручка от реализации товаров, работ, услуг',
        ),
        const SizedBox(height: 12),
        CustomTextField(
          keyboardType: TextInputType.number,
          controller: controller,
          onChanged: (val) {
            if (val.isNotEmpty) {
              nalogSumm.value = int.parse(val) * (percent / 100);
            } else {
              nalogSumm.value = 0;
            }
            if (onChanged != null) {
              onChanged!(nalogSumm.value);
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'[0-9]'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        FieldNameWidget(
          number: numberPercent,
          title: 'Ставка налога (%)',
        ),
        const SizedBox(height: 12),
        StaticContainerInfoWidget(
          title: percent.toString(),
        ),
        const SizedBox(height: 16),
        FieldNameWidget(
          number: numberSumma,
          title: 'Сумма налога',
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: nalogSumm,
          builder: (_, value, child) {
            return StaticContainerInfoWidget(
              title: value.toString(),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
