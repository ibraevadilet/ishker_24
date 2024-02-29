import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/cubits/get_nalog_names_cubit/get_nalog_names_cubit.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class NalogNamesWidget extends StatelessWidget {
  const NalogNamesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetNalogNamesCubit>(),
      child: BlocBuilder<GetNalogNamesCubit, GetNalogNamesState>(
        builder: (context, state) {
          return state.when(
            loading: () => const AppIndicator(),
            error: (error) => AppErrorText(error: error),
            success: (model) => ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  switch (model[index].reportType) {
                    case '091_4_2':
                      AppRouting.pushFunction(
                        Route9142(
                          model: model[index],
                        ),
                      );
                      break;
                    case '091_4':
                      AppRouting.pushFunction(
                        Route914(
                          model: model[index],
                        ),
                      );
                      break;
                    case '091_4_1':
                      AppRouting.pushFunction(
                        Route9141(
                          model: model[index],
                        ),
                      );
                      break;
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.edNalogIcon),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          model[index].name,
                          style: AppTextStyles.s16W500(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: model.length,
            ),
          );
        },
      ),
    );
  }
}
