import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/images/app_images.dart';

class NalogConfirmScreen extends StatelessWidget {
  const NalogConfirmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(AppImages.arrowDownIcon),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.signatureConfirmImage,
                  ),
                  const Expanded(
                    child: Text(
                      'Подтверждение\nзаявки',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
