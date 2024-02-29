import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/enums/kkm_status.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_confirmation/cubit/gns_confirmation_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_registration/cubit/gns_registration_cubit.dart';
import 'package:ishker_24/features/megakassa/presentation/megakassa_sms_confirm_sheet.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/main.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

@RoutePage()
class MegaKassaGnsConfirmationScreen extends StatefulWidget {
  const MegaKassaGnsConfirmationScreen({
    super.key,
    required this.types,
    this.registrationEntity,
    this.registrationKkmEntity,
  });

  final List<PinCodeTypesModel> types;
  final MegaKassaGnsRegistrationRequestEntity? registrationEntity;
  final MegaKassaKkmRegistrationEntity? registrationKkmEntity;

  @override
  State<MegaKassaGnsConfirmationScreen> createState() =>
      _MegaKassaGnsConfirmationScreenState();
}

class _MegaKassaGnsConfirmationScreenState
    extends State<MegaKassaGnsConfirmationScreen> {
  final _getConfirmationCubit = sl<MegaKassaGnsConfirmationCubit>();
  final _verifyCodeCubit = sl<MegaKassaGnsRegistrationCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _getConfirmationCubit),
        BlocProvider.value(value: _verifyCodeCubit),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'Подтверждение',
                  style: AppTextStyles.s24W700(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Для этого выберите один из предложенных способов и введите сгенерированный одноразовый пароль',
                  style:
                      AppTextStyles.s16W500(color: AppColors.color6B7583Grey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                BlocConsumer<MegaKassaGnsConfirmationCubit,
                    GnsConfirmationState>(
                  bloc: _getConfirmationCubit,
                  listener: (context, state) {
                    state.whenOrNull(
                      error: AppSnackBar.showSnackBar,
                      success: (method) {
                        if (widget.registrationEntity != null) {
                          megaKassaSmsConfirmSheet(
                            mainContext: context,
                            registrationEntity: widget.registrationEntity,
                            onResend: () {
                              _getConfirmationCubit.getGnsConfirmation(
                                method: method,
                                isResend: true,
                              );
                            },
                            onSuccess: (_) {
                              context.router.replace(
                                SuccessOrFailureRoute(
                                  onPress: () {
                                    appRouter.replace(
                                      const MegaKassaEntryRoute(),
                                    );
                                  },
                                  title: 'Регистрация прошла успешно!',
                                  subtitle:
                                      'Вы успешно зарегистрированы, можете войти в Личный Кабинет',
                                  buttonText: 'Войти в ЛК',
                                ),
                              );
                            },
                          );
                        }

                        if (widget.registrationKkmEntity != null) {
                          megaKassaSmsConfirmSheet(
                            mainContext: context,
                            registrationEntity: widget.registrationEntity,
                            onResend: () {
                              _getConfirmationCubit.getGnsConfirmation(
                                method: method,
                                isResend: true,
                              );
                            },
                            onSuccess: (kkm) {
                              context.router.replace(
                                SuccessOrFailureRoute(
                                  onPress: () {
                                    appRouter.replace(
                                      MegaKassaKkmDetailRoute(
                                          cashbox: kkm ??
                                              MegaKassaKkmEntity(
                                                isMegaKassa: false,
                                                name: 'Произошла ошибка',
                                                rnm: '',
                                                status: KkmStatus.registration,
                                              )),
                                    );
                                  },
                                  title: 'Касса успешно зарегистрирована',
                                  subtitle: 'РНМ кассы: ${kkm?.rnm ?? '-'}',
                                  buttonText: 'Посмотреть кассу',
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  },
                  builder: (context, state) {
                    return widget.types.length == 1
                        ? CustomButton(
                            loadingColor: widget.types.first.authType == 'email'
                                ? AppColors.color54B25AMain
                                : Colors.white,
                            isLoading: state.isLoadingEmail,
                            textColor: widget.types.first.authType == 'email'
                                ? AppColors.color54B25AMain
                                : Colors.white,
                            borderColor: widget.types.first.authType == 'email'
                                ? AppColors.color54B25AMain
                                : null,
                            color: widget.types.first.authType == 'email'
                                ? Colors.white
                                : AppColors.color54B25AMain,
                            onPress: () {
                              _getConfirmationCubit.getGnsConfirmation(
                                method: widget.types.first.authType,
                              );
                            },
                            text: widget.types.first.authType == 'email'
                                ? 'Получить код на почту'
                                : 'Получить код через смс',
                          )
                        : Column(
                            children: [
                              CustomButton(
                                isLoading: state.isLoadingEmail,
                                onPress: () {
                                  _getConfirmationCubit.getGnsConfirmation(
                                    method: widget.types.first.authType,
                                  );
                                },
                                text: smsType(widget.types[0].authType),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'или',
                                style: AppTextStyles.s16W500(),
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                loadingColor: AppColors.color54B25AMain,
                                isLoading: state.isLoadingSms,
                                textColor: AppColors.color54B25AMain,
                                borderColor: AppColors.color54B25AMain,
                                color: Colors.white,
                                onPress: () {
                                  _getConfirmationCubit.getGnsConfirmation(
                                    method: widget.types[1].authType,
                                  );
                                },
                                text: smsType(widget.types[1].authType),
                              ),
                            ],
                          );
                  },
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String smsType(String authType) {
  switch (authType) {
    case 'email':
      return 'Получить код на почту';
    case 'sms':
      return 'Получить код через смс';
    default:
      return 'Получить код через смс';
  }
}
