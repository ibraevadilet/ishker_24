import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/src/app_router.dart';
import 'package:ishker_24/src/di.dart';
import 'package:ishker_24/src/features/auth/view/auth_cubit/auth_cubit.dart';
import 'package:ishker_24/src/features/auth/view/grnp/grnp_cubit/grnp_cubit.dart';

class CheckGrnpPage extends StatelessWidget {
  const CheckGrnpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GrnpCubit(
        authCubit: context.read<AuthCubit>(),
        checkGrnpUseCase: sl(),
      )..init(),
      child: BlocListener<GrnpCubit, GrnpState>(
        listener: (context, state) {
          switch (state) {
            case GrnpSuccess():
              Navigator.pushNamedAndRemoveUntil(
                context,
                homeRoute,
                (route) => false,
              );
            case GrnpFailure():
              Navigator.pushNamedAndRemoveUntil(
                context,
                grnpCreateRoute,
                (route) => false,
              );
            default:
          }
        },
        child: const Scaffold(
          body: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          ]),
        ),
      ),
    );
  }
}
