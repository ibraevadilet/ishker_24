import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_third_entity.dart';
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
class MegaKassaKkmRegistrationStep3Screen extends StatefulWidget {
  const MegaKassaKkmRegistrationStep3Screen({
    super.key,
    required this.stepEntity,
  });
  final MegaKassaKkmRegistrationStep3Entity? stepEntity;

  @override
  State<MegaKassaKkmRegistrationStep3Screen> createState() =>
      _MegaKassaKkmRegistrationStep3ScreenState();
}

class _MegaKassaKkmRegistrationStep3ScreenState
    extends State<MegaKassaKkmRegistrationStep3Screen> {
  final _isFullFilled = ValueNotifier(false);
  final _isObsecure = ValueNotifier(true);

  final _infoCubit = sl<MegaKassaGetStepsInfoCubit>()..getStepsInfo();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _firstCorrect = false;
  bool _secondCorrect = false;
  bool _thirdCorrect = false;
  bool _fourthCorrect = false;

  late final _passwordController =
      TextEditingController(text: widget.stepEntity?.password ?? '');
  late final _repeatPasswordController =
      TextEditingController(text: widget.stepEntity?.password ?? '');
  late final _fmController =
      TextEditingController(text: widget.stepEntity?.fm ?? '');
  late final _modelController =
      TextEditingController(text: widget.stepEntity?.kkmModel ?? '');

  void _validate(_) {
    if ([_passwordController, _repeatPasswordController, _modelController]
            .every((e) => e.text.isNotEmpty) &&
        [
          _firstCorrect,
          _secondCorrect,
          _thirdCorrect,
          _fourthCorrect,
        ].every((isFilled) => isFilled) &&
        _passwordController.text == _repeatPasswordController.text) {
      if (widget.stepEntity?.password != _passwordController.text ||
          widget.stepEntity?.password != _repeatPasswordController.text ||
          widget.stepEntity?.kkmModel != _modelController.text) {
        _isFullFilled.value = true;
      } else {
        _isFullFilled.value = false;
      }
    } else {
      _isFullFilled.value = false;
    }
  }

  void _validatePassword(_) {
    if (_passwordController.text.length >= 8) {
      _firstCorrect = true;
    } else {
      _firstCorrect = false;
    }

    if (_passwordController.text.contains(RegExp(r'[a-zA-Zа-яА-Я]'))) {
      _secondCorrect = true;
    } else {
      _secondCorrect = false;
    }

    if (_passwordController.text.contains(RegExp(r'[0-9]'))) {
      _thirdCorrect = true;
    } else {
      _thirdCorrect = false;
    }

    if (_passwordController.text.contains(RegExp(r'[!?_&*$#^%]'))) {
      _fourthCorrect = true;
    } else {
      _fourthCorrect = false;
    }

    if (_repeatPasswordController.text.isNotEmpty) {
      formKey.currentState?.validate();
    }

    _validate(_);
  }

  @override
  void initState() {
    super.initState();
    if (widget.stepEntity?.password != null &&
        (widget.stepEntity?.password.isNotEmpty ?? false)) {
      _validatePassword(null);
    }
  }

  @override
  void dispose() {
    _isFullFilled.dispose();
    _isObsecure.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _fmController.dispose();
    _modelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: BlocProvider.value(
        value: _infoCubit,
        child: Scaffold(
          backgroundColor: const Color(0xffF3F4F5),
          appBar: CustomAppBar(
            title: 'ККМ',
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
                    if (formKey.currentState?.validate() ?? false) {
                      final model = MegaKassaKkmRegistrationStep3Entity(
                        fm: _fmController.text,
                        kkmModel: _modelController.text,
                        password: _passwordController.text,
                      );

                      context.router.pop(model);
                    }
                  },
                  radius: 16,
                  text: 'Сохранить',
                  isFullFilled: _isFullFilled.value,
                );
              },
            ),
          ],
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              children: [
                ValueListenableBuilder(
                  valueListenable: _isObsecure,
                  builder: (context, _, __) {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomTextField(
                          labelText: 'Пароль',
                          maxLength: 16,
                          obscureText: _isObsecure.value,
                          controller: _passwordController,
                          validator: AppInputValidators.emptyValidator,
                          onChanged: _validatePassword,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            onPressed: _obsecure,
                            icon: SvgPicture.asset(
                              _isObsecure.value
                                  ? AppImages.eyePasswordOpenSvg
                                  : AppImages.eyePasswordCloseSvg,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: _passwordController,
                  builder: (context, _, __) {
                    return Visibility(
                      visible: _passwordController.text.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Требования к паролю:',
                            style: AppTextStyles.s14W500(
                              color: AppColors.color54B25AMain,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _RequirementsItem(
                            isFilled: _firstCorrect,
                            title: 'не менее 8 символов',
                          ),
                          const SizedBox(height: 10),
                          _RequirementsItem(
                            isFilled: _secondCorrect,
                            title: 'минимум 1 буква',
                          ),
                          const SizedBox(height: 10),
                          _RequirementsItem(
                            isFilled: _thirdCorrect,
                            title: 'минимум 1 цифра',
                          ),
                          const SizedBox(height: 10),
                          _RequirementsItem(
                            isFilled: _fourthCorrect,
                            title: 'минимум 1 спец. символ (!?_&*\$#^%)',
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                ValueListenableBuilder(
                  valueListenable: _isObsecure,
                  builder: (context, _, __) {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomTextField(
                          labelText: 'Подтвердите пароль',
                          maxLength: 16,
                          obscureText: _isObsecure.value,
                          controller: _repeatPasswordController,
                          onChanged: _validate,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Поле обязательно для заполнения';
                            }
                            if (val != _passwordController.text) {
                              return 'Пароли не совпадают';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            onPressed: _obsecure,
                            icon: SvgPicture.asset(
                              _isObsecure.value
                                  ? AppImages.eyePasswordOpenSvg
                                  : AppImages.eyePasswordCloseSvg,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                BlocBuilder<MegaKassaGetStepsInfoCubit, GetStepsInfoState>(
                  bloc: _infoCubit,
                  builder: (context, state) {
                    return _buildField(
                      array: state.mapOrNull(
                        success: (value) =>
                            value.info?.models
                                ?.map((e) => e.definition ?? '')
                                .toList() ??
                            [],
                      ),
                      controller: _modelController,
                      isLoading: state.isLoading,
                      title: 'Модель кассы',
                    );
                  },
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required String title,
    required TextEditingController controller,
    required List<String>? array,
    required bool isLoading,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (array != null && array.isNotEmpty) {
          IshkerDialog.showDraggableBottomSheet(
            context: context,
            maxChildSize: 0.7,
            initialChildSize: 0.7,
            isScrollControlled: true,
            title: title,
            child: MegaKassaSearchBottomSheet(
              array: array,
              title: title,
              onSelected: (value) {
                Navigator.pop(context);
                controller.text = value;
                _validate(null);
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

  void _obsecure() {
    _isObsecure.value = !_isObsecure.value;
  }
}

class _RequirementsItem extends StatelessWidget {
  const _RequirementsItem({
    Key? key,
    required this.isFilled,
    required this.title,
  }) : super(key: key);

  final bool isFilled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: isFilled
                ? AppColors.color54B25AMain
                : AppColors.color2C2C2CBlack.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: AppTextStyles.s14W400(color: AppColors.color2C2C2CBlack),
        ),
      ],
    );
  }
}
