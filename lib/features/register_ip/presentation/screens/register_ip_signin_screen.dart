// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_gns_pdf_cubit/get_gns_pdf_cubit.dart';
import 'package:ishker_24/features/register_ip/presentation/widgets/register_ip_check_box_widget.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class RegisterIpSigninScreen extends StatefulWidget {
  const RegisterIpSigninScreen({super.key});

  @override
  State<RegisterIpSigninScreen> createState() => _RegisterIpSigninScreenState();
}

class _RegisterIpSigninScreenState extends State<RegisterIpSigninScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetGnsPdfCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.signatureImage,
                  color: AppColors.color6B7583Grey.withOpacity(0.25),
                ),
                const Spacer(),
                Text(
                  'Для регистрации ИП необходимо\nподтвердить заявку электронной подписью\n(ОЭП) и дать согласие на обработку\nперсональных данных, включая\nинформацию о налоговой тайне.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s16W500(),
                ),
                const SizedBox(height: 16),
                RegisterIPCheckBoxWidget(
                  onTap: (isCheckedFrom) {
                    isChecked = isCheckedFrom;
                  },
                ),
                const Spacer(),
                CustomButton(
                  radius: 16,
                  color: AppColors.color54B25AMain,
                  onPress: () {
                    if (isChecked) {
                      AppRouting.pushFunction(
                        const RegisterIpConfirmOepRoute(),
                      );
                    }
                  },
                  text: 'Подписать',
                ),
                const SizedBox(height: 8),
                CustomButton(
                  color: Colors.transparent,
                  onPress: () {
                    context.router.pop();
                  },
                  text: 'Отмена',
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
