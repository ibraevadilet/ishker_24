import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/shapes.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/confirm_otp_cubit/confirm_otp_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/widgets/show_success_register_dialog.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/sms_code_input_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/spaces.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

Future<void> smsConfirmSheet(BuildContext context) async {
  final smsConroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    barrierColor: Colors.black.withOpacity(0.8),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: AppShapes.bottomNavigatorShape(),
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => sl<ConfirmOtpCubit>(),
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
                Text(
                  '0:59',
                  style: AppTextStyles.s14W700(
                    color: AppColors.color6B7583Grey,
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: formKey,
                  child: SmsCodeInputWidget(
                    controller: smsConroller,
                  ),
                ),
                const SizedBox(height: 16),
                BlocConsumer<ConfirmOtpCubit, ConfirmOtpState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (error) =>
                          AppSnackBar.showToastAbaveSheet(context, error),
                      success: () {
                        Navigator.pop(context);
                        showSuccessRegisterDialog(context);
                      },
                    );
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<ConfirmOtpCubit>()
                              .confirmOtp(smsConroller.text);
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
