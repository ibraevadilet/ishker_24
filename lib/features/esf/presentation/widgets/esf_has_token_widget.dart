import 'package:flutter/material.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_text_styles.dart';
import 'package:ishker_24/widgets/custom_button.dart';

class EsfHasTokenTokenWidget extends StatelessWidget {
  const EsfHasTokenTokenWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomButton(
            onPress: () => AppRouting.pushFunction(const EsfIncomeRoute()),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Приобретение',
                  style: AppTextStyles.s18W500(),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPress: () => AppRouting.pushFunction(const EsfInvoiceRoute()),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Реализация',
                  style: AppTextStyles.s18W500(),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
