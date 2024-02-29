import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/calculate_nalog_summa_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class Part050toPart055Widgets extends StatelessWidget {
  const Part050toPart055Widgets({
    super.key,
    required this.model,
    required this.allSumm,
    required this.c50,
    required this.nalogSumm052,
    required this.c53,
    required this.nalogSumm055,
  });
  final Map<String, dynamic> model;
  final Function allSumm;

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
        CalculateNalogSummaWidget(
          numberFiled: '050',
          numberPercent: '051',
          numberSumma: '052',
          percent: model['sti051'],
          controller: c50,
          nalogSumm: nalogSumm052,
          onChanged: (summa) {
            ///////////
            allSumm();
          },
        ),
        Text(
          'От 30 000 000 до 50 000 000\nсомов',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '053',
          numberPercent: '054',
          numberSumma: '055',
          percent: model['sti054'],
          controller: c53,
          nalogSumm: nalogSumm055,
          onChanged: (summa) {
            ///////////
            allSumm();
          },
        ),
      ],
    );
  }
}
