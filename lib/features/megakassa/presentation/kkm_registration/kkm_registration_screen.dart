import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_first_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_second_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_step_third_entity.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_registration/cubit/gns_registration_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/theme/app_theme.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'widgets/menu_item.dart';

@RoutePage()
class MegaKassaKkmRegistrationScreen extends StatefulWidget {
  const MegaKassaKkmRegistrationScreen({super.key});

  @override
  State<MegaKassaKkmRegistrationScreen> createState() =>
      _MegaKassaKkmRegistrationScreenState();
}

class _MegaKassaKkmRegistrationScreenState
    extends State<MegaKassaKkmRegistrationScreen> {
  final _registrationEntity = ValueNotifier(MegaKassaKkmRegistrationEntity());
  // final _cubit = sl<MegaKassaKkmRegistrationCubit>();

  final _cubit = sl<MegaKassaGnsRegistrationCubit>();

  @override
  void dispose() {
    _registrationEntity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: ValueListenableBuilder(
        valueListenable: _registrationEntity,
        builder: (context, _, __) {
          return Scaffold(
            backgroundColor: const Color(0xffF3F4F5),
            persistentFooterButtons: [
              BlocProvider.value(
                value: _cubit,
                child: BlocConsumer<MegaKassaGnsRegistrationCubit,
                    GnsRegistrationState>(
                  bloc: _cubit,
                  listener: (context, state) {
                    state.whenOrNull(
                      error: AppSnackBar.showSnackBar,
                      success: (methods, _, kkmRegEntity, __) {
                        context.router.replace(
                          MegaKassaGnsConfirmationRoute(
                            types: methods,
                            registrationKkmEntity: kkmRegEntity,
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return CustomButton(
                      aroundButtonPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      onPress: () {
                        _cubit.getMethods(
                          kkmRegistrationEntity: _registrationEntity.value,
                        );
                      },
                      radius: 16,
                      text: 'Зарегистрировать кассу',
                      isFullFilled: [
                        _registrationEntity.value.step1Entity,
                        _registrationEntity.value.step2Entity,
                        _registrationEntity.value.step3Entity
                      ].every((e) => e != null),
                      isLoading: state.isLoading,
                    );
                  },
                ),
              ),
            ],
            appBar: CustomAppBar(
              title: 'Регистрация ККМ',
              titleTextStyle: AppTextStyles.s16W700(
                color: AppColors.color2C2C2CBlack,
              ),
              backgroundColor: const Color(0xffF3F4F5),
              centerTitle: false,
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              children: [
                _MenuItem(
                  title: 'Объекты предпринимательства',
                  canFill: true,
                  isFilled: _registrationEntity.value.step1Entity != null,
                  onPressed: () {
                    context.router
                        .push(
                      MegaKassaKkmRegistrationStep1Route(
                        stepEntity: _registrationEntity.value.step1Entity,
                      ),
                    )
                        .then((value) {
                      if (value is MegaKassaKkmRegistrationStep1Entity) {
                        _registrationEntity.value =
                            _registrationEntity.value.copyWith(
                          step1entity: value,
                        );
                      }
                    });
                  },
                ),
                const SizedBox(height: 8),
                _MenuItem(
                  title: 'Адрес объекта',
                  isFilled: _registrationEntity.value.step2Entity != null,
                  canFill: _registrationEntity.value.step1Entity != null,
                  onPressed: () {
                    context.router
                        .push(
                      MegaKassaKkmRegistrationStep2Route(
                        stepEntity: _registrationEntity.value.step2Entity,
                      ),
                    )
                        .then((value) {
                      if (value is MegaKassaKkmRegistrationStep2Entity) {
                        _registrationEntity.value =
                            _registrationEntity.value.copyWith(
                          step2Entity: value,
                        );
                      }
                    });
                  },
                ),
                const SizedBox(height: 8),
                _MenuItem(
                  title: 'ККМ',
                  isFilled: _registrationEntity.value.step3Entity != null,
                  canFill: _registrationEntity.value.step2Entity != null,
                  onPressed: () {
                    context.router
                        .push(
                      MegaKassaKkmRegistrationStep3Route(
                        stepEntity: _registrationEntity.value.step3Entity,
                      ),
                    )
                        .then((value) {
                      if (value is MegaKassaKkmRegistrationStep3Entity) {
                        _registrationEntity.value =
                            _registrationEntity.value.copyWith(
                          step3Entity: value,
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
