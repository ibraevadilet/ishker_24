import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class SettingsAboutScreen extends StatelessWidget {
  const SettingsAboutScreen({
    super.key,
    required this.version,
    required this.buildNumber,
  });
  final String version;
  final String buildNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: 'О приложении',
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Версия приложения: $version',
            ),
            Text(
              'Номер сборки: $buildNumber',
            ),
          ],
        ),
      ),
    );
  }
}
