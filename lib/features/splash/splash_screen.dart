import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';
import 'package:ishker_24/features/account/presentation/transfer/transfer_screen.dart';
import 'package:ishker_24/features/splash/splash_cubit/splash_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<SplashCubit>(
    //   create: (context) => sl<SplashCubit>()..getFirstOpenStatus(),
    //   child: Scaffold(
    //     body: BlocBuilder<SplashCubit, SplashState>(
    //       builder: (context, state) {
    //         return Center(
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 54),
    //             child: Image.asset(AppImages.logo),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );

    return TransferScreen(
      model: AccountModel(
        account: '1231392378598375937',
        currency: '417',
        bic: 'bic',
        depname: 'depname',
        address: 'address',
        pin: '213213123123123',
        amount: 1000,
        amountFree: 900,
        amountUnfree: 100,
      ),
      inn: '22607199200135',
    );
  }
}
