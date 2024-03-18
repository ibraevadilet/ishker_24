import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/calculate_nalog_summa_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/static_container_info_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class Part056toPart132Widgets extends StatelessWidget {
  const Part056toPart132Widgets({
    super.key,
    required this.model,
    required this.allSumm,
    required this.c56,
    required this.nalogSumm058,
    required this.c59,
    required this.nalogSumm061,
    required this.c62,
    required this.nalogSumm064,
    required this.c66,
    required this.nalogSumm068,
    required this.nalogSumm065,
    required this.c69,
    required this.nalogSumm071,
    required this.nalogSumm072,
    required this.c73,
    required this.nalogSumm075,
    required this.c76,
    required this.nalogSumm078,
    required this.nalogSumm079,
    required this.c80,
    required this.nalogSumm082,
    required this.c83,
    required this.nalogSumm085,
    required this.nalogSumm086,
    required this.c130,
    required this.nalogSumm132,
    required this.percent081,
    required this.percent084,
  });
  final Map<String, dynamic> model;
  final Function allSumm;

  final TextEditingController c56;
  final ValueNotifier<num> nalogSumm058;

  final TextEditingController c59;
  final ValueNotifier<num> nalogSumm061;

  final TextEditingController c62;
  final ValueNotifier<num> nalogSumm064;

  final TextEditingController c66;
  final ValueNotifier<num> nalogSumm068;
  final ValueNotifier<num> nalogSumm065;

  final TextEditingController c69;
  final ValueNotifier<num> nalogSumm071;
  final ValueNotifier<num> nalogSumm072;

  final TextEditingController c73;
  final ValueNotifier<num> nalogSumm075;

  final TextEditingController c76;
  final ValueNotifier<num> nalogSumm078;
  final ValueNotifier<num> nalogSumm079;

  final TextEditingController c80;
  final ValueNotifier<num> nalogSumm082;

  final TextEditingController c83;
  final ValueNotifier<num?> percent081;
  final ValueNotifier<num?> percent084;
  final ValueNotifier<num> nalogSumm085;
  final ValueNotifier<num> nalogSumm086;

  final TextEditingController c130;
  final ValueNotifier<num> nalogSumm132;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'Б) Субъектом, не указанных в пункте А), оплаченных:',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        const SizedBox(height: 16),
        Text(
          'В наличной форме',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '056',
          controller: c56,
          numberPercent: '057',
          percent: model['sti057'],
          numberSumma: '058',
          nalogSumm: nalogSumm058,
          onChanged: (summa) {
            nalogSumm065.value =
                nalogSumm061.value + nalogSumm064.value + summa;
            ///////////
            allSumm();
          },
        ),
        Text(
          'В безналичной форме',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '059',
          controller: c59,
          numberPercent: '060',
          percent: model['sti060'],
          numberSumma: '061',
          nalogSumm: nalogSumm061,
          onChanged: (summa) {
            nalogSumm065.value =
                nalogSumm058.value + nalogSumm064.value + summa;
            ///////////
            allSumm();
          },
        ),
        Text(
          'В адрес обезличенного субъекта',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '062',
          controller: c62,
          numberPercent: '063',
          percent: model['sti063'],
          numberSumma: '064',
          nalogSumm: nalogSumm064,
          onChanged: (summa) {
            nalogSumm065.value =
                nalogSumm058.value + nalogSumm061.value + summa;
            ///////////
            allSumm();
          },
        ),
        const SizedBox(height: 16),
        const FieldNameWidget(
          number: '065',
          title: 'Итого сумма единого налога\n(=058+061+064)',
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: nalogSumm065,
          builder: (_, value, child) {
            return StaticContainerInfoWidget(
              title: value.toString(),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          'Переработка сельскохозяйственной продукции, производственная сфера, туроператорской деятельности, разработки программного обеспечения в области вычислительной техники, а также для турагентской деятельности, оплаченных:',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        const SizedBox(height: 16),
        Text(
          'В наличной форме',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '066',
          controller: c66,
          numberPercent: '067',
          percent: model['sti067'],
          numberSumma: '068',
          nalogSumm: nalogSumm068,
          onChanged: (summa) {
            nalogSumm072.value = nalogSumm071.value + summa;
            ///////////
            allSumm();
          },
        ),
        Text(
          'В безналичной форме',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '069',
          controller: c69,
          numberPercent: '070',
          percent: model['sti070'],
          numberSumma: '071',
          nalogSumm: nalogSumm071,
          onChanged: (summa) {
            nalogSumm072.value = nalogSumm068.value + summa;
            ///////////
            allSumm();
          },
        ),
        const SizedBox(height: 16),
        const FieldNameWidget(
          number: '072',
          title: 'Итого сумма единого налога\n(=068+071)',
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: nalogSumm072,
          builder: (_, value, child) {
            return StaticContainerInfoWidget(
              title: value.toString(),
            );
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Остальные виды деятельности,\nоплаченных:',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        const SizedBox(height: 16),
        Text(
          'В наличной форме',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '073',
          controller: c73,
          numberPercent: '074',
          percent: model['sti074'],
          numberSumma: '075',
          nalogSumm: nalogSumm075,
          onChanged: (summa) {
            nalogSumm079.value = nalogSumm078.value + summa;
            ///////////
            allSumm();
          },
        ),
        Text(
          'В безналичной форме',
          style: AppTextStyles.s20W500(),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '076',
          controller: c76,
          numberPercent: '077',
          percent: model['sti077'],
          numberSumma: '078',
          nalogSumm: nalogSumm078,
          onChanged: (summa) {
            nalogSumm079.value = nalogSumm075.value + summa;
            ///////////
            allSumm();
          },
        ),
        const FieldNameWidget(
            number: '079', title: 'Итого сумма единого налога\n(=075+078)'),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: nalogSumm079,
          builder: (_, value, child) {
            return StaticContainerInfoWidget(
              title: value.toString(),
            );
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Общественное питание, оплаченных:',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        const SizedBox(height: 16),
        Text(
          'В наличной форме',
          style: AppTextStyles.s20W500(),
        ),
        ValueListenableBuilder(
          valueListenable: percent081,
          builder: (_, percent081Val, child) {
            return CalculateNalogSummaWidget(
              numberFiled: '080',
              controller: c80,
              numberPercent: '081',
              percent: percent081Val,
              numberSumma: '082',
              nalogSumm: nalogSumm082,
              onChanged: (summa) {
                nalogSumm086.value = nalogSumm085.value + summa;
                ///////////
                allSumm();
              },
            );
          },
        ),
        Text(
          'В безналичной форме',
          style: AppTextStyles.s20W500(),
        ),
        ValueListenableBuilder(
          valueListenable: percent084,
          builder: (_, percent084Val, child) {
            return CalculateNalogSummaWidget(
              numberFiled: '083',
              controller: c83,
              numberPercent: '084',
              percent: percent084Val,
              numberSumma: '085',
              nalogSumm: nalogSumm085,
              onChanged: (summa) {
                nalogSumm086.value = nalogSumm082.value + summa;
                ///////////
                allSumm();
              },
            );
          },
        ),
        const FieldNameWidget(
            number: '086', title: 'Итого сумма единого налога\n(=082+085)'),
        const SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: nalogSumm086,
          builder: (_, value, child) {
            return StaticContainerInfoWidget(
              title: value.toString(),
            );
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Швейное и/или текстильное производство',
          style: AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
        ),
        CalculateNalogSummaWidget(
          numberFiled: '130',
          controller: c130,
          numberPercent: '131',
          percent: model['sti131'],
          numberSumma: '132',
          nalogSumm: nalogSumm132,
          onChanged: (summa) {
            ///////////
            allSumm();
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
