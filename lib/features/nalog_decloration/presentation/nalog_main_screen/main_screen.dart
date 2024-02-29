import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/widgets/my_reports_widget.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/nalog_main_screen/widgets/nalog_names_widget.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/theme/app_text_styles.dart';

@RoutePage()
class NalogMainScreen extends StatelessWidget {
  const NalogMainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text('Единый налог'),
        titleTextStyle: AppTextStyles.s20W500(),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.colorF3F4F5Grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  labelStyle: AppTextStyles.s16W500(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.color32D681Green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorColor: AppColors.color32D681Green,
                  labelColor: Colors.white,
                  dividerHeight: 0,
                  tabs: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 12,
                      ),
                      child: const Text('Список отчетов'),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 12,
                      ),
                      child: const Text('Мои отчеты'),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NalogNamesWidget(),
                  MyReportsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
