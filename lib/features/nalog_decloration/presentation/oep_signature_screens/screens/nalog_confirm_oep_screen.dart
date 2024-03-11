import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/oep_signature_screens/cubits/oep_signature_check_cubit/oep_signature_check_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/oep_signature_screens/cubits/oep_signature_send_otp_cubit/oep_signature_send_otp_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/oep_signature_screens/widgets/nalog_sms_confirm_sheet.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class NalogConfirmOepScreen extends StatelessWidget {
  const NalogConfirmOepScreen({
    super.key,
    required this.nalogNameModel,
    required this.sendModel,
  });
  final NalogNameModel nalogNameModel;
  final Map<String, dynamic> sendModel;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<OepSignatureCheckCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<OepSignatureSendOtpCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: RotatedBox(
            quarterTurns: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  AppImages.arrowForwardIcon,
                  height: 10,
                ),
              ),
            ),
          ),
        ),
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
                Expanded(
                  child: BlocBuilder<OepSignatureCheckCubit,
                      OepSignatureCheckState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) =>
                            error.contains('не зарегистрирована в системе')
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppErrorText(error: error),
                                      const SizedBox(height: 12),
                                      CustomButton(
                                        onPress: () {
                                          AppRouting.pushFunction(
                                              const OEPRegisterRoute());
                                        },
                                        text: 'Перейти на сервис',
                                      ),
                                    ],
                                  )
                                : AppErrorText(error: error),
                        success: (model) => Column(
                          children: [
                            Text(
                              'Для этого выберите один из предложенных способов и введите сгенерированный одноразовый пароль',
                              style: AppTextStyles.s16W500(
                                  color: AppColors.color6B7583Grey),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            BlocConsumer<OepSignatureSendOtpCubit,
                                OepSignatureSendOtpState>(
                              listener: (context, state) {
                                state.whenOrNull(
                                  success: () {
                                    nalogSmsConfirmSheet(
                                      context,
                                      () => context
                                          .read<OepSignatureSendOtpCubit>()
                                          .resend(),
                                      sendModel,
                                      nalogNameModel.reportType,
                                    );
                                  },
                                );
                              },
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    if (model.smsType)
                                      CustomButton(
                                        isLoading: state.loadingSms,
                                        onPress: () {
                                          context
                                              .read<OepSignatureSendOtpCubit>()
                                              .sendSms('email');
                                        },
                                        text: 'Получить код через смс',
                                      ),
                                    if (model.emailType && model.smsType)
                                      const SizedBox(height: 16),
                                    if (model.emailType && model.smsType)
                                      Text(
                                        'или',
                                        style: AppTextStyles.s16W500(),
                                      ),
                                    if (model.emailType && model.smsType)
                                      const SizedBox(height: 16),
                                    if (model.emailType)
                                      CustomButton(
                                        isLoading: state.loadingEmail,
                                        loadingColor: AppColors.color54B25AMain,
                                        textColor: AppColors.color54B25AMain,
                                        borderColor: AppColors.color54B25AMain,
                                        color: Colors.white,
                                        onPress: () {
                                          context
                                              .read<OepSignatureSendOtpCubit>()
                                              .sendSms('email');
                                        },
                                        text: 'Получить код на почту',
                                      ),
                                  ],
                                );
                              },
                            ),
                            const Spacer(flex: 3),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
