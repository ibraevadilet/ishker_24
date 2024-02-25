import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/widgets/esi_background_image_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/forgot_pin_text_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/number_key_board_for_pin_code.dart';
import 'package:ishker_24/src/features/auth/view/widgets/pin_code_input_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/styled_toasts.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

import 'biometric_cubit/biometric_cubit.dart';
import 'pincode_enter_cubit/pincode_enter_cubit.dart';

class PinCodeEnterPage extends StatelessWidget {
  const PinCodeEnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PinCodeEnterCubit(
            authCubit: context.read<AuthCubit>(),
            pinCodeCachedUseCase: sl(),
            pinCodeEnterUseCase: sl(),
          ),
        ),
        BlocProvider(
          create: (_) => BiometricCubit(
            cachedPinCodeUseCase: sl(),
            pinCodeEnterCubit: _.read<PinCodeEnterCubit>(),
          )..init(),
        ),
      ],
      child: BackgroundImageWidget(
        slivers: [
          SliverList.list(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: PinCodeEnterView(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PinCodeEnterView extends StatefulWidget {
  const PinCodeEnterView({super.key});

  @override
  State<PinCodeEnterView> createState() => _PinCodeEnterViewState();
}

class _PinCodeEnterViewState extends State<PinCodeEnterView> {
  //autodispose in pinput widget
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Image.asset(AppImages.esiPinTextLogoWhite, height: 36),
        const SizedBox(height: 32),
        Text(
          'Введите пин-код',
          style: AppTextStyles.s22W400(color: AppColors.color36424BGrey),
        ),
        const SizedBox(height: 12),
        BlocConsumer<PinCodeEnterCubit, PinCodeEnterState>(
          listener: (context, state) {
            switch (state) {
              case PinCodeEnterFailure():
                _pinController.clear();
                AppSnackBar.showSnackBar(state.exception.message);
              case PinCodeEnterSuccess():
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  grnpRoute,
                  (route) => false,
                );
              default:
            }
          },
          builder: (context, state) {
            return PinCodeInputWidget(
              controller: _pinController,
              onCompleted: (val) {
                context.read<PinCodeEnterCubit>().send(val);
                dev.log("onCompleted: $val");
              },
            );
          },
        ),
        const SizedBox(height: 20),
        BlocBuilder<BiometricCubit, BiometricState>(
          builder: (context, state) {
            return NumberKeyBoardForPinCode(
              pinPutController: _pinController,
              isBiometric: state.isSupported,
              type: state.type,
              onBioPressed: () => context.read<BiometricCubit>().check(),
              onTapExit: () {
                context.read<AuthCubit>().exit();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  initialRoute,
                  (route) => false,
                );
              },
            );
          },
        ),
        const ForgotPinTextWidget(),
      ],
    );
  }
}
