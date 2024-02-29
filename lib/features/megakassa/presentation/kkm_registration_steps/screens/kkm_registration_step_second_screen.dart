import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_second_entity.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';

@RoutePage()
class MegaKassaKkmRegistrationStep2Screen extends StatefulWidget {
  const MegaKassaKkmRegistrationStep2Screen({
    super.key,
    required this.stepEntity,
  });
  final MegaKassaKkmRegistrationStep2Entity? stepEntity;

  @override
  State<MegaKassaKkmRegistrationStep2Screen> createState() =>
      _MegaKassaKkmRegistrationStep2ScreenState();
}

class _MegaKassaKkmRegistrationStep2ScreenState
    extends State<MegaKassaKkmRegistrationStep2Screen> {
  final _isFullFilled = ValueNotifier(false);

  late final _indexController =
      TextEditingController(text: widget.stepEntity?.index ?? '');
  late final _regionController =
      TextEditingController(text: widget.stepEntity?.region ?? '');
  late final _localityController =
      TextEditingController(text: widget.stepEntity?.locality ?? '');
  late final _streetController =
      TextEditingController(text: widget.stepEntity?.street ?? '');
  late final _houseNumberController =
      TextEditingController(text: widget.stepEntity?.houseNumber ?? '');
  late final _latController =
      TextEditingController(text: widget.stepEntity?.lat ?? '');
  late final _longController =
      TextEditingController(text: widget.stepEntity?.long ?? '');

  void _validate(_) {
    if ([
      _indexController,
      _regionController,
      _localityController,
      _streetController,
      _houseNumberController,
      _latController,
      _longController
    ].every((e) => e.text.isNotEmpty)) {
      if (widget.stepEntity?.index != _indexController.text ||
          widget.stepEntity?.region != _regionController.text ||
          widget.stepEntity?.locality != _localityController.text ||
          widget.stepEntity?.street != _streetController.text ||
          widget.stepEntity?.houseNumber != _houseNumberController.text ||
          widget.stepEntity?.lat != _latController.text ||
          widget.stepEntity?.long != _longController.text) {
        _isFullFilled.value = true;
      } else {
        _isFullFilled.value = false;
      }
    } else {
      _isFullFilled.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF3F4F5),
        appBar: CustomAppBar(
          title: 'Адрес объекта',
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
                  final model = MegaKassaKkmRegistrationStep2Entity(
                    index: _indexController.text,
                    region: _regionController.text,
                    locality: _localityController.text,
                    street: _streetController.text,
                    houseNumber: _houseNumberController.text,
                    lat: _latController.text,
                    long: _longController.text,
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
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: [
            CustomTextField(
              labelText: 'Индекс',
              controller: _indexController,
              onChanged: _validate,
              validator: AppInputValidators.emptyValidator,
              keyboardType: TextInputType.number,
              maxLength: 200,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              labelText: 'Регион',
              controller: _regionController,
              onChanged: _validate,
              validator: AppInputValidators.emptyValidator,
              maxLength: 200,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              labelText: 'Населенный пункт',
              controller: _localityController,
              onChanged: _validate,
              validator: AppInputValidators.emptyValidator,
              maxLength: 200,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              labelText: 'Улица',
              controller: _streetController,
              onChanged: _validate,
              validator: AppInputValidators.emptyValidator,
              maxLength: 200,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              labelText: 'Номер дома',
              controller: _houseNumberController,
              onChanged: _validate,
              validator: AppInputValidators.emptyValidator,
              keyboardType: TextInputType.number,
              maxLength: 4,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    labelText: 'Широта',
                    controller: _latController,
                    onChanged: _validate,
                    validator: AppInputValidators.emptyValidator,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLength: 8,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: CustomTextField(
                    labelText: 'Долгота',
                    controller: _longController,
                    onChanged: _validate,
                    validator: AppInputValidators.emptyValidator,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLength: 8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
