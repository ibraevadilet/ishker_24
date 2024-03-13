import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/functions/un_focuser_func.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/ugns_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/calculate_nalog_summa_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part050_part055_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part056_part132_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part136_part150_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part1_of_nalog_screen_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/provider_scaffold_background_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_dates_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/static_container_info_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/generate_pdf_review_cubit/generate_pdf_review_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

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
  ValueNotifier<bool> isDocType3 = ValueNotifier(false);

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
  final int nowYear = DateTime.now().year;
  late ValueNotifier<int?> selectedYear = ValueNotifier(nowYear);
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

  ///////FROM 1 1 MONTH
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

  TextEditingController c176 = TextEditingController();
  ValueNotifier<num> nalogSumm178 = ValueNotifier(0);

  TextEditingController c179 = TextEditingController();
  ValueNotifier<num> nalogSumm181 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm182 = ValueNotifier(0);

  TextEditingController c183 = TextEditingController();
  ValueNotifier<num> nalogSumm185 = ValueNotifier(0);

  TextEditingController c186 = TextEditingController();
  ValueNotifier<num> nalogSumm188 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm189 = ValueNotifier(0);

  TextEditingController c190 = TextEditingController();
  ValueNotifier<num> nalogSumm192 = ValueNotifier(0);

  TextEditingController c193 = TextEditingController();
  ValueNotifier<num> nalogSumm195 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm196 = ValueNotifier(0);

  TextEditingController c197 = TextEditingController();
  ValueNotifier<num> nalogSumm199 = ValueNotifier(0);

  TextEditingController c200 = TextEditingController();
  ValueNotifier<num> nalogSumm202 = ValueNotifier(0);

  TextEditingController c203 = TextEditingController();
  ValueNotifier<num> nalogSumm205 = ValueNotifier(0);

  TextEditingController c206 = TextEditingController();
  ValueNotifier<num> nalogSumm208 = ValueNotifier(0);

  TextEditingController c209 = TextEditingController();
  ValueNotifier<num> nalogSumm211 = ValueNotifier(0);

  TextEditingController c212 = TextEditingController();
  ValueNotifier<num> nalogSumm214 = ValueNotifier(0);

