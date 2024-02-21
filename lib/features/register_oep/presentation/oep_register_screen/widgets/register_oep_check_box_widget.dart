import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/get_terms_cubit/get_terms_cubit.dart';
import 'package:ishker_24/features/register_oep/presentation/oep_register_screen/cubits/register_oep_cubit/register_oep_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class RegisterOEPCheckBoxWidget extends StatefulWidget {
  const RegisterOEPCheckBoxWidget({super.key});
  @override
  State<RegisterOEPCheckBoxWidget> createState() =>
      _RegisterOEPCheckBoxWidgetState();
}

class _RegisterOEPCheckBoxWidgetState extends State<RegisterOEPCheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          child: Checkbox(
            activeColor: AppColors.color54B25AMain,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: const BorderSide(
              width: 2.0,
            ),
            value: isChecked,
            onChanged: (val) {
              setState(() {
                isChecked = val!;
              });
              context.read<RegisterOepCubit>().getIsChecked(isChecked);
            },
          ),
        ),
        const SizedBox(width: 14),
        BlocBuilder<GetTermsCubit, GetTermsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(
                  child: AppIndicator(color: AppColors.color54B25AMain)),
              error: (error) => AppErrorText(error: error),
              success: (path) => Expanded(
                child: GestureDetector(
                  onTap: () async => AppRouting.pushFunction(
                    PdfViewRoute(path: path),
                  ),
                  child: Text(
                    'Я соглашаюсь на создание учетной записи в системе ЕСИ и предоставляю необходимую информацию для регистрации.',
                    style: AppTextStyles.s14W400().copyWith(
                      color: AppColors.color34C759Green,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.color34C759Green,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
