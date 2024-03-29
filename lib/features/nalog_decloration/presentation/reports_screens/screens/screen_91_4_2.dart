import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/ugns_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part050_part055_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part056_part132_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part136_part150_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/part1_of_nalog_screen_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/provider_scaffold_background_widgets.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_dates_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/static_container_info_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/generate_pdf_review_cubit/generate_pdf_review_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/send_saved_data_cubit/send_saved_data_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_unfocuser.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

@RoutePage()
class Screen9142 extends StatefulWidget {
  const Screen9142({super.key, required this.model});
  final NalogNameModel model;

  @override
  State<Screen9142> createState() => _Screen9142State();
}

class _Screen9142State extends State<Screen9142> {
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
                  const SizedBox(height: 36),
                  BlocBuilder<SendSavedDataCubit, SendSavedDataState>(
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state.isLoading,
                        onPress: () {
                          isUgnsSelected.value =
                              selectedUgnsIndex104.value == null;
                          kvartalSelected.value =
                              selectedKvartalIndex.value == null;
                          isYearSelected.value = selectedYear.value == null;

                          if (isUgnsSelected.value) {
                            Scrollable.ensureVisible(
                              ugnsKey.currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                            AppSnackBar.showSnackBar(
                                'Заполние обязательные поля!');
                          } else if (!formKey.currentState!.validate()) {
                            Scrollable.ensureVisible(
                              numbersKey.currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                            AppSnackBar.showSnackBar(
                                'Заполние обязательные поля!');
                          } else if (kvartalSelected.value ||
                              isYearSelected.value) {
                            Scrollable.ensureVisible(
                              dateKey.currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                            AppSnackBar.showSnackBar(
                                'Заполние обязательные поля!');
                          } else {
                            final sendData = {
                              "ftype": selectedDocType001,
                              "startdate": startdate,
                              "enddate": enddate,
                              "sti102": model['sti102'],
                              "sti103": model['sti103'],
                              "sti104":
                                  ugnsModels[selectedUgnsIndex104.value!].id,
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
                            };

                            context
                                .read<SendSavedDataCubit>()
                                .sendData(sendData, widget.model.reportType);
                          }
                        },
                        text: 'Отправить в ГНС',
                      );
                    },
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
                          isUgnsSelected.value =
                              selectedUgnsIndex104.value == null;
                          kvartalSelected.value =
                              selectedKvartalIndex.value == null;
                          isYearSelected.value = selectedYear.value == null;

                          if (isUgnsSelected.value) {
                            Scrollable.ensureVisible(
                              ugnsKey.currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                            AppSnackBar.showSnackBar(
                                'Заполние обязательные поля!');
                          } else if (!formKey.currentState!.validate()) {
                            Scrollable.ensureVisible(
                              numbersKey.currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                            AppSnackBar.showSnackBar(
                                'Заполние обязательные поля!');
                          } else if (kvartalSelected.value ||
                              isYearSelected.value) {
                            Scrollable.ensureVisible(
                              dateKey.currentContext!,
                              duration: const Duration(seconds: 1),
                            );
                            AppSnackBar.showSnackBar(
                                'Заполние обязательные поля!');
                          } else {
                            final sendData = {
                              "ftype": selectedDocType001,
                              "startdate": startdate,
                              "enddate": enddate,
                              "sti102": model['sti102'],
                              "sti103": model['sti103'],
                              "sti104":
                                  ugnsModels[selectedUgnsIndex104.value!].id,
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
                            };

                            context
                                .read<GeneratePdfReviewCubit>()
                                .generatePdf(sendData, widget.model.reportType);
                          }
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
          }),
    );
  }
}
