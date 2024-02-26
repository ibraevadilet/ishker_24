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
class Screen914 extends StatefulWidget {
  const Screen914({super.key});

  @override
  State<Screen914> createState() => _Screen914State();
}

class _Screen914State extends State<Screen914> with TickerProviderStateMixin {
  static List<Tab> myTabs1 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs2 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs3 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs4 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs5 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs6 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs7 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs8 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs9 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
  static List<Tab> myTabs10 = <Tab>[
    const Tab(text: '1 месяц'),
    const Tab(text: '2 месяц'),
    const Tab(text: '3 месяц'),
  ];
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

  late TabController _1tabController;
  late TabController _2tabController;
  late TabController _3tabController;
  late TabController _4tabController;
  late TabController _5tabController;
  late TabController _6tabController;
  late TabController _7tabController;
  late TabController _8tabController;
  late TabController _9tabController;
  late TabController _10tabController;

  @override
  void initState() {
    super.initState();
    _1tabController = TabController(vsync: this, length: myTabs1.length);
    _2tabController = TabController(vsync: this, length: myTabs2.length);
    _3tabController = TabController(vsync: this, length: myTabs3.length);
    _4tabController = TabController(vsync: this, length: myTabs4.length);
    _5tabController = TabController(vsync: this, length: myTabs5.length);
    _6tabController = TabController(vsync: this, length: myTabs6.length);
    _7tabController = TabController(vsync: this, length: myTabs7.length);
    _8tabController = TabController(vsync: this, length: myTabs8.length);
    _9tabController = TabController(vsync: this, length: myTabs9.length);
    _10tabController = TabController(vsync: this, length: myTabs10.length);
  }

