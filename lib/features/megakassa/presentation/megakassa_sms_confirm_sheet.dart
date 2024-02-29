import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/shapes.dart';
import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/presentation/gns_registration/cubit/gns_registration_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/timer_cubit/timer_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/spaces.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

Future<void> megaKassaSmsConfirmSheet({
  required BuildContext mainContext,
  required Function() onResend,
  required Function(MegaKassaKkmEntity? kkm) onSuccess,
  MegaKassaGnsRegistrationRequestEntity? registrationEntity,
  MegaKassaKkmRegistrationEntity? registrationKkmEntity,
}) async {
  final smsConroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    barrierColor: Colors.black.withOpacity(0.8),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: AppShapes.bottomNavigatorShape(),
    context: mainContext,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: sl<MegaKassaGnsRegistrationCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<TimerCubit>()..getTimer(60),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(bottom: context.bottomForBottomShhet),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.color6B7583Grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Text(
                  'Код подтверждения',
                  style: AppTextStyles.s24W700(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Введите код, который был отправлен вам',
                  style: AppTextStyles.s14W500(
                    color: AppColors.color6B7583Grey,
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<TimerCubit, TimerState>(
                  builder: (context, state) {
                    return state.when(
                      initial: (seconds) {
                        context.read<TimerCubit>().getTimer(seconds);
                        return Text(
                          secondsToMinutes(seconds),
                          style: AppTextStyles.s14W700(
                            color: AppColors.color6B7583Grey,
                          ),
                        );
                      },
                      resend: () => GestureDetector(
                        onTap: () {
                          onResend();
                          context.read<TimerCubit>().getTimer(60);
                        },
                        child: Text(
                          'Отправить код повторно',
                          style: AppTextStyles.s14W700(
                            color: AppColors.color6B7583Grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Form(
                  key: formKey,
                  child: SmsCodeInputWidget(
                    controller: smsConroller,
                  ),
                ),
                const SizedBox(height: 16),
                BlocConsumer<MegaKassaGnsRegistrationCubit,
                    GnsRegistrationState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (error) =>
                          AppSnackBar.showToastAbaveSheet(context, error),
                      success: (_, __, ___, kkm) {
                        Navigator.pop(context);
                        onSuccess(kkm);
                      },
                    );
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<MegaKassaGnsRegistrationCubit>()
                              .register(
                                registrationEntity: registrationEntity,
                                registrationKkmEntity: registrationKkmEntity,
                                pincode: smsConroller.text,
                              );
                        }
                      },
                      text: 'Отправить',
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

String secondsToMinutes(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;
  String formattedTime =
      '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  return formattedTime;
}
