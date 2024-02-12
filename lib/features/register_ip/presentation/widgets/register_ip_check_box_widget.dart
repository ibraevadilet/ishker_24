import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/register_ip/presentation/cubits/get_gns_pdf_cubit/get_gns_pdf_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class RegisterIPCheckBoxWidget extends StatefulWidget {
  const RegisterIPCheckBoxWidget({super.key, required this.onTap});
  final Function(bool isChecked) onTap;
  @override
  State<RegisterIPCheckBoxWidget> createState() =>
      _RegisterIPCheckBoxWidgetState();
}

class _RegisterIPCheckBoxWidgetState extends State<RegisterIPCheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGnsPdfCubit, GetGnsPdfState>(
      builder: (context, state) {
        return state.when(
          loading: () => const AppIndicator(),
          error: (error) => AppErrorText(error: error),
          success: (path) => Row(
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
                    widget.onTap(val!);
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    AppRouting.pushFunction(PdfViewRoute(path: path));
                  },
                  child: Text(
                    'Заявление (на Согласие/Отзыв) субъекта на сбор и обработку его персональных данных сведений, составляющих налоговую тайну',
                    style: AppTextStyles.s14W400().copyWith(
                      color: AppColors.color34C759Green,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.color34C759Green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
