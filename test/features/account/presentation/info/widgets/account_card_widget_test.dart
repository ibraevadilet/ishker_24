import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:ishker_24/features/account/presentation/info/widgets/account_card_widget.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/constants.dart';
import '../../../../../utils/ui_test_helper.dart';

class MockAccountInfoCubit extends Mock implements AccountInfoCubit {}

void main() {
  late MockAccountInfoCubit infoCubit;

  setUp(() => infoCubit = MockAccountInfoCubit());

  testWidgets('account card widget ...', (tester) async {
    await pumpWidget(
      tester,
      BlocProvider<AccountInfoCubit>(
        create: (_) => infoCubit,
        child: Scaffold(body: AccountCardWidget(account: tAccount.account)),
      ),
    );

    await tester.pumpAndSettle();
  });
}
