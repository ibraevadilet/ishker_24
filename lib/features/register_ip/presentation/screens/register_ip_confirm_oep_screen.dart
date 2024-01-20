import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_pin_code_receiving_cubit/get_pin_code_receiving_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RegisterIpConfirmOepScreen extends StatelessWidget {
  const RegisterIpConfirmOepScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetPinCodeReceivingCubit>(),
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
                BlocBuilder<GetPinCodeReceivingCubit, GetPinCodeReceivingState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) => Column(
                        children: [
                          CustomButton(
                            onPress: () {},
                            text: 'Получить код через смс',
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'или',
                            style: AppTextStyles.s16W500(),
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            textColor: AppColors.color54B25AMain,
                            borderColor: AppColors.color54B25AMain,
                            color: Colors.white,
                            onPress: () {},
                            text: 'Получить код на почту',
                          ),
                        ],
                      ),
                    );
                  },
                ),
                CustomButton(
                  textColor: AppColors.color54B25AMain,
                  borderColor: AppColors.color54B25AMain,
                  color: Colors.white,
                  onPress: () {},
                  text: 'Получить код на почту',
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
