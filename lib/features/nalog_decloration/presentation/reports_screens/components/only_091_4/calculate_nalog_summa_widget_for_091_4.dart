import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/custom_text_field.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/static_container_info_widget.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class CalculateNalogSummaWidgetFor0914 extends StatelessWidget {
  const CalculateNalogSummaWidgetFor0914({
    super.key,
    required this.numberFiled,
    required this.numberPercent,
    required this.numberSumma,
    this.percent,
    required this.controller,
    required this.nalogSumm,
  });
  final String numberFiled;
  final String numberPercent;
  final String numberSumma;
  final num? percent;
  final TextEditingController controller;
  final ValueNotifier<num> nalogSumm;

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
          enabled: false,
          keyboardType: TextInputType.number,
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'[0-9]'),
            ),
          ],
        ),
        if (percent == null)
          Text(
            'Выберите код УГНС',
            style: AppTextStyles.s14W400(color: Colors.red),
          ),
        const SizedBox(height: 16),
        FieldNameWidget(
          number: numberPercent,
          title: 'Ставка налога (%)',
        ),
        const SizedBox(height: 12),
        StaticContainerInfoWidget(
          title: percent != null ? percent.toString() : 'Выберите код УГНС',
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
