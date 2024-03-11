import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/generate_pdf_review_cubit/generate_pdf_review_cubit.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/reports_screens/cubits/get_statis_fileds_cubit/get_statis_fileds_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/app_error_text.dart';
import 'package:ishker_24/widgets/app_indicator.dart';

class ProviderScaffoldBackgroundWidgets extends StatefulWidget {
  const ProviderScaffoldBackgroundWidgets({
    super.key,
    required this.builder,
    required this.model,
  });
  final Widget Function(Map<String, dynamic> model) builder;
  final NalogNameModel model;

  @override
  State<ProviderScaffoldBackgroundWidgets> createState() =>
      _ProviderScaffoldBackgroundWidgetsState();
}

class _ProviderScaffoldBackgroundWidgetsState
    extends State<ProviderScaffoldBackgroundWidgets> {
  final scrollConroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetStatisFiledsCubit>()
            ..getStaticFields(widget.model.reportType),
        ),
        BlocProvider(
          create: (context) => sl<GeneratePdfReviewCubit>(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
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
                      widget.model.name,
                      style: AppTextStyles.s18W500(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<GetStatisFiledsCubit, GetStatisFiledsState>(
                  builder: (context, state) => state.when(
                    loading: () => const AppIndicator(),
                    error: (error) => AppErrorText(error: error),
                    success: (model) => RawScrollbar(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      radius: const Radius.circular(12),
                      trackColor: AppColors.color32D681Green,
                      thumbColor: AppColors.color32D681Green,
                      thumbVisibility: true,
                      controller: scrollConroller,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        controller: scrollConroller,
                        child: widget.builder(model),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
