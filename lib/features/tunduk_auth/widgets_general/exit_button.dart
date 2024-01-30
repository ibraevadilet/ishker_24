import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/tunduk_auth/widgets_general/exit_cubit/exit_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExitCubit>(),
      child: BlocBuilder<ExitCubit, ExitState>(
        builder: (context, state) {
          return state.isLoading
              ? const AppIndicator(color: AppColors.esiMainBlueColor)
              : TextButton(
                  onPressed: () {
                    context.read<ExitCubit>().exit();
                  },
                  child: Text(
                    'Выйти',
                    style:
                        AppTextStyles.s18W400(color: AppColors.color36424BGrey),
                  ),
                );
        },
      ),
    );
  }
}
