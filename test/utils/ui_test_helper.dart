import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/translations/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> pumpWidget(WidgetTester tester, Widget child) async {
  SharedPreferences.setMockInitialValues({});
  TestWidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await tester.pumpWidget(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      supportedLocales: const [Locale('ru'), Locale('ky')],
      fallbackLocale: const Locale('ru'),
      child: LocalizationsInj(child: child),
    ),
  );
}

class LocalizationsInj extends StatelessWidget {
  const LocalizationsInj({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: child,
    );
  }
}

BuildContext getContext(WidgetTester tester, Type type) =>
    tester.element(find.byType(type));

InkWell findInkWell(Key key) =>
    find.byKey(key).evaluate().first.widget as InkWell;
