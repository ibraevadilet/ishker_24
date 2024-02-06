import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/core/images/app_images.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/custom_button.dart';

@RoutePage()
class CreateAccountFinishScreen extends StatelessWidget {
  const CreateAccountFinishScreen({super.key});
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
              SvgPicture.asset(AppImages.successCreatedAccountIcon),
              const SizedBox(height: 24),
              const Text('Успешно!'),
              const SizedBox(height: 16),
              const Text(
                'Ваш счет успешно открыт\nНомер счета: XXXXXXXXXXXXXXXX',
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
