import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class EsfScreen extends StatelessWidget {
  const EsfScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Электронная счет-фактура'),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
