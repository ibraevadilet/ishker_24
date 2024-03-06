import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';

import '../../../../../utils/constants.dart';

void main() {
  group('AccountInfo states should be a subclass of a AccountInfoState', () {
    test(
      'AccountInfoInitial',
      () => expect(AccountInfoInitial(), isA<AccountInfoState>()),
    );

    test(
      'AccountInfoLoading',
      () => expect(AccountInfoLoading(), isA<AccountInfoState>()),
    );

    test(
      'AccountInfoFailure',
      () => expect(AccountInfoFailure(tDioException), isA<AccountInfoState>()),
    );

    test(
      'AccountInfoSuccess',
      () => expect(AccountInfoSuccess(tAccount), isA<AccountInfoState>()),
    );
  });

  group('props are correct', () {
    test(
      'AccountInfoFailure props',
      () => expect(
        AccountInfoFailure(tDioException).props,
        equals(<Object?>[tDioException]),
      ),
    );

    test(
      'AccountInfoSuccess props',
      () => expect(
        AccountInfoSuccess(tAccount).props,
        equals(<Object?>[tAccount]),
      ),
    );
  });
}
