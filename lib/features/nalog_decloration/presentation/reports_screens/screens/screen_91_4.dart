import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/ugns_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/calculate_nalog_summa_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/custom_text_field.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part050_part055_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part056_part132_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part136_part150_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part1_of_nalog_screen_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/provider_scaffold_background_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_dates_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/static_container_info_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class Screen914 extends StatefulWidget {
  const Screen914({super.key, required this.model});
  final NalogNameModel model;

  @override
  State<Screen914> createState() => _Screen914State();
}

class _Screen914State extends State<Screen914> with TickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ///////////////////
  ///PART 1/////
  int selectedDocType001 = 0;
  ValueNotifier<int?> selectedUgnsIndex104 = ValueNotifier(null);
  ValueNotifier<bool> isUgnsSelected = ValueNotifier(false);
  List<UgnsModel> ugnsModels = [];
  TextEditingController c115 = TextEditingController();
  TextEditingController c116 = TextEditingController();
  TextEditingController c108 = TextEditingController();

  ///////////////////
  ///PART 2/////

  ValueNotifier<int?> selectedKvartalIndex = ValueNotifier(null);
  ValueNotifier<bool> kvartalSelected = ValueNotifier(false);
  ValueNotifier<int?> selectedYear = ValueNotifier(null);
  ValueNotifier<bool> isYearSelected = ValueNotifier(false);
  String startdate = '';
  String enddate = '';

  TextEditingController c50 = TextEditingController();
  ValueNotifier<num> nalogSumm052 = ValueNotifier(0);

  TextEditingController c53 = TextEditingController();
  ValueNotifier<num> nalogSumm055 = ValueNotifier(0);

  TextEditingController c56 = TextEditingController();
  ValueNotifier<num> nalogSumm058 = ValueNotifier(0);

  TextEditingController c59 = TextEditingController();
  ValueNotifier<num> nalogSumm061 = ValueNotifier(0);

  TextEditingController c62 = TextEditingController();
  ValueNotifier<num> nalogSumm064 = ValueNotifier(0);

  TextEditingController c66 = TextEditingController();
  ValueNotifier<num> nalogSumm068 = ValueNotifier(0);
  ValueNotifier<num> nalogSumm065 = ValueNotifier(0);

  TextEditingController c69 = TextEditingController();
  ValueNotifier<num> nalogSumm071 = ValueNotifier(0);
  ValueNotifier<num> nalogSumm072 = ValueNotifier(0);

  TextEditingController c73 = TextEditingController();
  ValueNotifier<num> nalogSumm075 = ValueNotifier(0);

  TextEditingController c76 = TextEditingController();
  ValueNotifier<num> nalogSumm078 = ValueNotifier(0);
  ValueNotifier<num> nalogSumm079 = ValueNotifier(0);

  TextEditingController c80 = TextEditingController();
  ValueNotifier<num> nalogSumm082 = ValueNotifier(0);

  TextEditingController c83 = TextEditingController();
  ValueNotifier<num> nalogSumm085 = ValueNotifier(0);
  ValueNotifier<num> nalogSumm086 = ValueNotifier(0);

  TextEditingController c130 = TextEditingController();
  ValueNotifier<num> nalogSumm132 = ValueNotifier(0);

  TextEditingController c136 = TextEditingController();
  ValueNotifier<num> nalogSumm138 = ValueNotifier(0);

  TextEditingController c139 = TextEditingController();
  ValueNotifier<num> nalogSumm141 = ValueNotifier(0);

  TextEditingController c142 = TextEditingController();
  ValueNotifier<num> nalogSumm144 = ValueNotifier(0);

  TextEditingController c145 = TextEditingController();
  ValueNotifier<num> nalogSumm147 = ValueNotifier(0);

  TextEditingController c148 = TextEditingController();
  ValueNotifier<num> nalogSumm150 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm154 = ValueNotifier(0);

  ///////FROM 1
  TextEditingController c160 = TextEditingController();
  ValueNotifier<num> nalogSumm162 = ValueNotifier(0);

  TextEditingController c163 = TextEditingController();
  ValueNotifier<num> nalogSumm165 = ValueNotifier(0);

  TextEditingController c166 = TextEditingController();
  ValueNotifier<num> nalogSumm168 = ValueNotifier(0);

  TextEditingController c169 = TextEditingController();
  ValueNotifier<num> nalogSumm171 = ValueNotifier(0);

  TextEditingController c172 = TextEditingController();
  ValueNotifier<num> nalogSumm174 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm175 = ValueNotifier(0);

  void allSumm() {
    nalogSumm154.value = nalogSumm052.value +
        nalogSumm055.value +
        nalogSumm065.value +
        nalogSumm072.value +
        nalogSumm079.value +
        nalogSumm086.value +
        nalogSumm132.value +
        nalogSumm138.value +
        nalogSumm141.value +
        nalogSumm144.value +
        nalogSumm147.value +
        nalogSumm150.value;
  }

  GlobalKey ugnsKey = GlobalKey();
  GlobalKey dateKey = GlobalKey();
  GlobalKey numbersKey = GlobalKey();

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
    return AppUnfocuser(
      child: ProviderScaffoldBackgroundWidgets(
          model: widget.model,
          builder: (model) {
            ugnsModels = model['sti104']
                .map<UgnsModel>((e) => UgnsModel.fromJson(e))
                .toList();
            c115.text = model['sti115'];
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Part1OfNalogScreenWidget(
                    numbersKey: numbersKey,
                    ungKey: ugnsKey,
                    model: model,
                    selectedUgnsIndex104: selectedUgnsIndex104,
                    isUgnsSelected: isUgnsSelected,
                    ugnsModels: ugnsModels,
                    c115: c115,
                    c116: c116,
                    c108: c108,
                    onSelectedDocument: (val) {
                      selectedDocType001 = val;
                    },
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
                        SelectDatesWidget(
                          key: dateKey,
                          selectedKvartalIndex: selectedKvartalIndex,
                          kvartalSelected: kvartalSelected,
                          selectedYear: selectedYear,
                          isYearSelected: isYearSelected,
                          onDaySelected: (startdateFrom, enddateFrom) {
                            startdate = startdateFrom;
                            enddate = enddateFrom;
                          },
                        ),
                        Text(
                          'РАЗДЕЛ 2. ИНФОРМАЦИЯ О ЕДИНОМ НАЛОГЕ',
                          style: AppTextStyles.s20W500(),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Торговая деятельность, осуществляемой:',
                          style: AppTextStyles.s16W500(),
                        ),
                        Part050toPart055Widgets(
                          model: model,
                          allSumm: allSumm,
                          c50: c50,
                          nalogSumm052: nalogSumm052,
                          c53: c53,
                          nalogSumm055: nalogSumm055,
                        ),
                        Part056toPart132Widgets(
                          model: model,
                          allSumm: allSumm,
                          c56: c56,
                          nalogSumm058: nalogSumm058,
                          c59: c59,
                          nalogSumm061: nalogSumm061,
                          c62: c62,
                          nalogSumm064: nalogSumm064,
                          c66: c66,
                          nalogSumm068: nalogSumm068,
                          nalogSumm065: nalogSumm065,
                          c69: c69,
                          nalogSumm071: nalogSumm071,
                          nalogSumm072: nalogSumm072,
                          c73: c73,
                          nalogSumm075: nalogSumm075,
                          c76: c76,
                          nalogSumm078: nalogSumm078,
                          nalogSumm079: nalogSumm079,
                          c80: c80,
                          nalogSumm082: nalogSumm082,
                          c83: c83,
                          nalogSumm085: nalogSumm085,
                          nalogSumm086: nalogSumm086,
                          c130: c130,
                          nalogSumm132: nalogSumm132,
                        ),
                        Part136toPart150Widgets(
                          model: model,
                          allSumm: allSumm,
                          c136: c136,
                          nalogSumm138: nalogSumm138,
                          c139: c139,
                          nalogSumm141: nalogSumm141,
                          c142: c142,
                          nalogSumm144: nalogSumm144,
                          c145: c145,
                          nalogSumm147: nalogSumm147,
                          c148: c148,
                          nalogSumm150: nalogSumm150,
                        ),
                        const FieldNameWidget(
                          number: '154',
                          title:
                              'Общая сумма единого налога\n(=052+055+065+072+079+086+132+\n135+138+141+144+147+150+153)',
                        ),
                        const SizedBox(height: 12),
                        ValueListenableBuilder(
                          valueListenable: nalogSumm154,
                          builder: (_, value, child) {
                            return StaticContainerInfoWidget(
                              title: value.toString(),
                            );
                          },
                        ),
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
                          height: 2360,
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
                                              color: AppColors.color6B7583Grey),
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
                                  CalculateNalogSummaWidget(
                                    numberFiled: '160',
                                    controller: c160,
                                    numberPercent: '161',
                                    percent: model['sti161'],
                                    numberSumma: '162',
                                    nalogSumm: nalogSumm162,
                                    onChanged: (summa) {
                                      nalogSumm175.value = nalogSumm162.value +
                                          nalogSumm165.value +
                                          nalogSumm168.value +
                                          nalogSumm171.value +
                                          nalogSumm174.value;
                                    },
                                  ),
                                  Text(
                                    'От 30 000 000 до 50 000 000\nсомов',
                                    style: AppTextStyles.s20W500(),
                                  ),
                                  CalculateNalogSummaWidget(
                                    numberFiled: '163',
                                    controller: c163,
                                    numberPercent: '164',
                                    percent: model['sti164'],
                                    numberSumma: '165',
                                    nalogSumm: nalogSumm165,
                                    onChanged: (summa) {
                                      nalogSumm175.value = nalogSumm162.value +
                                          nalogSumm165.value +
                                          nalogSumm168.value +
                                          nalogSumm171.value +
                                          nalogSumm174.value;
                                    },
                                  ),
                                  const SizedBox(height: 8),
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
                                  CalculateNalogSummaWidget(
                                    numberFiled: '166',
                                    controller: c166,
                                    numberPercent: '167',
                                    percent: model['sti167'],
                                    numberSumma: '168',
                                    nalogSumm: nalogSumm168,
                                    onChanged: (summa) {
                                      nalogSumm175.value = nalogSumm162.value +
                                          nalogSumm165.value +
                                          nalogSumm168.value +
                                          nalogSumm171.value +
                                          nalogSumm174.value;
                                    },
                                  ),
                                  Text(
                                    'В безналичной форме',
                                    style: AppTextStyles.s20W500(),
                                  ),
                                  CalculateNalogSummaWidget(
                                    numberFiled: '169',
                                    controller: c169,
                                    numberPercent: '170',
                                    percent: model['sti170'],
                                    numberSumma: '171',
                                    nalogSumm: nalogSumm171,
                                    onChanged: (summa) {
                                      nalogSumm175.value = nalogSumm162.value +
                                          nalogSumm165.value +
                                          nalogSumm168.value +
                                          nalogSumm171.value +
                                          nalogSumm174.value;
                                    },
                                  ),
                                  Text(
                                    'В адрес обезличенного субъекта',
                                    style: AppTextStyles.s20W500(),
                                  ),
                                  CalculateNalogSummaWidget(
                                    numberFiled: '172',
                                    controller: c172,
                                    numberPercent: '173',
                                    percent: model['sti173'],
                                    numberSumma: '174',
                                    nalogSumm: nalogSumm174,
                                    onChanged: (summa) {
                                      nalogSumm175.value = nalogSumm162.value +
                                          nalogSumm165.value +
                                          nalogSumm168.value +
                                          nalogSumm171.value +
                                          nalogSumm174.value;
                                    },
                                  ),
                                  const FieldNameWidget(
                                      number: '175',
                                      title:
                                          'Итого сумма единого налога\n(162+165+168+171+174)'),
                                  const SizedBox(height: 12),
                                  ValueListenableBuilder(
                                    valueListenable: nalogSumm175,
                                    builder: (_, value, child) {
                                      return StaticContainerInfoWidget(
                                        title: value.toString(),
                                      );
                                    },
                                  ),
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
                                              color: AppColors.color6B7583Grey),
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
                                  const StaticContainerInfoWidget(title: '0,5'),
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
                                              color: AppColors.color6B7583Grey),
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
                                  const StaticContainerInfoWidget(title: '0,5'),
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
            );
          }),
    );
  }
}
