import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/formatters/input_formatters.dart';
import 'package:ishker_24/core/formatters/validators.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/tunduk_auth/recovery_password/presentation/recovery_password_enter_inn_screen/reset_password_cubit/reset_password_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';
import 'package:ishker_24/widgets/esi_text_filed.dart';

@RoutePage()
class RecoveryPasswordEnterInnScreen extends StatelessWidget {
  const RecoveryPasswordEnterInnScreen({super.key, this.isSmsRecovery = false});
  final bool isSmsRecovery;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: Builder(
          builder: (context) => Form(
            key: context.read<ResetPasswordCubit>().formKey,
            child: ListView(
              children: [
                TopTitleWidget(
                  title:
                      'Восстановить пароль через ${isSmsRecovery ? 'СМС' : 'почту'}',
                ),
                EsiTextFiled(
                  keyboardType: TextInputType.number,
                  hintText: 'Персональный номер',
                  prfixIcon: AppImages.personIconSvg,
                  validator: AppInputValidators.innValidator,
                  controller: context.read<ResetPasswordCubit>().pinController,
                ),
                const SizedBox(height: 12),
                isSmsRecovery
                    ? EsiTextFiled(
                        keyboardType: TextInputType.number,
                        hintText: 'Номер телефона',
                        prfixIcon: AppImages.phoneIconSvg,
                        controller: context
                            .read<ResetPasswordCubit>()
                            .contactController,
                        validator: AppInputValidators.phoneValidatorWith996,
                        inputFormatters: [
                          AppInputFormatters.phoneFormatterWith996,
                        ],
                      )
                    : EsiTextFiled(
                        hintText: 'Почта',
                        prfixIcon: AppImages.recoveryEmailIconSvg,
                        controller: context
                            .read<ResetPasswordCubit>()
                            .contactController,
                        validator: AppInputValidators.emptyValidator,
                      ),
                const SizedBox(height: 33),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      color: AppColors.esiMainBlueColor,
                      onPress: () {
                        context.read<ResetPasswordCubit>().resetPassword(
                              isSmsRecovery ? 'sms' : 'email',
                            );
                      },
                      text: 'Отправить код подтверждения',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
