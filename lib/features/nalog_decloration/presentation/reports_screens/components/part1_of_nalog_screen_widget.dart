import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/ugns_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/custom_text_field.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/field_name_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/select_document_type_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/components/static_container_info_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/screens/code_ugns_screen.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class Part1OfNalogScreenWidget extends StatelessWidget {
  const Part1OfNalogScreenWidget({
    super.key,
    required this.model,
    required this.selectedUgnsIndex104,
    required this.isUgnsSelected,
    required this.ugnsModels,
    required this.c115,
    required this.c116,
    required this.c108,
    required this.onSelectedDocument,
    this.ungKey,
    this.numbersKey,
    required this.percent081,
    required this.percent084,
  });
  final Map<String, dynamic> model;
  final ValueNotifier<int?> selectedUgnsIndex104;
  final ValueNotifier<bool> isUgnsSelected;
  final List<UgnsModel> ugnsModels;
  final TextEditingController c115;
  final TextEditingController c116;
  final TextEditingController c108;
  final Function(int) onSelectedDocument;
  final GlobalKey? ungKey;
  final GlobalKey? numbersKey;
  final ValueNotifier<num?> percent081;
  final ValueNotifier<num?> percent084;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldNameWidget(number: '001', title: 'Тип документа'),
          const SizedBox(height: 13),
          SelectDocumentTypeWidget(
            onChanged: onSelectedDocument,
          ),
          const SizedBox(height: 16),
          const FieldNameWidget(number: '102', title: 'ИНН'),
          const SizedBox(height: 12),
          StaticContainerInfoWidget(title: model['sti102']),
          const SizedBox(height: 16),
          const FieldNameWidget(
              number: '103', title: 'Наименование плательщика'),
          const SizedBox(height: 12),
          StaticContainerInfoWidget(title: model['sti103']),
          const SizedBox(height: 16),
          FieldNameWidget(
            key: ungKey,
            number: '104',
            title: 'Код УГНС',
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder(
            valueListenable: selectedUgnsIndex104,
            builder: (_, value, child) {
              return ValueListenableBuilder(
                valueListenable: isUgnsSelected,
                builder: (_, ugnsValue, child) {
                  return InkWell(
                    onTap: () async {
                      final resultIndex = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CodeUgnsScreen(
                            ugnsModels: ugnsModels,
                          ),
                        ),
                      ) as int?;
                      if (resultIndex != null) {
                        switch (ugnsModels[resultIndex].id) {
                          case '001':
                            percent081.value = 6;
                            percent084.value = 4;
                            break;
                          case '002':
                            percent081.value = 6;
                            percent084.value = 4;
                            break;
                          case '003':
                            percent081.value = 6;
                            percent084.value = 4;
                            break;
                          case '004':
                            percent081.value = 6;
                            percent084.value = 4;
                            break;
                          case '032':
                            percent081.value = 6;
                            percent084.value = 4;
                            break;
                          default:
                            percent081.value = 4;
                            percent084.value = 2;
                            break;
                        }
                        selectedUgnsIndex104.value = resultIndex;
                        isUgnsSelected.value = false;
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: ugnsValue
                            ? Border.all(
                                color: Colors.red,
                              )
                            : Border.all(
                                color: Colors.black,
                              ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              selectedUgnsIndex104.value == null
                                  ? 'Выберите'
                                  : ugnsModels[selectedUgnsIndex104.value!].id,
                              style: AppTextStyles.s16W500(),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_sharp),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            'Наименование района',
            style: AppTextStyles.s16W500(),
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder(
            valueListenable: selectedUgnsIndex104,
            builder: (_, __, child) {
              if (selectedUgnsIndex104.value != null) {
                return StaticContainerInfoWidget(
                  title: ugnsModels[selectedUgnsIndex104.value!].displayText,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const SizedBox(height: 16),
          const FieldNameWidget(
            number: '106',
            title: 'Серия и № Паспорта',
          ),
          const SizedBox(height: 12),
          StaticContainerInfoWidget(title: model['sti106']),
          const SizedBox(height: 16),
          const FieldNameWidget(number: '107', title: 'Страна выдачи'),
          const SizedBox(height: 12),
          StaticContainerInfoWidget(title: model['sti107']),
          const SizedBox(height: 16),
          FieldNameWidget(
            key: numbersKey,
            number: '115',
            title: 'Телефон (Дом./Раб.)',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            hintText: '0555 555 555',
            controller: c115,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.phoneFormatterZero,
            ],
            validator: AppInputValidators.emptyValidator,
          ),
          const SizedBox(height: 16),
          const FieldNameWidget(
            number: '116',
            title: 'Адрес электронной почты',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            hintText: 'example@gmail.com',
            controller: c116,
            validator: AppInputValidators.emptyValidator,
          ),
          const SizedBox(height: 16),
          const FieldNameWidget(
            number: '108',
            title: 'Почтовый индекс',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            hintText: '720000',
            controller: c108,
            keyboardType: TextInputType.number,
            validator: AppInputValidators.emptyValidator,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
            ],
          ),
          const SizedBox(height: 16),
          const FieldNameWidget(
            number: '110',
            title: 'Область, Город/Область, Район, Село',
          ),
          const SizedBox(height: 12),
          StaticContainerInfoWidget(title: model['sti110']),
          const SizedBox(height: 16),
          const FieldNameWidget(
            number: '111',
            title: 'Улица/микрорайон, и Номер Дома/Квартиры',
          ),
          const SizedBox(height: 12),
          StaticContainerInfoWidget(title: model['sti111']),
        ],
      ),
    );
  }
}