////////Form 1 2 Month
  TextEditingController c250 = TextEditingController();
  ValueNotifier<num> nalogSumm252 = ValueNotifier(0);

  TextEditingController c253 = TextEditingController();
  ValueNotifier<num> nalogSumm255 = ValueNotifier(0);

  TextEditingController c256 = TextEditingController();
  ValueNotifier<num> nalogSumm258 = ValueNotifier(0);

  TextEditingController c259 = TextEditingController();
  ValueNotifier<num> nalogSumm261 = ValueNotifier(0);

  TextEditingController c262 = TextEditingController();
  ValueNotifier<num> nalogSumm264 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm265 = ValueNotifier(0);

  TextEditingController c266 = TextEditingController();
  ValueNotifier<num> nalogSumm268 = ValueNotifier(0);

  TextEditingController c269 = TextEditingController();
  ValueNotifier<num> nalogSumm271 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm272 = ValueNotifier(0);

  TextEditingController c273 = TextEditingController();
  ValueNotifier<num> nalogSumm275 = ValueNotifier(0);

  TextEditingController c276 = TextEditingController();
  ValueNotifier<num> nalogSumm278 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm279 = ValueNotifier(0);

  TextEditingController c280 = TextEditingController();
  ValueNotifier<num> nalogSumm282 = ValueNotifier(0);

  TextEditingController c283 = TextEditingController();
  ValueNotifier<num> nalogSumm285 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm286 = ValueNotifier(0);

  TextEditingController c287 = TextEditingController();
  ValueNotifier<num> nalogSumm289 = ValueNotifier(0);

  TextEditingController c290 = TextEditingController();
  ValueNotifier<num> nalogSumm292 = ValueNotifier(0);

  TextEditingController c293 = TextEditingController();
  ValueNotifier<num> nalogSumm295 = ValueNotifier(0);

  TextEditingController c296 = TextEditingController();
  ValueNotifier<num> nalogSumm298 = ValueNotifier(0);

  TextEditingController c299 = TextEditingController();
  ValueNotifier<num> nalogSumm301 = ValueNotifier(0);

  TextEditingController c302 = TextEditingController();
  ValueNotifier<num> nalogSumm304 = ValueNotifier(0);

  ///Form 1 3 MONTH
  TextEditingController c310 = TextEditingController();
  ValueNotifier<num> nalogSumm312 = ValueNotifier(0);

  TextEditingController c313 = TextEditingController();
  ValueNotifier<num> nalogSumm315 = ValueNotifier(0);

  TextEditingController c316 = TextEditingController();
  ValueNotifier<num> nalogSumm318 = ValueNotifier(0);

  TextEditingController c319 = TextEditingController();
  ValueNotifier<num> nalogSumm321 = ValueNotifier(0);

  TextEditingController c322 = TextEditingController();
  ValueNotifier<num> nalogSumm324 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm325 = ValueNotifier(0);

  TextEditingController c326 = TextEditingController();
  ValueNotifier<num> nalogSumm328 = ValueNotifier(0);

  TextEditingController c329 = TextEditingController();
  ValueNotifier<num> nalogSumm331 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm332 = ValueNotifier(0);

  TextEditingController c333 = TextEditingController();
  ValueNotifier<num> nalogSumm335 = ValueNotifier(0);

  TextEditingController c336 = TextEditingController();
  ValueNotifier<num> nalogSumm338 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm339 = ValueNotifier(0);

  TextEditingController c340 = TextEditingController();
  ValueNotifier<num> nalogSumm342 = ValueNotifier(0);

  TextEditingController c343 = TextEditingController();
  ValueNotifier<num> nalogSumm345 = ValueNotifier(0);

  ValueNotifier<num> nalogSumm346 = ValueNotifier(0);

  TextEditingController c347 = TextEditingController();
  ValueNotifier<num> nalogSumm349 = ValueNotifier(0);

  TextEditingController c350 = TextEditingController();
  ValueNotifier<num> nalogSumm352 = ValueNotifier(0);

  TextEditingController c353 = TextEditingController();
  ValueNotifier<num> nalogSumm355 = ValueNotifier(0);

  TextEditingController c356 = TextEditingController();
  ValueNotifier<num> nalogSumm358 = ValueNotifier(0);

  TextEditingController c359 = TextEditingController();
  ValueNotifier<num> nalogSumm361 = ValueNotifier(0);

  TextEditingController c362 = TextEditingController();
  ValueNotifier<num> nalogSumm364 = ValueNotifier(0);

  // 1месяц allsumm215
  ValueNotifier<num> nalogSumm215 = ValueNotifier(0);

  // 2месяц allsumm305
  ValueNotifier<num> nalogSumm305 = ValueNotifier(0);

  // 3месяц allsumm365
  ValueNotifier<num> nalogSumm365 = ValueNotifier(0);

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

  void allSumm215() {
    nalogSumm215.value = nalogSumm175.value +
        nalogSumm182.value +
        nalogSumm189.value +
        nalogSumm196.value +
        nalogSumm199.value +
        nalogSumm202.value +
        nalogSumm205.value +
        nalogSumm208.value +
        nalogSumm211.value +
        nalogSumm214.value;
  }

  void allSumm305() {
    nalogSumm305.value = nalogSumm265.value +
        nalogSumm272.value +
        nalogSumm279.value +
        nalogSumm286.value +
        nalogSumm289.value +
        nalogSumm292.value +
        nalogSumm295.value +
        nalogSumm298.value +
        nalogSumm301.value +
        nalogSumm304.value;
  }

  void allSumm365() {
    nalogSumm365.value = nalogSumm325.value +
        nalogSumm332.value +
        nalogSumm339.value +
        nalogSumm346.value +
        nalogSumm349.value +
        nalogSumm352.value +
        nalogSumm355.value +
        nalogSumm358.value +
        nalogSumm361.value +
        nalogSumm364.value;
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
          if (model['sti115'].isNotEmpty) {
            c115.text = model['sti115'];
          }
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
                    isDocType3.value = val == 3;

                    if (val == 3) {
                      final int nowMonth = DateTime.now().month;
                      int kvartalIndex = 0;
                      if (nowMonth <= 3) {
                        kvartalIndex = 0;
                      } else if (nowMonth <= 6) {
                        kvartalIndex = 1;
                      } else if (nowMonth <= 9) {
                        kvartalIndex = 2;
                      } else if (nowMonth <= 12) {
                        kvartalIndex = 3;
                      }

                      selectedKvartalIndex.value = kvartalIndex;
                      selectedYear.value = DateTime.now().year;
                    }
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        isDocType3: isDocType3,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                                    int c160Data = int.tryParse(c160.text) ?? 0;
                                    int c250Data = int.tryParse(c250.text) ?? 0;
                                    int c310Data = int.tryParse(c310.text) ?? 0;
                                    int o50 = c160Data + c250Data + c310Data;
                                    c50.text = o50.toString();
                                    setState(() {});
                                    nalogSumm175.value = nalogSumm162.value +
                                        nalogSumm165.value +
                                        nalogSumm168.value +
                                        nalogSumm171.value +
                                        nalogSumm174.value;
                                    allSumm215();
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
                                    allSumm215();
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
                                    allSumm215();
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
                                    allSumm215();
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
                                    allSumm215();
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '250',
                                  controller: c250,
                                  numberPercent: '251',
                                  percent: model['sti251'],
                                  numberSumma: '252',
                                  nalogSumm: nalogSumm252,
                                  onChanged: (summa) {
                                    nalogSumm265.value = nalogSumm252.value +
                                        nalogSumm255.value +
                                        nalogSumm258.value +
                                        nalogSumm261.value +
                                        nalogSumm264.value;
                                    allSumm305();
                                  },
                                ),
                                Text(
                                  'От 30 000 000 до 50 000 000\nсомов',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '253',
                                  controller: c253,
                                  numberPercent: '254',
                                  percent: model['sti254'],
                                  numberSumma: '255',
                                  nalogSumm: nalogSumm255,
                                  onChanged: (summa) {
                                    nalogSumm265.value = nalogSumm252.value +
                                        nalogSumm255.value +
                                        nalogSumm258.value +
                                        nalogSumm261.value +
                                        nalogSumm264.value;
                                    allSumm305();
                                  },
                                ),
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
                                  numberFiled: '256',
                                  controller: c256,
                                  numberPercent: '257',
                                  percent: model['sti257'],
                                  numberSumma: '258',
                                  nalogSumm: nalogSumm258,
                                  onChanged: (summa) {
                                    nalogSumm265.value = nalogSumm252.value +
                                        nalogSumm255.value +
                                        nalogSumm258.value +
                                        nalogSumm261.value +
                                        nalogSumm264.value;
                                    allSumm305();
                                  },
                                ),
                                Text('В безналичной форме',
                                    style: AppTextStyles.s20W500()),
                                CalculateNalogSummaWidget(
                                  numberFiled: '259',
                                  controller: c259,
                                  numberPercent: '260',
                                  percent: model['sti260'],
                                  numberSumma: '261',
                                  nalogSumm: nalogSumm261,
                                  onChanged: (summa) {
                                    nalogSumm265.value = nalogSumm252.value +
                                        nalogSumm255.value +
                                        nalogSumm258.value +
                                        nalogSumm261.value +
                                        nalogSumm264.value;
                                    allSumm305();
                                  },
                                ),
                                Text(
                                  'В адрес обезличенного субъекта',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '262',
                                  controller: c262,
                                  numberPercent: '263',
                                  percent: model['sti263'],
                                  numberSumma: '264',
                                  nalogSumm: nalogSumm264,
                                  onChanged: (summa) {
                                    nalogSumm265.value = nalogSumm252.value +
                                        nalogSumm255.value +
                                        nalogSumm258.value +
                                        nalogSumm261.value +
                                        nalogSumm264.value;
                                    allSumm305();
                                  },
                                ),
                                const FieldNameWidget(
                                    number: '265',
                                    title:
                                        'Итого сумма единого налога\n(252+255+258+261+264)'),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm265,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '310',
                                  controller: c310,
                                  numberPercent: '311',
                                  percent: model['sti311'],
                                  numberSumma: '312',
                                  nalogSumm: nalogSumm312,
                                  onChanged: (summa) {
                                    nalogSumm325.value = nalogSumm312.value +
                                        nalogSumm315.value +
                                        nalogSumm318.value +
                                        nalogSumm321.value +
                                        nalogSumm324.value;
                                    allSumm365();
                                  },
                                ),
                                Text(
                                  'От 30 000 000 до 50 000 000\nсомов',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '313',
                                  controller: c313,
                                  numberPercent: '314',
                                  percent: model['sti314'],
                                  numberSumma: '315',
                                  nalogSumm: nalogSumm315,
                                  onChanged: (summa) {
                                    nalogSumm325.value = nalogSumm312.value +
                                        nalogSumm315.value +
                                        nalogSumm318.value +
                                        nalogSumm321.value +
                                        nalogSumm324.value;
                                    allSumm365();
                                  },
                                ),
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
                                  numberFiled: '316',
                                  controller: c316,
                                  numberPercent: '317',
                                  percent: model['sti317'],
                                  numberSumma: '318',
                                  nalogSumm: nalogSumm318,
                                  onChanged: (summa) {
                                    nalogSumm325.value = nalogSumm312.value +
                                        nalogSumm315.value +
                                        nalogSumm318.value +
                                        nalogSumm321.value +
                                        nalogSumm324.value;
                                    allSumm365();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '319',
                                  controller: c319,
                                  numberPercent: '320',
                                  percent: model['sti320'],
                                  numberSumma: '321',
                                  nalogSumm: nalogSumm321,
                                  onChanged: (summa) {
                                    nalogSumm325.value = nalogSumm312.value +
                                        nalogSumm315.value +
                                        nalogSumm318.value +
                                        nalogSumm321.value +
                                        nalogSumm324.value;
                                    allSumm365();
                                  },
                                ),
                                Text(
                                  'В адрес обезличенного субъекта',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '322',
                                  controller: c322,
                                  numberPercent: '323',
                                  percent: model['sti323'],
                                  numberSumma: '324',
                                  nalogSumm: nalogSumm324,
                                  onChanged: (summa) {
                                    nalogSumm325.value = nalogSumm312.value +
                                        nalogSumm315.value +
                                        nalogSumm318.value +
                                        nalogSumm321.value +
                                        nalogSumm324.value;
                                    allSumm365();
                                  },
                                ),
                                const FieldNameWidget(
                                    number: '325',
                                    title:
                                        'Итого сумма единого налога\n(312+315+318+321+324)'),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm325,
                                  builder: (_, value, child) {
                                    return StaticContainerInfoWidget(
                                      title: value.toString(),
                                    );
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 910,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '176',
                                  controller: c176,
                                  numberPercent: '177',
                                  percent: model['sti177'],
                                  numberSumma: '178',
                                  nalogSumm: nalogSumm178,
                                  onChanged: (summa) {
                                    nalogSumm182.value =
                                        nalogSumm178.value + nalogSumm181.value;
                                    allSumm215();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '179',
                                  controller: c179,
                                  numberPercent: '180',
                                  percent: model['sti180'],
                                  numberSumma: '181',
                                  nalogSumm: nalogSumm181,
                                  onChanged: (summa) {
                                    nalogSumm182.value =
                                        nalogSumm178.value + nalogSumm181.value;
                                    allSumm215();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '182',
                                  title: 'Итого сумма единого налога (178+181)',
                                ),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm182,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '266',
                                  controller: c266,
                                  numberPercent: '267',
                                  percent: model['sti267'],
                                  numberSumma: '268',
                                  nalogSumm: nalogSumm268,
                                  onChanged: (summa) {
                                    nalogSumm272.value =
                                        nalogSumm268.value + nalogSumm271.value;
                                    allSumm305();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '269',
                                  controller: c269,
                                  numberPercent: '270',
                                  percent: model['sti270'],
                                  numberSumma: '271',
                                  nalogSumm: nalogSumm271,
                                  onChanged: (summa) {
                                    nalogSumm272.value =
                                        nalogSumm268.value + nalogSumm271.value;
                                    allSumm305();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '272',
                                  title: 'Итого сумма единого налога (268+271)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm272,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '326',
                                  controller: c326,
                                  numberPercent: '327',
                                  percent: model['sti327'],
                                  numberSumma: '328',
                                  nalogSumm: nalogSumm328,
                                  onChanged: (summa) {
                                    nalogSumm332.value =
                                        nalogSumm328.value + nalogSumm331.value;
                                    allSumm365();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '329',
                                  controller: c329,
                                  numberPercent: '330',
                                  percent: model['sti330'],
                                  numberSumma: '331',
                                  nalogSumm: nalogSumm331,
                                  onChanged: (summa) {
                                    nalogSumm332.value =
                                        nalogSumm328.value + nalogSumm331.value;
                                    allSumm365();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '332',
                                  title: 'Итого сумма единого налога (328+331)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm332,
                                  builder: (_, value, child) {
                                    return StaticContainerInfoWidget(
                                      title: value.toString(),
                                    );
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 910,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '183',
                                  controller: c183,
                                  numberPercent: '184',
                                  percent: model['sti184'],
                                  numberSumma: '185',
                                  nalogSumm: nalogSumm185,
                                  onChanged: (summa) {
                                    nalogSumm189.value =
                                        nalogSumm185.value + nalogSumm188.value;
                                    allSumm215();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '186',
                                  controller: c186,
                                  numberPercent: '187',
                                  percent: model['sti187'],
                                  numberSumma: '188',
                                  nalogSumm: nalogSumm188,
                                  onChanged: (summa) {
                                    nalogSumm189.value =
                                        nalogSumm185.value + nalogSumm188.value;
                                    allSumm215();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '189',
                                  title: 'Итого сумма единого налога (185+188)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm189,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '273',
                                  controller: c273,
                                  numberPercent: '274',
                                  percent: model['sti274'],
                                  numberSumma: '275',
                                  nalogSumm: nalogSumm275,
                                  onChanged: (summa) {
                                    nalogSumm279.value =
                                        nalogSumm275.value + nalogSumm278.value;
                                    allSumm305();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '276',
                                  controller: c276,
                                  numberPercent: '277',
                                  percent: model['sti277'],
                                  numberSumma: '278',
                                  nalogSumm: nalogSumm278,
                                  onChanged: (summa) {
                                    nalogSumm279.value =
                                        nalogSumm275.value + nalogSumm278.value;
                                    allSumm305();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '279',
                                  title: 'Итого сумма единого налога (275+278)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm279,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '333',
                                  controller: c333,
                                  numberPercent: '334',
                                  percent: model['sti334'],
                                  numberSumma: '335',
                                  nalogSumm: nalogSumm335,
                                  onChanged: (summa) {
                                    nalogSumm339.value =
                                        nalogSumm335.value + nalogSumm338.value;
                                    allSumm365();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '336',
                                  controller: c336,
                                  numberPercent: '337',
                                  percent: model['sti337'],
                                  numberSumma: '338',
                                  nalogSumm: nalogSumm338,
                                  onChanged: (summa) {
                                    nalogSumm339.value =
                                        nalogSumm335.value + nalogSumm338.value;
                                    allSumm365();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '339',
                                  title: 'Итого сумма единого налога (335+338)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm339,
                                  builder: (_, value, child) {
                                    return StaticContainerInfoWidget(
                                      title: value.toString(),
                                    );
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 910,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '190',
                                  controller: c190,
                                  numberPercent: '191',
                                  percent: model['sti191'],
                                  numberSumma: '192',
                                  nalogSumm: nalogSumm192,
                                  onChanged: (summa) {
                                    nalogSumm196.value =
                                        nalogSumm192.value + nalogSumm195.value;
                                    allSumm215();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '193',
                                  controller: c193,
                                  numberPercent: '194',
                                  percent: model['sti194'],
                                  numberSumma: '195',
                                  nalogSumm: nalogSumm195,
                                  onChanged: (summa) {
                                    nalogSumm196.value =
                                        nalogSumm192.value + nalogSumm195.value;
                                    allSumm215();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '196',
                                  title: 'Итого сумма единого налога (192+195)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm196,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '280',
                                  controller: c280,
                                  numberPercent: '281',
                                  percent: model['sti281'],
                                  numberSumma: '282',
                                  nalogSumm: nalogSumm282,
                                  onChanged: (summa) {
                                    nalogSumm286.value =
                                        nalogSumm282.value + nalogSumm285.value;
                                    allSumm305();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '283',
                                  controller: c283,
                                  numberPercent: '284',
                                  percent: model['sti284'],
                                  numberSumma: '285',
                                  nalogSumm: nalogSumm285,
                                  onChanged: (summa) {
                                    nalogSumm286.value =
                                        nalogSumm282.value + nalogSumm285.value;
                                    allSumm305();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '286',
                                  title: 'Итого сумма единого налога (282+285)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm286,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '340',
                                  controller: c340,
                                  numberPercent: '341',
                                  percent: model['sti341'],
                                  numberSumma: '342',
                                  nalogSumm: nalogSumm342,
                                  onChanged: (summa) {
                                    nalogSumm346.value =
                                        nalogSumm342.value + nalogSumm345.value;
                                    allSumm365();
                                  },
                                ),
                                Text(
                                  'В безналичной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                const SizedBox(height: 16),
                                CalculateNalogSummaWidget(
                                  numberFiled: '343',
                                  controller: c343,
                                  numberPercent: '344',
                                  percent: model['sti344'],
                                  numberSumma: '345',
                                  nalogSumm: nalogSumm345,
                                  onChanged: (summa) {
                                    nalogSumm346.value =
                                        nalogSumm342.value + nalogSumm345.value;
                                    allSumm365();
                                  },
                                ),
                                const FieldNameWidget(
                                  number: '346',
                                  title: 'Итого сумма единого налога (342+345)',
                                ),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm346,
                                  builder: (_, value, child) {
                                    return StaticContainerInfoWidget(
                                      title: value.toString(),
                                    );
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 410,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '197',
                                  controller: c197,
                                  numberPercent: '198',
                                  percent: model['sti198'],
                                  numberSumma: '199',
                                  nalogSumm: nalogSumm199,
                                  onChanged: (summa) {
                                    allSumm215();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '287',
                                  controller: c287,
                                  numberPercent: '288',
                                  percent: model['sti288'],
                                  numberSumma: '289',
                                  nalogSumm: nalogSumm289,
                                  onChanged: (summa) {
                                    allSumm305();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '347',
                                  controller: c347,
                                  numberPercent: '348',
                                  percent: model['sti348'],
                                  numberSumma: '349',
                                  nalogSumm: nalogSumm349,
                                  onChanged: (summa) {
                                    allSumm365();
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 410,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '200',
                                  controller: c200,
                                  numberPercent: '201',
                                  percent: model['sti201'],
                                  numberSumma: '202',
                                  nalogSumm: nalogSumm202,
                                  onChanged: (summa) {
                                    allSumm215();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '290',
                                  controller: c290,
                                  numberPercent: '291',
                                  percent: model['sti291'],
                                  numberSumma: '292',
                                  nalogSumm: nalogSumm292,
                                  onChanged: (summa) {
                                    allSumm305();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '350',
                                  controller: c350,
                                  numberPercent: '351',
                                  percent: model['sti351'],
                                  numberSumma: '352',
                                  nalogSumm: nalogSumm352,
                                  onChanged: (summa) {
                                    allSumm365();
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 410,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '203',
                                  controller: c203,
                                  numberPercent: '204',
                                  percent: model['sti204'],
                                  numberSumma: '205',
                                  nalogSumm: nalogSumm205,
                                  onChanged: (summa) {
                                    allSumm215();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '293',
                                  controller: c293,
                                  numberPercent: '294',
                                  percent: model['sti294'],
                                  numberSumma: '295',
                                  nalogSumm: nalogSumm295,
                                  onChanged: (summa) {
                                    allSumm305();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '353',
                                  controller: c353,
                                  numberPercent: '354',
                                  percent: model['sti354'],
                                  numberSumma: '355',
                                  nalogSumm: nalogSumm355,
                                  onChanged: (summa) {
                                    allSumm365();
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 410,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '206',
                                  controller: c206,
                                  numberPercent: '207',
                                  percent: model['sti207'],
                                  numberSumma: '208',
                                  nalogSumm: nalogSumm208,
                                  onChanged: (summa) {
                                    allSumm215();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '296',
                                  controller: c296,
                                  numberPercent: '297',
                                  percent: model['sti297'],
                                  numberSumma: '298',
                                  nalogSumm: nalogSumm298,
                                  onChanged: (summa) {
                                    allSumm305();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '356',
                                  controller: c356,
                                  numberPercent: '357',
                                  percent: model['sti357'],
                                  numberSumma: '358',
                                  nalogSumm: nalogSumm358,
                                  onChanged: (summa) {
                                    allSumm365();
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 410,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '209',
                                  controller: c209,
                                  numberPercent: '210',
                                  percent: model['sti210'],
                                  numberSumma: '211',
                                  nalogSumm: nalogSumm211,
                                  onChanged: (summa) {
                                    allSumm215();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '299',
                                  controller: c299,
                                  numberPercent: '300',
                                  percent: model['sti300'],
                                  numberSumma: '301',
                                  nalogSumm: nalogSumm301,
                                  onChanged: (summa) {
                                    allSumm305();
                                  },
                                ),
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '359',
                                  controller: c359,
                                  numberPercent: '360',
                                  percent: model['sti360'],
                                  numberSumma: '361',
                                  nalogSumm: nalogSumm361,
                                  onChanged: (summa) {
                                    allSumm365();
                                  },
                                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                        height: 570,
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
                                CalculateNalogSummaWidget(
                                  numberFiled: '212',
                                  controller: c212,
                                  numberPercent: '213',
                                  percent: model['sti213'],
                                  numberSumma: '214',
                                  nalogSumm: nalogSumm214,
                                  onChanged: (summa) {
                                    allSumm215();
                                  },
                                ),
                                const FieldNameWidget(
                                    number: '215',
                                    title:
                                        'Общая сумма единого налога\n(175+182+189+196+199+202+205+208+211+214)'),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm215,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '302',
                                  controller: c302,
                                  numberPercent: '303',
                                  percent: model['sti303'],
                                  numberSumma: '304',
                                  nalogSumm: nalogSumm304,
                                  onChanged: (summa) {
                                    allSumm305();
                                  },
                                ),
                                const FieldNameWidget(
                                    number: '305',
                                    title:
                                        'Общая сумма единого налога\n(265+272+279+286+289+292+295+298\n+301+304)'),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm305,
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
                                const SizedBox(height: 24),
                                Text(
                                  'В наличной форме',
                                  style: AppTextStyles.s20W500(),
                                ),
                                CalculateNalogSummaWidget(
                                  numberFiled: '362',
                                  controller: c362,
                                  numberPercent: '363',
                                  percent: model['sti363'],
                                  numberSumma: '364',
                                  nalogSumm: nalogSumm364,
                                  onChanged: (summa) {
                                    allSumm365();
                                  },
                                ),
                                const FieldNameWidget(
                                    number: '365',
                                    title:
                                        'Общая сумма единого налога\n(325+332+339+346+349+352+355\n+358+361+364)'),
                                const SizedBox(height: 12),
                                ValueListenableBuilder(
                                  valueListenable: nalogSumm365,
                                  builder: (_, value, child) {
                                    return StaticContainerInfoWidget(
                                      title: value.toString(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                CustomButton(
                  onPress: () {
                    sendOrReview(
                      contextFrom: context,
                      model: model,
                      isSend: true,
                    );
                  },
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
                BlocConsumer<GeneratePdfReviewCubit, GeneratePdfReviewState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (path) {
                        AppRouting.pushFunction(
                          PdfViewRoute(
                            path: path,
                            title: 'Предварительный просмотр',
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return CustomButton(
                      loadingColor: AppColors.color32D681Green,
                      isLoading: state.isLoading,
                      onPress: () {
                        sendOrReview(
                          contextFrom: context,
                          model: model,
                          isSend: false,
                        );
                      },
                      text: 'Предпросмотр',
                      textColor: AppColors.color32D681Green,
                      borderColor: AppColors.color32D681Green,
                      color: Colors.transparent,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  sendOrReview({
    required BuildContext contextFrom,
    required Map<String, dynamic> model,
    required bool isSend,
  }) {
    isUgnsSelected.value = selectedUgnsIndex104.value == null;
    kvartalSelected.value = selectedKvartalIndex.value == null;
    isYearSelected.value = selectedYear.value == null;

    if (isUgnsSelected.value) {
      Scrollable.ensureVisible(
        ugnsKey.currentContext!,
        duration: const Duration(seconds: 1),
      );
      AppSnackBar.showSnackBar('Заполние обязательные поля!');
    } else if (!formKey.currentState!.validate()) {
      Scrollable.ensureVisible(
        numbersKey.currentContext!,
        duration: const Duration(seconds: 1),
      );
      AppSnackBar.showSnackBar('Заполние обязательные поля!');
    } else if (kvartalSelected.value || isYearSelected.value) {
      Scrollable.ensureVisible(
        dateKey.currentContext!,
        duration: const Duration(seconds: 1),
      );
      AppSnackBar.showSnackBar('Заполние обязательные поля!');
    } else {
      unFocuserFunc(context);
      final sendData = sendDataFunc(model);
      if (isSend) {
        AppRouting.pushFunction(
          NalogConfirmRoute(
            nalogNameModel: widget.model,
            sendModel: sendData,
          ),
        );
      } else {
        contextFrom
            .read<GeneratePdfReviewCubit>()
            .generatePdf(sendData, widget.model.reportType);
      }
    }
  }

  Map<String, dynamic> sendDataFunc(Map<String, dynamic> model) => {
        "ftype": selectedDocType001,
        "startdate": startdate,
        "enddate": enddate,
        "sti102": model['sti102'],
        "sti103": model['sti103'],
        "sti104": ugnsModels[selectedUgnsIndex104.value!].id,
        "sti106": model['sti106'],
        "sti107": model['sti107'],
        "sti115": c115.text,
        "sti116": c116.text,
        "sti108": c108.text,
        "sti110": model['sti110'],
        "sti111": model['sti111'],
        "sti050": c50.text,
        "sti051": model['sti051'],
        "sti052": nalogSumm052.value,
        "sti053": c53.text,
        "sti054": model['sti054'],
        "sti055": nalogSumm055.value,
        "sti056": c56.text,
        "sti057": model['sti057'],
        "sti058": nalogSumm058.value,
        "sti059": c59.text,
        "sti060": model['sti060'],
        "sti061": nalogSumm061.value,
        "sti062": c62.text,
        "sti063": model['sti063'],
        "sti064": nalogSumm064.value,
        "sti065": nalogSumm065.value,
        "sti066": c66.text,
        "sti067": model['sti067'],
        "sti068": nalogSumm068.value,
        "sti069": c69.text,
        "sti070": model['sti070'],
        "sti071": nalogSumm071.value,
        "sti072": nalogSumm072.value,
        "sti073": c73.text,
        "sti074": model['sti074'],
        "sti075": nalogSumm075.value,
        "sti076": c76.text,
        "sti077": model['sti077'],
        "sti078": nalogSumm078.value,
        "sti079": nalogSumm079.value,
        "sti080": c80.text,
        "sti081": model['sti081'],
        "sti082": nalogSumm082.value,
        "sti083": c83.text,
        "sti084": model['sti084'],
        "sti085": nalogSumm085.value,
        "sti086": nalogSumm086.value,
        "sti130": c130.text,
        "sti131": model['sti131'],
        "sti132": nalogSumm132.value,
        "sti136": c136.text,
        "sti137": model['sti137'],
        "sti138": nalogSumm138.value,
        "sti139": c139.text,
        "sti140": model['sti140'],
        "sti141": nalogSumm141.value,
        "sti142": c142.text,
        "sti143": model['sti143'],
        "sti144": nalogSumm144.value,
        "sti145": c145.text,
        "sti146": model['sti146'],
        "sti147": nalogSumm147.value,
        "sti148": c148.text,
        "sti149": model['sti149'],
        "sti150": nalogSumm150.value,
        "totalsum": nalogSumm154.value,
        "sti160": c160.text,
        "sti161": model['sti161'],
        "sti162": nalogSumm162.value,
        "sti163": c163.text,
        "sti164": model['sti164'],
        "sti165": nalogSumm165.value,
        "sti166": c166.text,
        "sti167": model['sti167'],
        "sti168": nalogSumm168.value,
        "sti169": c169.text,
        "sti170": model['sti170'],
        "sti171": nalogSumm171.value,
        "sti172": c172.text,
        "sti173": model['sti173'],
        "sti174": nalogSumm174.value,
        "sti175": nalogSumm175.value,
        "sti176": c176.text,
        "sti177": model['sti177'],
        "sti178": nalogSumm178.value,
        "sti179": c179.text,
        "sti180": model['sti180'],
        "sti181": nalogSumm181.value,
        "sti182": nalogSumm182.value,
        "sti183": c183.text,
        "sti184": model['sti184'],
        "sti185": nalogSumm185.value,
        "sti186": c186.text,
        "sti187": model['sti187'],
        "sti188": nalogSumm188.value,
        "sti189": nalogSumm189.value,
        "sti190": c190.text,
        "sti191": model['sti191'],
        "sti192": nalogSumm192.value,
        "sti193": c193.text,
        "sti194": model['sti194'],
        "sti195": nalogSumm195.value,
        "sti196": nalogSumm196.value,
        "sti197": c197.text,
        "sti198": model['sti198'],
        "sti199": nalogSumm199.value,
        "sti200": c200.text,
        "sti201": model['sti201'],
        "sti202": nalogSumm202.value,
        "sti203": c203.text,
        "sti204": model['sti204'],
        "sti205": nalogSumm205.value,
        "sti206": c206.text,
        "sti207": model['sti207'],
        "sti208": nalogSumm208.value,
        "sti209": c209.text,
        "sti210": model['sti210'],
        "sti211": nalogSumm211.value,
        "sti212": c212.text,
        "sti213": model['sti213'],
        "sti214": nalogSumm214.value,
        "totalm1": nalogSumm215.value,
        "sti250": c250.text,
        "sti251": model['sti251'],
        "sti252": nalogSumm252.value,
        "sti253": c253.text,
        "sti254": model['sti254'],
        "sti255": nalogSumm255.value,
        "sti256": c256.text,
        "sti257": model['sti257'],
        "sti258": nalogSumm258.value,
        "sti259": c259.text,
        "sti260": model['sti260'],
        "sti261": nalogSumm261.value,
        "sti262": c262.text,
        "sti263": model['sti263'],
        "sti264": nalogSumm264.value,
        "sti265": nalogSumm265.value,
        "sti266": c266.text,
        "sti267": model['sti267'],
        "sti268": nalogSumm268.value,
        "sti269": c269.text,
        "sti270": model['sti270'],
        "sti271": nalogSumm271.value,
        "sti272": nalogSumm272.value,
        "sti273": c273.text,
        "sti274": model['sti274'],
        "sti275": nalogSumm275.value,
        "sti276": c276.text,
        "sti277": model['sti277'],
        "sti278": nalogSumm278.value,
        "sti279": nalogSumm279.value,
        "sti280": c280.text,
        "sti281": model['sti281'],
        "sti282": nalogSumm282.value,
        "sti283": c283.text,
        "sti284": model['sti284'],
        "sti285": nalogSumm285.value,
        "sti286": nalogSumm286.value,
        "sti287": c287.text,
        "sti288": model['sti288'],
        "sti289": nalogSumm289.value,
        "sti290": c290.text,
        "sti291": model['sti291'],
        "sti292": nalogSumm292.value,
        "sti293": c293.text,
        "sti294": model['sti294'],
        "sti295": nalogSumm295.value,
        "sti296": c296.text,
        "sti297": model['sti297'],
        "sti298": nalogSumm298.value,
        "sti299": c299.text,
        "sti300": model['sti300'],
        "sti301": nalogSumm301.value,
        "sti302": c302.text,
        "sti303": model['sti303'],
        "sti304": nalogSumm304.value,
        "totalm2": nalogSumm305.value,
        "sti310": c310.text,
        "sti311": model['sti311'],
        "sti312": nalogSumm312.value,
        "sti313": c313.text,
        "sti314": model['sti314'],
        "sti315": nalogSumm315.value,
        "sti316": c316.text,
        "sti317": model['sti317'],
        "sti318": nalogSumm318.value,
        "sti319": c319.text,
        "sti320": model['sti320'],
        "sti321": nalogSumm321.value,
        "sti322": c322.text,
        "sti323": model['sti323'],
        "sti324": nalogSumm324.value,
        "sti325": nalogSumm325.value,
        "sti326": c326.text,
        "sti327": model['sti327'],
        "sti328": nalogSumm328.value,
        "sti329": c329.text,
        "sti330": model['sti330'],
        "sti331": nalogSumm331.value,
        "sti332": nalogSumm332.value,
        "sti333": c333.text,
        "sti334": model['sti334'],
        "sti335": nalogSumm335.value,
        "sti336": c336.text,
        "sti337": model['sti337'],
        "sti338": nalogSumm338.value,
        "sti339": nalogSumm339.value,
        "sti340": c340.text,
        "sti341": model['sti341'],
        "sti342": nalogSumm342.value,
        "sti343": c343.text,
        "sti344": model['sti344'],
        "sti345": nalogSumm345.value,
        "sti346": nalogSumm346.value,
        "sti347": c347.text,
        "sti348": model['sti348'],
        "sti349": nalogSumm349.value,
        "sti350": c350.text,
        "sti351": model['sti351'],
        "sti352": nalogSumm352.value,
        "sti353": c353.text,
        "sti354": model['sti354'],
        "sti355": nalogSumm355.value,
        "sti356": c356.text,
        "sti357": model['sti357'],
        "sti358": nalogSumm358.value,
        "sti359": c359.text,
        "sti360": model['sti360'],
        "sti361": nalogSumm361.value,
        "sti362": c362.text,
        "sti363": model['sti363'],
        "sti364": nalogSumm364.value,
        "totalm3": nalogSumm365.value,
      };
}
