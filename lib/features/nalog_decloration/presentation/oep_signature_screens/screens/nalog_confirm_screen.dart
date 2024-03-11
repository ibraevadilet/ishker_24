import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/presentation/oep_signature_screens/widgets/confirm_container.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/theme/app_colors.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class NalogConfirmScreen extends StatelessWidget {
  const NalogConfirmScreen({
    super.key,
    required this.nalogNameModel,
    required this.sendModel,
  });
  final NalogNameModel nalogNameModel;
  final Map<String, dynamic> sendModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                AppImages.arrowForwardIcon,
                height: 10,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 22),
              ConfirmContainer(reportTypeName: nalogNameModel.name),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63),
                child: CustomButton(
                  onPress: () => AppRouting.pushFunction(
                    NalogConfirmOepRoute(
                      nalogNameModel: nalogNameModel,
                      sendModel: sendModel,
                    ),
                  ),
                  text: 'Подписать',
                  radius: 18,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPress: () {
                  Navigator.pop(context);
                },
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
