import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/data/models/auth_model.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/cubits/get_confirm_code_cubit/get_confirm_code_cubit.dart';
import 'package:ishker_24/features/tunduk_auth/authorization_tunduk/presentation/auth_send_confirm_screen/widgets/email_number_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/esi_background_image_widget.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/top_title_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class AuthSendConfirmScreen extends StatelessWidget {
  const AuthSendConfirmScreen({super.key, required this.authModel});
  final AuthModel authModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetConfirmCodeCubit>(),
      child: ScaffoldBackgroundImageWidget(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const TopTitleWidget(
              title: 'Подтверждение',
              subTitle:
                  'Для этого выберите один из предложенных способов и введите сгенерированный одноразовый пароль в специальное окно.',
            ),
            EmailNumberWidget(
              email: authModel.body
                      .where((e) => e.method == 'Email')
                      .first
                      .emailFragment ??
                  '',
              number: authModel.body
                      .where((e) => e.method == 'Sms')
                      .first
                      .phoneNumberFragment ??
                  '',
            ),
            const SizedBox(height: 42),
            Expanded(
              child: Column(
                children: authModel.body
                    .map<Widget>(
                      (e) => Expanded(
                        child: Column(
                          children: [
                            BlocBuilder<GetConfirmCodeCubit,
                                GetConfirmCodeState>(
                              builder: (context, state) {
                                return CustomButton(
                                  loadingColor: e.method == 'Telegram'
                                      ? AppColors.esiMainBlueColor
                                      : Colors.white,
                                  isLoading: e.method == 'Telegram'
                                      ? state.loadingTelegram
                                      : e.method == 'Sms'
                                          ? state.loadingSms
                                          : state.loadingEmail,
                                  textColor: e.method == 'Telegram'
                                      ? AppColors.esiMainBlueColor
                                      : Colors.white,
                                  borderColor: e.method == 'Telegram'
                                      ? AppColors.esiMainBlueColor
                                      : Colors.white,
                                  color: e.method == 'Telegram'
                                      ? Colors.white
                                      : AppColors.esiMainBlueColor,
                                  onPress: () {
                                    context
                                        .read<GetConfirmCodeCubit>()
                                        .getConfirmCode(
                                          method: e.method,
                                          twoFactorSessionToken:
                                              authModel.twoFactorSessionToken,
                                        );
                                    // AppRouting.pushFunction(
                                    //   const AuthConfirmCodeRoute(),
                                    // );
                                  },
                                  text: getText(e.method),
                                );
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

String getText(String method) {
  switch (method) {
    case 'Telegram':
      return 'Получить код через Telegram';
    case 'Email':
      return 'Получить код через почту';
    case 'Sms':
      return 'Получить код через СМС';
    default:
      return '';
  }
}
