import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/data/models/account_model.dart';

import '../../../../utils/constants.dart';

void main() {
  final json = {
    'account': tAccountModel.account,
    'currency': tAccountModel.currency,
    'bic': tAccountModel.bic,
    'depname': tAccountModel.depname,
    'address': tAccountModel.address,
    'pin': tAccountModel.pin,
    'amount': tAccountModel.amount,
    'free_amount': tAccountModel.amountFree,
    'unfree_amount': tAccountModel.amountUnfree,
  };

  test(
    'AccountModel.fromJson() should return a valid model when a valid JSON is given ',
    () async => expect(AccountModel.fromJson(json), equals(tAccountModel)),
  );

  test(
    'AccountModel.toEntity() should return a valid Account entity',
    () async => expect(tAccountModel.toEntity(), equals(tAccount)),
  );

  test(
    'AccountModel props are correct',
    () => expect(
      tAccountModel.props,
      equals(<Object?>[
        tAccountModel.account,
        tAccountModel.currency,
        tAccountModel.bic,
        tAccountModel.depname,
        tAccountModel.address,
        tAccountModel.pin,
        tAccountModel.amount,
        tAccountModel.amountFree,
        tAccountModel.amountUnfree,
      ]),
    ),
  );
}
