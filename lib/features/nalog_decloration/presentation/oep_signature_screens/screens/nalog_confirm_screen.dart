import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/oep_signature_screens/widgets/confirm_container.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class NalogConfirmScreen extends StatelessWidget {
  const NalogConfirmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 1,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(AppImages.arrowDownIcon),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 22),
              const ConfirmContainer(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63),
                child: CustomButton(
                  onPress: () =>
                      AppRouting.pushFunction(const NalogConfirmOepRoute()),
                  text: 'Подписать',
                  radius: 18,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPress: () {},
                text: 'Отмена',
                color: Colors.transparent,
                textColor: AppColors.color6B7583Grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
