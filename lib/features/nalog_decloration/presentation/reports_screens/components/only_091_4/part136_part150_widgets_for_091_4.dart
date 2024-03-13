import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/only_091_4/calculate_nalog_summa_widget_for_091_4.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class Part136toPart150WidgetsFor0914 extends StatelessWidget {
  const Part136toPart150WidgetsFor0914({
    super.key,
    required this.model,
    required this.c136,
    required this.nalogSumm138,
    required this.c139,
    required this.nalogSumm141,
    required this.c142,
    required this.nalogSumm144,
    required this.c145,
    required this.nalogSumm147,
    required this.c148,
    required this.nalogSumm150,
  });
  final Map<String, dynamic> model;

  final TextEditingController c136;
  final ValueNotifier<num> nalogSumm138;

  final TextEditingController c139;
  final ValueNotifier<num> nalogSumm141;

  final TextEditingController c142;
  final ValueNotifier<num> nalogSumm144;

  final TextEditingController c145;
  final ValueNotifier<num> nalogSumm147;

  final TextEditingController c148;
  final ValueNotifier<num> nalogSumm150;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Сауна',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '136',
          controller: c136,
          numberPercent: '137',
          percent: model['sti137'],
          numberSumma: '138',
          nalogSumm: nalogSumm138,
        ),
        const SizedBox(height: 8),
        Text(
          'Бильярд',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '139',
          controller: c139,
          numberPercent: '140',
          percent: model['sti140'],
          numberSumma: '141',
          nalogSumm: nalogSumm141,
        ),
        const SizedBox(height: 8),
        Text(
          'Баня, за исключением муниципиальных\nбань',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '142',
          controller: c142,
          numberPercent: '143',
          percent: model['sti143'],
          numberSumma: '144',
          nalogSumm: nalogSumm144,
        ),
        const SizedBox(height: 8),
        Text(
          'Резидент парка креативной индустрии',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '145',
          controller: c145,
          numberPercent: '146',
          percent: model['sti146'],
          numberSumma: '147',
          nalogSumm: nalogSumm147,
        ),
        const SizedBox(height: 8),
        Text(
          'Торговая деятельность на рынках и мини рынках (определенных кабинетом министров кыргызской республики)',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '148',
          controller: c148,
          numberPercent: '149',
          percent: model['sti149'],
          numberSumma: '150',
          nalogSumm: nalogSumm150,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
