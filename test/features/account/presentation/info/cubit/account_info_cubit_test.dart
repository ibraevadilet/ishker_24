import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';
import '../../../../../utils/constants.dart';

void main() async {
  late MockAccountInfoUseCase useCase;
  late AccountInfoCubit cubit;

  setUp(() {
    useCase = MockAccountInfoUseCase();
    cubit = AccountInfoCubit(useCase);
  });

  group('AccountInfoCubit.edit()', () {
    blocTest<AccountInfoCubit, AccountInfoState>(
      'success',
      build: () => cubit,
      setUp: () => when(() => useCase.call(tAccount.account)).thenAnswer(
        (_) async => Success(tAccount),
      ),
      act: (bloc) => bloc.load(tAccount.account),
      expect: () => [AccountInfoLoading(), AccountInfoSuccess(tAccount)],
      verify: (bloc) {
        verify(() => useCase.call(tAccount.account)).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );

    blocTest<AccountInfoCubit, AccountInfoState>(
      'failure',
      build: () => cubit,
      setUp: () => when(() => useCase.call(tAccount.account)).thenAnswer(
        (_) async => Failure(tDioException),
      ),
      act: (bloc) => bloc.load(tAccount.account),
      expect: () => [AccountInfoLoading(), AccountInfoFailure(tDioException)],
      verify: (bloc) {
        verify(() => useCase.call(tAccount.account)).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );
  });
}
