import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_first_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_steps_info_entity.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_registration_steps/cubits/get_steps_info_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/kkm_registration_steps/widgets/search_bottom_sheet.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/ishker_dialogs.dart';

@RoutePage()
class MegaKassaKkmRegistrationStep1Screen extends StatefulWidget {
  const MegaKassaKkmRegistrationStep1Screen({
    super.key,
    required this.stepEntity,
  });

  final MegaKassaKkmRegistrationStep1Entity? stepEntity;

  @override
  State<MegaKassaKkmRegistrationStep1Screen> createState() =>
      _MegaKassaKkmRegistrationStep1ScreenState();
}

class _MegaKassaKkmRegistrationStep1ScreenState
    extends State<MegaKassaKkmRegistrationStep1Screen> {
  late final MegaKassaStepsInfoEntity _info;
  final _isFullFilled = ValueNotifier(false);

  late final List<String> _paramsList =
      widget.stepEntity?.params.map((e) => e.attributeName ?? '').toList() ??
          [];

  late final _isNdsPayer = ValueNotifier(widget.stepEntity?.isNdsPayer ?? true);
  late final _paymentType = ValueNotifier(widget.stepEntity?.paymentType);

  late final _activityController = TextEditingController(
    text: widget.stepEntity?.activity.name ?? '',
  );
  late final _codeController =
      TextEditingController(text: widget.stepEntity?.code.name ?? '');
  late final _modeController =
      TextEditingController(text: widget.stepEntity?.mode.taxName ?? '');
  late final _objectTypeController =
      TextEditingController(text: widget.stepEntity?.objectType.name ?? '');
  late final _nameController =
      TextEditingController(text: widget.stepEntity?.name ?? '');
  late final _paramsController = TextEditingController(
      text: widget.stepEntity?.params
          .map((e) => e.attributeName)
          .toString()
          .substring(1)
          .substring(
              0,
              ((widget.stepEntity?.params
                          .map((e) => e.attributeName)
                          .toString()
                          .length) ??
                      1) -
                  2));

  @override
  void dispose() {
    _isNdsPayer.dispose();
    _activityController.dispose();
    _codeController.dispose();
    _modeController.dispose();
    _objectTypeController.dispose();
    _nameController.dispose();
    _paramsController.dispose();
    _isFullFilled.dispose();
    _paymentType.dispose();
    super.dispose();
  }

  void _validate() {
    if ([
          _activityController,
          _codeController,
          _modeController,
          _objectTypeController,
          _nameController,
          _paramsController
        ].every((e) => e.text.isNotEmpty) &&
        _paymentType.value != null) {
      if (widget.stepEntity?.activity.name != _activityController.text ||
          widget.stepEntity?.code.name != _codeController.text ||
          widget.stepEntity?.isNdsPayer != _isNdsPayer.value ||
          widget.stepEntity?.mode.taxName != _modeController.text ||
          widget.stepEntity?.name != _nameController.text ||
          widget.stepEntity?.objectType.name != _objectTypeController.text ||
          widget.stepEntity?.params.map((e) => e.attributeName).toList() !=
              _paramsList ||
          widget.stepEntity?.paymentType != _paymentType.value) {
        _isFullFilled.value = true;
      } else {
        _isFullFilled.value = false;
      }
    } else {
      _isFullFilled.value = false;
    }
  }

  final _cubit = sl<MegaKassaGetStepsInfoCubit>()..getStepsInfo();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF3F4F5),
        appBar: CustomAppBar(
          title: 'Объекты предпринимательства',
          titleTextStyle: AppTextStyles.s16W700(
            color: AppColors.color2C2C2CBlack,
          ),
          backgroundColor: const Color(0xffF3F4F5),
          centerTitle: false,
        ),
        persistentFooterButtons: [
          ValueListenableBuilder(
            valueListenable: _isFullFilled,
            builder: (context, _, __) {
              return CustomButton(
                aroundButtonPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                onPress: () {
                  final model = MegaKassaKkmRegistrationStep1Entity(
                    isNdsPayer: _isNdsPayer.value,
                    name: _nameController.text,
                    paymentType: _paymentType.value ?? Activity(),
                    activity: Activity(
                      name: _activityController.text,
                      code: _info.activities
                          ?.firstWhere(
                              (e) => e.name == _activityController.text)
                          .code,
                    ),
                    code: Activity(
                      name: _codeController.text,
                      code: _info.authorityDeps
                          ?.firstWhere((e) => e.name == _codeController.text)
                          .code,
                    ),
                    mode: TaxSystem(
                      taxName: _modeController.text,
                      code: _info.taxSystems
                          ?.firstWhere((e) => e.taxName == _modeController.text)
                          .code,
                    ),
                    objectType: Activity(
                      name: _objectTypeController.text,
                      code: _info.entrepreneurshipObjects
                          ?.firstWhere(
                              (e) => e.name == _objectTypeController.text)
                          .code,
                    ),
                    params: _paramsList
                        .map((text) => CalcItem(
                              attributeName: text,
                              code: _info.calcItems
                                  ?.firstWhere((e) => e.attributeName == text)
                                  .code,
                            ))
                        .toList(),
                  );

                  context.router.pop(model);
                },
                radius: 16,
                text: 'Сохранить',
                isFullFilled: _isFullFilled.value,
              );
            },
          ),
        ],
        body: BlocConsumer<MegaKassaGetStepsInfoCubit, GetStepsInfoState>(
          bloc: _cubit,
          listener: (context, state) {
            state.whenOrNull(
              success: (info) {
                _info = info ?? MegaKassaStepsInfoEntity();
              },
            );
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Плательщик НДС',
                      style: AppTextStyles.s16W600(
                        color: AppColors.color2C2C2CBlack,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _isNdsPayer,
                      builder: (context, _, __) {
                        return CupertinoSwitch(
                          value: _isNdsPayer.value,
                          onChanged: (v) {
                            _isNdsPayer.value = v;
                            _validate();
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildField(
                  isLoading: state.isLoading,
                  title: 'Вид деятельности',
                  controller: _activityController,
                  array:
                      state.info?.activities?.map((e) => e.name ?? '').toList(),
                ),
                const SizedBox(height: 8),
                _buildField(
                  isLoading: state.isLoading,
                  title: 'Код и наименование налог. органа',
                  controller: _codeController,
                  array: state.info?.authorityDeps
                      ?.map((e) => e.name ?? '')
                      .toList(),
                ),
                const SizedBox(height: 8),
                _buildField(
                  isLoading: state.isLoading,
                  title: 'Налоговый режим',
                  controller: _modeController,
                  array: state.info?.taxSystems
                      ?.map((e) => e.taxName ?? '')
                      .toList(),
                ),
                const SizedBox(height: 8),
                _buildField(
                  isLoading: state.isLoading,
                  title: 'Тип объекта предпринимательства',
                  controller: _objectTypeController,
                  array: state.info?.entrepreneurshipObjects
                      ?.map((e) => e.name ?? '')
                      .toList(),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Наименование торговой точки',
                  controller: _nameController,
                  onChanged: (v) {
                    _validate();
                  },
                  validator: AppInputValidators.emptyValidator,
                  maxLength: 200,
                ),
                const SizedBox(height: 8),
                _buildField(
                  isLoading: state.isLoading,
                  title: 'Дополнит. параметры расчетов',
                  controller: _paramsController,
                  isForSelection: true,
                  initialSelectedArray: _paramsList,
                  array: state.info?.calcItems
                      ?.map((e) => e.attributeName ?? '')
                      .toList(),
                ),
                const SizedBox(height: 18),
                ValueListenableBuilder(
                  valueListenable: _paymentType,
                  builder: (context, _, __) {
                    return (state.info?.sellPlaces != null &&
                            (state.info?.sellPlaces?.isNotEmpty ?? false))
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Место расчетов',
                                style: AppTextStyles.s16W600(
                                  color: AppColors.color2C2C2CBlack,
                                ),
                              ),
                              const SizedBox(height: 4),
                              ...state.info!.sellPlaces!
                                  .map((e) => _buildRadioItem(
                                        title: e.name ?? '',
                                        onTap: () {
                                          _paymentType.value = e;
                                          _validate();
                                        },
                                        isActive: _paymentType.value == e,
                                      )),
                            ],
                          )
                        : const Offstage();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildField({
    required String title,
    required TextEditingController controller,
    required List<String>? array,
    List<String>? initialSelectedArray,
    required bool isLoading,
    bool isForSelection = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (array != null && array.isNotEmpty) {
          IshkerDialog.showDraggableBottomSheet(
            context: context,
            maxChildSize: isForSelection ? 0.8 : 0.7,
            initialChildSize: isForSelection ? 0.8 : 0.7,
            isScrollControlled: true,
            title: title,
            child: isForSelection
                ? MegaKassaSearchSelectionBottomSheet(
                    array: array,
                    title: title,
                    initialSelectedArray: initialSelectedArray ?? [],
                    onSelected: (value) {
                      Navigator.pop(context);
                      _paramsList.clear();
                      _paramsList.addAll(value);
                      controller.text = _paramsList
                          .map((e) => e)
                          .toString()
                          .substring(1)
                          .substring(
                              0,
                              (_paramsList.map((e) => e).toString().length) -
                                  2);
                      _validate();
                    },
                  )
                : MegaKassaSearchBottomSheet(
                    array: array,
                    title: title,
                    onSelected: (value) {
                      Navigator.pop(context);
                      controller.text = value;
                      _validate();
                    },
                  ),
          );
        }
      },
      child: CustomTextField(
        enabled: false,
        labelText: title,
        controller: controller,
        suffixIcon: array != null && array.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: SvgPicture.asset(
                  AppImages.arrowDown,
                ),
              )
            : isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: AppIndicator(radius: 12),
                  )
                : null,
      ),
    );
  }

  InkWell _buildRadioItem({
    required String title,
    required VoidCallback onTap,
    required bool isActive,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Radio(
                hoverColor: Colors.transparent,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                activeColor: AppColors.color54B25AMain,
                value: isActive,
                groupValue: true,
                onChanged: (v) {
                  onTap();
                },
              ),
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: AppTextStyles.s16W400(
                color: AppColors.color2C2C2CBlack,
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
