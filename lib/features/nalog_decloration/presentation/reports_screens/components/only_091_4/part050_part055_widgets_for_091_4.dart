import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/only_091_4/calculate_nalog_summa_widget_for_091_4.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class Part050toPart055WidgetsFor0914 extends StatelessWidget {
  const Part050toPart055WidgetsFor0914({
    super.key,
    required this.model,
    required this.c50,
    required this.nalogSumm052,
    required this.c53,
    required this.nalogSumm055,
  });
  final Map<String, dynamic> model;

  final TextEditingController c50;
  final ValueNotifier<num> nalogSumm052;

  final TextEditingController c53;
  final ValueNotifier<num> nalogSumm055;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'А) Субъектом, за исключением импортера, экспортера, дистрибьютера и субъекта реализующего горючего-смазочные материалы, лекарственные средства и медицинские изделия',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        const SizedBox(height: 16),
        Text(
          'До 30 000 000 сомов',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '050',
          controller: c50,
          numberPercent: '051',
          percent: model['sti051'],
          numberSumma: '052',
          nalogSumm: nalogSumm052,
        ),
        Text(
          'От 30 000 000 до 50 000 000\nсомов',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidgetFor0914(
          numberFiled: '053',
          numberPercent: '054',
          numberSumma: '055',
          percent: model['sti054'],
          controller: c53,
          nalogSumm: nalogSumm055,
        ),
      ],
    );
  }
}
