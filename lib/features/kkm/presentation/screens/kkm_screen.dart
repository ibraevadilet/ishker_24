import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ishker_24/widgets/custom_app_bar.dart';

@RoutePage()
class KKMScreen extends StatelessWidget {
  const KKMScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'KKM'),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
