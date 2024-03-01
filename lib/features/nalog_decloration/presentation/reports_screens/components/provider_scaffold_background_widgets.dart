import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/generate_pdf_review_cubit/generate_pdf_review_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/get_statis_fileds_cubit/get_statis_fileds_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/send_saved_data_cubit/send_saved_data_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class ProviderScaffoldBackgroundWidgets extends StatelessWidget {
  const ProviderScaffoldBackgroundWidgets({
    super.key,
    required this.builder,
    required this.model,
  });
  final Widget Function(Map<String, dynamic> model) builder;
  final NalogNameModel model;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<GetStatisFiledsCubit>()..getStaticFields(model.reportType),
        ),
        BlocProvider(
          create: (context) => sl<SendSavedDataCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<GeneratePdfReviewCubit>(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        model.name,
                        style: AppTextStyles.s18W500(),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child:
                      BlocBuilder<GetStatisFiledsCubit, GetStatisFiledsState>(
                    builder: (context, state) => state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) => SingleChildScrollView(
                        child: builder(model),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
