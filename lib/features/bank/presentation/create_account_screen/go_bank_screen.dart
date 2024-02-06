import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class GoBankScreen extends StatelessWidget {
  const GoBankScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(AppImages.bankImage),
              const Text(
                'Чтобы открыть счет, вам необходимо\nобратиться в банк!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Обратитесь в ближайший филиал\nРСК банка для регистрации',
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                onPress: () => AppRouting.pushAndPopUntilFunction(
                    const BottomNavigatorRoute()),
                text: 'На главную',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
