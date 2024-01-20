import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/cubits/check_has_ip_cubit/check_has_ip_cubit.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_bank_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/empty_ip_widget.dart';
import 'package:ishker_24/features/home/presentation/home_main_screen/widgets/full_has_widget.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckHasIpCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CheckHasIpCubit, CheckHasIpState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const AppIndicator(),
                  error: (error) => AppErrorText(error: error),
                  emptyIp: () => const EmptyIpWidget(),
                  emptyBank: () => const EmptyBankWidget(),
                  fullHas: () => const FullHasWidget(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
