import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class SettingsAboutScreen extends StatelessWidget {
  const SettingsAboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.backgroundColor,
          title: 'О приложении',
          centerTitle: false,
        ),
        body: Center(
          child: Text(
            'О приложении',
          ),
        ));
  }
}
