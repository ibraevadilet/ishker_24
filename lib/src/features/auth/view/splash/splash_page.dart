import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/core/images/app_images.dart';
import 'package:ishker_24/src/core/utils/app_device_info.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/splash/cubit/splash_cubit.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(
        deviceId: sl<AppDeviceInfo>().id,
        authCubit: context.read<AuthCubit>(),
        existsUserUseCase: sl(),
        cachedPinUseCase: sl(),
        pinCodeCachedUseCase: sl(),
      )..init(),
      child: Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            switch (state) {
              case SplashSuccess():
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  pinCodeEnterRoute,
                  (Route<dynamic> route) => false,
                );
                break;
              case SplashFailure():
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  //TODO: delete
                  // pinCodeRoute,
                  // arguments: ,
                  loginRoute,
                  (Route<dynamic> route) => false,
                );
              default:
            }
          },
          builder: (context, state) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54),
              child: Image.asset(AppImages.logo),
            ),
          ),
        ),
      ),
    );
  }
}
