import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

@RoutePage()
class Screen9141 extends StatefulWidget {
  const Screen9141({super.key});

  @override
  State<Screen9141> createState() => _Screen9141State();
}

class _Screen9141State extends State<Screen9141> {
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
                    'Отчет по единому налогу для субъектов лотерейной деятельности и крупного предпринимательства, а также субъектов, применяющих режим, установленный статьей 324 НК КР (01.04.2023- месячный) - 091_4_1',
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
                          const Text(
                            'Наименование района',
                            style: AppTextStyles.s16w500,
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
                          const Text(
                            'Фактическое местонахождение',
                            style: AppTextStyles.s20w500,
                          ),
                          const SizedBox(height: 24),
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
                          const SizedBox(height: 24),
                          const Text('Налоговый период (201 - 202)',
                              style: AppTextStyles.s16w500),
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Дата с',
                                        style: AppTextStyles.s16w500),
                                    SizedBox(height: 12),
                                    CustomTextField(),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('по', style: AppTextStyles.s16w500),
                                    SizedBox(height: 12),
                                    CustomTextField()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'РАЗДЕЛ 2. ИНФОРМАЦИЯ О ЕДИНОМ НАЛОГЕ',
                            style: AppTextStyles.s20w500,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Торговая деятельность, осуществляемой:',
                            style: AppTextStyles.s16w500,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Б) Субъектом, не указанных в пункте А), оплаченных:',
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'В наличной форме',
                            style: AppTextStyles.s20w500,
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
                          const Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20w500,
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
                          const Text(
                            'В адрес обезличенного субъекта',
                            style: AppTextStyles.s20w500,
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'В наличной форме',
                            style: AppTextStyles.s20w500,
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
                          const Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20w500,
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'В наличной форме',
                            style: AppTextStyles.s20w500,
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
                          const Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20w500,
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
                            style: AppTextStyles.s16w500.copyWith(
                              color: const Color(0xff6B7583),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'В наличной форме',
                            style: AppTextStyles.s20w500,
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
                          const Text(
                            'В безналичной форме',
                            style: AppTextStyles.s20w500,
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
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
                            'Лотерейная деятельность',
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '133',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '134', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '8'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '135', title: 'Сумма налога'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 24),
                          Text(
                            'Сауна',
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
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
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
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
                          Text(
                            'Субъект, применяющего режим,\nустановленный статьей 324 налогового\nкодекса кыргызской республики',
                            style: AppTextStyles.s16w500
                                .copyWith(color: const Color(0xff6B7583)),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Стоимость товара',
                            style: AppTextStyles.s20w500,
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '151',
                              title:
                                  'Выручка от реализации товаров, работ, услуг'),
                          const SizedBox(height: 12),
                          const CustomTextField(),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '152', title: 'Ставка налога (%)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: '3'),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '153', title: 'Сумма налога'),
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
                      onPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EndPdfViewScreen(),
                        ),
                      ),
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
