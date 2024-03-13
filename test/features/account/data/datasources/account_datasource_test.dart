import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/features/account/data/datasources/account_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../../../utils/constants.dart';

void main() {
  late MockRskService service;
  late AccountDataSourceImpl remote;

  setUp(() {
    service = MockRskService();
    remote = AccountDataSourceImpl(service);
  });

  test(
    'AccountDataSourceImpl.info() should call service.info() then return AccountModel object',
    () async {
      when(() => service.info(tAccount.account)).thenAnswer(
        (_) async => tAccountModel,
      );

      final response = await remote.info(tAccount.account);

      expect(response, tAccountModel);
      verify(() => service.info(tAccount.account)).called(1);
      verifyNoMoreInteractions(service);
    },
  );

  test(
    'AccountDataSourceImpl.history() should call service.history() then return HistoryModel object',
    () async {
      when(() => service.history(tHistoryRequestModel)).thenAnswer(
        (_) async => tHistoryModel,
      );

      final response = await remote.history(tHistoryRequestModel);

      expect(response, tHistoryModel);
      verify(() => service.history(tHistoryRequestModel)).called(1);
      verifyNoMoreInteractions(service);
    },
  );

  // test(
  //   'AccountDataSourceImpl.validate() should call service.validate() then return TransferValidateModel object',
  //   () async {
  //     when(() => service.validate(tTransferRequestModelV)).thenAnswer(
  //       (_) async => tTransferValidateModel,
  //     );

  //     final response = await remote.validate(tTransferRequestModelV);

  //     expect(response, tTransferValidateModel);
  //     verify(() => service.validate(tTransferRequestModelV)).called(1);
  //     verifyNoMoreInteractions(service);
  //   },
  // );

  // test(
  //   'AccountDataSourceImpl.validate() should call service.validate() then return TransferPerformModel object',
  //   () async {
  //     when(() => service.perform(tTransferRequestModelP)).thenAnswer(
  //       (_) async => tTransferPerformModel,
  //     );

  //     final response = await remote.perform(tTransferRequestModelP);

  //     expect(response, tTransferPerformModel);
  //     verify(() => service.perform(tTransferRequestModelP)).called(1);
  //     verifyNoMoreInteractions(service);
  //   },
  // );
}
