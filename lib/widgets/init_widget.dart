import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/features/bottom_navigator/logic/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:ishker_24/server/service_locator.dart';
import 'package:ishker_24/translations/codegen_loader.g.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      supportedLocales: const [
        Locale('ru'),
        Locale('ky'),
      ],
      fallbackLocale: const Locale('ru'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<BottomNavigatorCubit>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
