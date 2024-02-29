import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_registration/cubit/gns_registration_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_text_fields.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

class MegaKassaGnsRegistrationScreen extends StatefulWidget {
  const MegaKassaGnsRegistrationScreen({super.key});

  @override
  State<MegaKassaGnsRegistrationScreen> createState() =>
      _MegaKassaGnsRegistrationScreenState();
}

class _MegaKassaGnsRegistrationScreenState
    extends State<MegaKassaGnsRegistrationScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bikController = TextEditingController();
  final _rsController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _okpoController = TextEditingController();
  final _gnsSolutionController = TextEditingController();
  final _isFullFilled = ValueNotifier(false);
  final _isObsecure = ValueNotifier(true);

  bool _firstCorrect = false;
  bool _secondCorrect = false;

  void _obsecure() {
    _isObsecure.value = !_isObsecure.value;
  }

  void _validatePassword(_) {
    if (_passwordController.text.length >= 8) {
      _firstCorrect = true;
    } else {
      _firstCorrect = false;
    }

    if (_passwordController.text.contains(RegExp(r'[!_^&]'))) {
      _secondCorrect = true;
    } else {
      _secondCorrect = false;
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _validate(_) {
    if (_loginController.text.trim().isNotEmpty &&
        _passwordController.text.trim().isNotEmpty &&
        _gnsSolutionController.text.trim().isNotEmpty &&
        _okpoController.text.trim().isNotEmpty &&
        _addressController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty) {
      _isFullFilled.value = true;
    } else {
      _isFullFilled.value = false;
    }
  }

  final _cubit = sl<MegaKassaGnsRegistrationCubit>();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _bikController.dispose();
    _rsController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _okpoController.dispose();
    _gnsSolutionController.dispose();
    _isFullFilled.dispose();
    _isObsecure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: BlocProvider.value(
        value: _cubit,
        child: Scaffold(
          backgroundColor: const Color(0xffF3F4F5),
          persistentFooterButtons: [
            BlocConsumer<MegaKassaGnsRegistrationCubit, GnsRegistrationState>(
              bloc: _cubit,
              listener: (context, state) {
                state.whenOrNull(
                  error: AppSnackBar.showSnackBar,
                  success: (methods, registrationEntity, _, __) {
                    context.router.replace(
                      MegaKassaGnsConfirmationRoute(
                        types: methods,
                        registrationEntity: registrationEntity!,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: _isFullFilled,
                  builder: (context, _, __) {
                    return CustomButton(
                      aroundButtonPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      onPress: () {
                        if ((formKey.currentState?.validate() ?? false) &&
                            _firstCorrect &&
                            _secondCorrect) {
                          final phone = _phoneController.text
                              .replaceAll(' ', '')
                              .replaceAll('-', '')
                              .replaceAll(')', '')
                              .replaceAll('(', '');

                          final registrationEntity =
                              MegaKassaGnsRegistrationRequestEntity(
                            login: _loginController.text,
                            password: _passwordController.text,
                            address: _addressController.text,
                            bik: _bikController.text,
                            checkingAccount: _rsController.text,
                            msisdn: '996$phone',
                            okpo: _okpoController.text,
                            registrationCertificateNumber:
                                _gnsSolutionController.text,
                          );

                          _cubit.getMethods(
                              registrationEntity: registrationEntity);
                        }
                      },
                      radius: 16,
                      text: 'Зарегистрироваться',
                      isFullFilled: _isFullFilled.value,
                      isLoading: state.isLoading,
                    );
                  },
                );
              },
            ),
          ],
          appBar: CustomAppBar(
            title: 'Регистрация физ. лица в ГНС',
            titleTextStyle: AppTextStyles.s16W700(
              color: AppColors.color54B25AMain,
            ),
            backgroundColor: const Color(0xffF3F4F5),
            centerTitle: false,
          ),
          body: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomTextField(
                  labelText: 'Логин',
                  controller: _loginController,
                  onChanged: _validate,
                  validator: AppInputValidators.emptyValidator,
                  maxLength: 200,
                ),
                const SizedBox(height: 8),
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
                          const SizedBox(height: 8),
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
                          const SizedBox(height: 8),
                          _RequirementsItem(
                            isFilled: _secondCorrect,
                            title: 'минимум 1 спец. символ (!_^&)',
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Бик',
                  controller: _bikController,
                  maxLength: 6,
                  validator: AppInputValidators.bikValidator,
                  keyboardType: TextInputType.number,
                  onChanged: _validate,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Расчетный счет',
                  controller: _rsController,
                  validator: AppInputValidators.checkingAccountValidator,
                  keyboardType: TextInputType.number,
                  onChanged: _validate,
                  maxLength: 16,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Фактический адрес',
                  maxLength: 200,
                  controller: _addressController,
                  validator: AppInputValidators.emptyValidator,
                  onChanged: _validate,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Контактный телефон',
                  controller: _phoneController,
                  onChanged: _validate,
                  prefixText: '+996 ',
                  validator: AppInputValidators.phoneValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    AppInputFormatters.phoneFormatter,
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Окпо',
                  controller: _okpoController,
                  maxLength: 10,
                  validator: AppInputValidators.okpoValidator,
                  keyboardType: TextInputType.number,
                  onChanged: _validate,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  labelText: 'Решение ГНС о регистр. / № патента',
                  controller: _gnsSolutionController,
                  maxLength: 50,
                  onChanged: _validate,
                  validator: AppInputValidators.emptyValidator,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
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