  @override
  void dispose() {
    _1tabController.dispose();
    super.dispose();
  }

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
                    'Отчет по единому налогу субъектов среднего предпринимательства(01.04.2023- квартальный) - 091_4',
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
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
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
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Дата с',
                                      style: AppTextStyles.s16W500(
                                          color: AppColors.color6B7583Grey),
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'по',
                                      style: AppTextStyles.s16W500(
                                          color: AppColors.color6B7583Grey),
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField()
                                  ],
                                ),
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
                            style: AppTextStyles.s16W500(
                                color: AppColors.color6B7583Grey),
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
                          Text('Остальные виды деятельности,\nоплаченных:',
                              style: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey)),
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
                    const SizedBox(height: 24),
                    Text(
                      'Приложение 1 (FORM\nSTI -091-001)',
                      style: AppTextStyles.s20W500(),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Торговая деятельность,\nосуществляемой',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs1,
                              controller: _1tabController,
                            ),
                          ),
                          SizedBox(
                            height: 2260,
                            child: TabBarView(
                              controller: _1tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'А) Субъектом, за исключением\nимпортера, экспортера,\nдистрибьютера и субъекта\nреализующего горючего-\nсмазочные материалы,\nлекарственные средства и\nмедицинские изделия',
                                            style: AppTextStyles.s16W500(
                                                color:
                                                    AppColors.color6B7583Grey),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      'До 30 000 000 сомов',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '160',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '161',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(
                                        title: '0,5'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '162', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'От 30 000 000 до 50 000 000\nсомов',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '163',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '164',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '1'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '165', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Б) Субъектом, не указанных\nв пункте «А»',
                                          style: AppTextStyles.s16W500(
                                              color: AppColors.color6B7583Grey),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '166',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '167',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '168', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '169',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '170',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '171', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В адрес обезличенного субъекта',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '172',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '173',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '174', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '175',
                                        title:
                                            'Итого сумма единого налога\n(162+165+168+171+174)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'А) Субъектом, за исключением\nимпортера, экспортера,\nдистрибьютера и субъекта\nреализующего горючего-\nсмазочные материалы,\nлекарственные средства и\nмедицинские изделия',
                                            style: AppTextStyles.s16W500(
                                                color:
                                                    AppColors.color6B7583Grey),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      'До 30 000 000 сомов',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '250',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '251',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(
                                        title: '0,5'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '252', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'От 30 000 000 до 50 000 000\nсомов',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '253',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '254',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '1'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '255', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Б) Субъектом, не указанных\nв пункте «А»',
                                          style: AppTextStyles.s16W500(
                                              color: AppColors.color6B7583Grey),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '256',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '257',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '258', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text('В безналичной форме',
                                        style: AppTextStyles.s20W500()),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '259',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '260',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '261', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В адрес обезличенного субъекта',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '262',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '263',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '264', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '265',
                                        title:
                                            'Итого сумма единого налога\n(252+255+258+261+264)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'А) Субъектом, за исключением\nимпортера, экспортера,\nдистрибьютера и субъекта\nреализующего горючего-\nсмазочные материалы,\nлекарственные средства и\nмедицинские изделия',
                                            style: AppTextStyles.s16W500(
                                                color:
                                                    AppColors.color6B7583Grey),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Text(
                                      'До 30 000 000 сомов',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '310',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '311',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(
                                        title: '0,5'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '312', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'От 30 000 000 до 50 000 000\nсомов',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '313',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '314',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '1'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '315', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Б) Субъектом, не указанных\nв пункте «А»',
                                          style: AppTextStyles.s16W500(
                                              color: AppColors.color6B7583Grey),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '316',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '317',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '318', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '319',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '320',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '321', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В адрес обезличенного субъекта',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '322',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '323',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '324', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '325',
                                        title:
                                            'Итого сумма единого налога\n(312+315+318+321+324)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Переработка\nсельскохозяйственной\nпродукции, производственная\nсфера, туроператорской\nдеятельности, разработки\nпрограммного обеспечения в\nобласти вычислительной\nтехники, а также для\nтурагентской деятельности,\nоплаченных:',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs2,
                              controller: _2tabController,
                            ),
                          ),
                          SizedBox(
                            height: 880,
                            child: TabBarView(
                              controller: _2tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '176',
                                        title:
                                            'Выручка от реализации товаров, работ,\nуслуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '177',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '178', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '179',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '180',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '181', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '182',
                                      title:
                                          'Итого сумма единого налога (178+181)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '266',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '267',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '268', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '269',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '270',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '271', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '272',
                                      title:
                                          'Итого сумма единого налога (268+271)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '326',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '327',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '328', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '329',
                                        title:
                                            'Выручка от реализации товаров, работ,\nуслуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '330',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '331', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '332',
                                      title:
                                          'Итого сумма единого налога (328+331)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Остальные виды деятельности',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs3,
                              controller: _3tabController,
                            ),
                          ),
                          SizedBox(
                            height: 880,
                            child: TabBarView(
                              controller: _3tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '183',
                                        title:
                                            'Выручка от реализации товаров, работ,\nуслуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '184',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '185', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '186',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '187',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '188', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '189',
                                      title:
                                          'Итого сумма единого налога (185+188)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '273',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '274',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '275', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '276',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '277',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '278', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '279',
                                      title:
                                          'Итого сумма единого налога (275+278)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '333',
                                        title:
                                            'Выручка от реализации товаров, работ, услуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '334',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '335', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '336',
                                        title:
                                            'Выручка от реализации товаров, работ,\nуслуг'),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '337',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '338', title: 'Сумма налога'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '339',
                                      title:
                                          'Итого сумма единого налога (335+338)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Общественное питание',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs4,
                              controller: _4tabController,
                            ),
                          ),
                          SizedBox(
                            height: 880,
                            child: TabBarView(
                              controller: _4tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '190',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '191',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '192',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '193',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '194',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '195',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '196',
                                      title:
                                          'Итого сумма единого налога (192+195)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '280',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '281',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '282',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '283',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                        number: '284',
                                        title: 'Ставка налога (%)'),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '285',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '286',
                                      title:
                                          'Итого сумма единого налога (282+285)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '340',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '341',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '342',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    Text(
                                      'В безналичной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '343',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '344',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '2'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '345',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '346',
                                      title:
                                          'Итого сумма единого налога (342+345)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Швейное и/или текстильное\nпроизводство',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs5,
                              controller: _5tabController,
                            ),
                          ),
                          SizedBox(
                            height: 376,
                            child: TabBarView(
                              controller: _5tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '197',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '198',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '199',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '287',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '288',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '289',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '347',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '348',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '349',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Сауна',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs6,
                              controller: _6tabController,
                            ),
                          ),
                          SizedBox(
                            height: 376,
                            child: TabBarView(
                              controller: _6tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '200',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '201',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '202',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '290',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '291',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '292',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '350',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '351',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '352',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Бильярд',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs7,
                              controller: _7tabController,
                            ),
                          ),
                          SizedBox(
                            height: 376,
                            child: TabBarView(
                              controller: _7tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '203',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '204',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '205',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '293',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '294',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '295',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '353',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '354',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '355',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Баня, за исключением\nмуниципиальных бань',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs8,
                              controller: _8tabController,
                            ),
                          ),
                          SizedBox(
                            height: 376,
                            child: TabBarView(
                              controller: _8tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '206',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '207',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '208',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '296',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '297',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '298',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '356',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '357',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '358',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Резидент парка креативной\nиндустрии',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs9,
                              controller: _9tabController,
                            ),
                          ),
                          SizedBox(
                            height: 376,
                            child: TabBarView(
                              controller: _9tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '209',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '210',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '211',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '299',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '300',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '301',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '359',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '360',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '361',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Торговая деятельность на\nрынках и мини рынках\n(определенных кабинетом\nминистров кыргызской республики)',
                          style: AppTextStyles.s16W500(
                              color: AppColors.color6B7583Grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.colorF3F4F5Grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              labelStyle: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: AppColors.color32D681Green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              indicatorColor: AppColors.color32D681Green,
                              labelColor: Colors.white,
                              dividerHeight: 0,
                              tabs: myTabs10,
                              controller: _10tabController,
                            ),
                          ),
                          SizedBox(
                            height: 376,
                            child: TabBarView(
                              controller: _10tabController,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '212',
                                      title:
                                          'Выручка от реализации товаров, работ,\nуслуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '213',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '214',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '302',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '303',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '304',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      'В наличной форме',
                                      style: AppTextStyles.s20W500(),
                                    ),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '362',
                                      title:
                                          'Выручка от реализации товаров, работ, услуг',
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTextField(),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '363',
                                      title: 'Ставка налога (%)',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: '4'),
                                    const SizedBox(height: 16),
                                    const FieldNameWidget(
                                      number: '364',
                                      title: 'Сумма налога',
                                    ),
                                    const SizedBox(height: 12),
                                    const StaticContainerInfoWidget(title: ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '215',
                              title:
                                  'Общая сумма единого налога\n(175+182+189+196+199+202+205+208+\n211+214)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '305',
                              title:
                                  'Общая сумма единого налога\n(265+272+279+286+289+292+295+298\n+301+304)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
                          const FieldNameWidget(
                              number: '365',
                              title:
                                  'Общая сумма единого налога\n(325+332+339+346+349+352+355\n+358+361+364)'),
                          const SizedBox(height: 12),
                          const StaticContainerInfoWidget(title: ''),
                          const SizedBox(height: 16),
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
