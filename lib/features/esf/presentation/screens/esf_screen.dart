import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/esf/presentation/cubits/esf_check_cubit/esf_check_cubit.dart';
import 'package:ishker_24/features/esf/presentation/widgets/esf_empty_token_widget.dart';
import 'package:ishker_24/features/esf/presentation/widgets/esf_has_token_widget.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class EsfScreen extends StatelessWidget {
  const EsfScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EsfCheckCubit>()..esfCheck(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'ЭСФ',
          centerTitle: false,
        ),
        body: BlocBuilder<EsfCheckCubit, EsfCheckState>(
          builder: (context, state) {
            return state.when(
              loading: () => const AppIndicator(),
              error: (error) => AppErrorText(error: error),
              hasToken: () => const EsfHasTokenTokenWidget(),
              emptyToken: () => const EsfEmptyTokenWidget(),
            );
          },
        ),
      ),
    );
  }
}
