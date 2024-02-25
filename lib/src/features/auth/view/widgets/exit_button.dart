import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () => {},
      child: Text(
        'Выйти',
        style: AppTextStyles.s18W400(color: AppColors.color36424BGrey),
      ),
    );
    // return BlocProvider(
    //   create: (context) => sl<ExitCubit>(),
    //   child: BlocBuilder<ExitCubit, ExitState>(
    //     builder: (context, state) {
    //       return state.isLoading
    //           ? const AppIndicator(color: AppColors.esiMainBlueColor)
    //           : TextButton(
    //               onPressed: onTap ?? () => context.read<ExitCubit>().exit(),
    //               child: Text(
    //                 'Выйти',
    //                 style:
    //                     AppTextStyles.s18W400(color: AppColors.color36424BGrey),
    //               ),
    //             );
    //     },
    //   ),
    // );
  }
}
