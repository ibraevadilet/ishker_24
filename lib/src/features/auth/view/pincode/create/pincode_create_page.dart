import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/errors/exceptions.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/extensions.dart';
import 'package:ishker_24/src/core/utils/request_status.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/domain/entity/confirm_code_entity.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/widgets/esi_background_image_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/number_key_board_for_pin_code.dart';
import 'package:ishker_24/src/features/auth/view/widgets/pin_code_input_widget.dart';
import 'package:ishker_24/src/features/auth/view/widgets/styled_toasts.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

import 'cubit/pincode_create_cubit.dart';

class PinCodePage extends StatelessWidget {
  const PinCodePage({super.key, this.confirm, this.isNew = false});

  final ConfirmCodeEntity? confirm;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PinCodeCreateCubit(
            setUseCase: sl(),
            authCubit: context.read<AuthCubit>(),
          ),
        ),
      ],
      child: BackgroundImageWidget(
        slivers: [
          SliverList.list(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset(AppImages.esiPinTextLogoWhite, height: 36),
                    const SizedBox(height: 32),
                    FittedBox(
                      child: Text(
                        isNew
                            ? 'Придумайте новый пин-код'
                            : 'Придумайте пин-код',
                        style: AppTextStyles.s22W400(
                          color: AppColors.color36424BGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    BlocConsumer<PinCodeCreateCubit, PinCodeCreateState>(
                      listenWhen: (p, c) => p.status != c.status,
                      listener: (context, state) {
                        final status = state.status;
                        switch (status) {
                          case RequestFailure():
                            AppSnackBar.showSnackBar(status.exception.message);
                          case RequestSuccess():
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              homeRoute,
                              (route) => false,
                            );
                          default:
                        }
                      },
                      buildWhen: (p, c) =>
                          p.first != c.first || p.second != c.second,
                      builder: (context, state) => PinCodeView(
                          key: ValueKey(
                            state.first.isNullOrEmpty ? 'first' : 'second',
                          ),
                          //TODO: change pincode
                          onCompleted: (val) => state.first.isNullOrEmpty
                              ? context.read<PinCodeCreateCubit>().firstPin(val)
                              : context
                                  .read<PinCodeCreateCubit>()
                                  .setPinCode(val)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PinCodeView extends StatefulWidget {
  const PinCodeView({
    super.key,
    required this.onCompleted,
    this.withBio = false,
  });

  final Function(String) onCompleted;
  final bool withBio;

  @override
  State<PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<PinCodeView> {
  //autodispose in pinput widget
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinCodeInputWidget(
          controller: _pinController,
          onCompleted: widget.onCompleted,
        ),
        const SizedBox(height: 20),
        NumberKeyBoardForPinCode(
          pinPutController: _pinController,
          onTapExit: () {
            context.read<AuthCubit>().exit();
            Navigator.pushNamedAndRemoveUntil(
              context,
              initialRoute,
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}

// // class PinCodeEnterWidget extends StatelessWidget {
// //   const PinCodeEnterWidget({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiBlocProvider(
// //       providers: [
// //         BlocProvider(
// //           create: (_) => PinCodeEnterCubit(
// //             deviceInfo: sl(),
// //             authCubit: context.read<AuthCubit>(),
// //             pinCodeCachedUseCase: sl(),
// //             pinCodeEnterUseCase: sl(),
// //           ),
// //         ),
// //         BlocProvider(
// //           create: (_) => BiometricCubit(
// //             cachedPinCodeUseCase: sl(),
// //             pinCodeEnterCubit: _.read<PinCodeEnterCubit>(),
// //           )..init(),
// //         ),
// //       ],
// //       child: const PinCodeEnterView(),
// //     );
// //   }
// // }
