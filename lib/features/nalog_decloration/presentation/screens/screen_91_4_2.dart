import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/custom_radio_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/custom_text_field.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/expanded_list_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/select_bottom_sheet_container.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/components/static_container_info_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class Screen9142 extends StatefulWidget {
  const Screen9142({super.key});

  @override
  State<Screen9142> createState() => _Screen9142State();
}

class _Screen9142State extends State<Screen9142> {
  int? selectedKvartalIndex;
  String groupValue = 'first';
  List<String> kvartals = [
    '1 квартал',
    '2 квартал',
    '3 квартал',
    '4 квартал',
  ];
  List<String> ugns = [
    '001 Октябрьский р-н',
    '002 Ленинский р-н',
    '003 Свердловский р-н',
    '004 Первомайский р-н',
  ];

  int selectedYear = 2024;

  List<int> years = List.generate(10, (index) => 2014 + index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Отчет по единому налогу для субъектов малого предпринимательства (01.04.2023- квартальный)» - 091_4_2',
                    style: AppTextStyles.s18W500(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FieldNameWidget(
                              number: '001', title: 'Тип документа'),
                          const SizedBox(height: 13),
                          CustomRadioWidget(
                            value: 'first',
                            groupValue: groupValue,
                            title: 'Первоначальный',
                            onChanged: (val) {
                              setState(() {
                                groupValue = val!;
                              });
                            },
                          ),
                          CustomRadioWidget(
                            value: 'second',
                            groupValue: groupValue,
                            title: 'Уточненный',
                            onChanged: (val) {
                              setState(() {
                                groupValue = val!;
                              });
                            },
                          ),
                          CustomRadioWidget(
                            value: 'third',
                            groupValue: groupValue,
                            title: 'Ликвидационный',
                            onChanged: (val) {
                              setState(() {
                                groupValue = val!;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(number: '102', title: 'ИНН'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(
                              title: '10608199601011'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '103', title: 'Наименование плательщика'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(
                              title: 'Олегов Олег Олегович'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '104', title: 'Код УГНС'),
                          const SizedBox(height: 12),
                          ExpandedList(
                            color: AppColors.colorF3F4F5Grey,
                            title: 'Выберите',
                            selectedIndex: selectedKvartalIndex,
                            onSelected: (int index) {
                              setState(() {
                                selectedKvartalIndex = index;
                              });
                            },
                            items: ugns,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Наименование района',
                            style: AppTextStyles.s16W500(),
                          ),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(
                              title: 'Базаркоргонский р-н'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '106', title: 'Серия и № Паспорта'),
                          const SizedBox(height: 12),
                          const CustomTextField(
                            hintText: 'ID1234567',
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '107', title: 'Страна выдачи'),
                          const SizedBox(height: 12),
                          const CustomTextField(hintText: 'KGZ'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '115', title: 'Телефон (Дом./Раб.)'),
                          const SizedBox(height: 12),
                          const CustomTextField(
                            hintText: '0555 555 555',
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '116', title: 'Адрес электронной почты'),
                          const SizedBox(height: 12),
                          const CustomTextField(
                            hintText: 'example@gmail.com',
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '108', title: 'Почтовый индекс'),
                          const SizedBox(height: 12),
                          const CustomTextField(
                            hintText: '720000',
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '110',
                              title: 'Область, Город/Область, Район, Село'),
                          const SizedBox(height: 12),
                          const CustomTextField(
                            maxLines: 2,
                            hintText:
                                'Кыргызская Республика,\nДжалал-Абадская обл.',
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '111',
                              title: 'Улица/микрорайон, и Номер Дома/Квартиры'),
                          const SizedBox(height: 12),
                          const CustomTextField(
                            maxLines: 2,
                            hintText:
                                'г. Джалал-Абад, Спутник, переулок Тихий, дом 31а',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Налоговый период (201 - 202)',
                            style: AppTextStyles.s14W600(),
                          ),
                          const SizedBox(height: 12),
                          ExpandedList(
                            color: AppColors.colorF3F4F5Grey,
                            title: 'Выберите квартал',
                            selectedIndex: selectedKvartalIndex,
                            onSelected: (int index) {
                              setState(() {
                                selectedKvartalIndex = index;
                              });
                            },
                            items: kvartals,
                          ),
                          const SizedBox(height: 12),
                          const SelectBottomSheetContainer(),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Дата с',
                                      style: AppTextStyles.s16W500()),
                                  const SizedBox(height: 12),
                                  Container(
                                    height: 47,
                                    width: 140,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.colorF3F4F5Grey,
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'РАЗДЕЛ 2. ИНФОРМАЦИЯ О ЕДИНОМ НАЛОГЕ',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Торговая деятельность, осуществляемой:',
                            style: AppTextStyles.s16W500(),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'А) Субъектом, за исключением импортера, экспортера, дистрибьютера и субъекта реализующего горючего-смазочные материалы, лекарственные средства и медицинские изделия',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'До 30 000 000 сомов',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '050',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '051', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '0,5'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '052', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          Text(
                            'От 30 000 000 до 50 000 000\nсомов',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '053',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '054', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '1'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '055', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Б) Субъектом, не указанных в пункте А), оплаченных:',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'В наличной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '056',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '057', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '4'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '058', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '059',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '060', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '2'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '061', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          Text(
                            'В адрес обезличенного субъекта',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '062',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '063', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '4'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '064', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '065',
                              title:
                                  'Итого сумма единого налога\n(=058+061+064)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Переработка сельскохозяйственной продукции, производственная сфера, туроператорской деятельности, разработки программного обеспечения в области вычислительной техники, а также для турагентской деятельности, оплаченных:',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'В наличной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '066',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '067', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '4'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '068', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '069',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '070', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '2'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '071', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '072',
                              title: 'Итого сумма единого налога\n(=068+071)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Остальные виды деятельности,\nоплаченных:',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'В наличной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '073',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '074', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '6'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '075', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '076',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '077', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '4'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '078', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '079',
                              title: 'Итого сумма единого налога\n(=075+078)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Общественное питание, оплаченных:',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'В наличной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '080',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '081', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '4'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '082', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20W500(),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '083',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '084', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '2'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '085', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '086',
                              title: 'Итого сумма единого налога\n(=082+085)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Швейное и/или текстильное производство',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '130',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '131', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '0,25'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '132', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Сауна',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '136',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '137', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '8'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '138', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Бильярд',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '139',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '140', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '8'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '141', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Баня, за исключением муниципиальных\nбань',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '142',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '143', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '8'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '144', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Резидент парка креативной индустрии',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '145',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '146', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '0,5'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '147', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Торговая деятельность на рынках и мини рынках (определенных кабинетом министров кыргызской республики)',
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '148',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '149', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '0,1'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '150', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          const FieldNameWidget(
                              number: '154',
                              title:
                                  'Общая сумма единого налога\n(=052+055+065+072+079+086+132+\n135+138+141+144+147+150+153)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    CustomButton(
                      onPress: () {},
                      text: 'Отправить в ГНС',
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Назад',
                      textColor: AppColors.color32D681Green,
                      borderColor: AppColors.color32D681Green,
                      color: Colors.transparent,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onPress: () {},
                      text: 'Предпросмотр',
                      textColor: AppColors.color32D681Green,
                      borderColor: AppColors.color32D681Green,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}