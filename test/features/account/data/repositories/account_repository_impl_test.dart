import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:ishker_24/core/utils/result.dart';
import 'package:ishker_24/features/rsk/account/data/repositories/account_repository_impl.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/account.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/history.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_perform.dart';
import 'package:ishker_24/features/rsk/account/domain/entities/transfer_validate.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../../mocks.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/extensions.dart';

void main() {
  late MockINetworkInfo networkInfo;
  late MockIAccountDataSource remote;
  late AccountRepositoryImpl repository;

  setUp(() {
    networkInfo = MockINetworkInfo();
    remote = MockIAccountDataSource();
    repository = AccountRepositoryImpl(networkInfo, remote);
  });

  group('AccountRepositoryImpl.info()', () {
    test('success', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.info(tAccount.account)).thenAnswer(
        (_) async => tAccountModel,
      );

      //act
      final actual = await repository.info(tAccount.account);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verify(() => remote.info(tAccount.account)).called(1);
      verifyNoMoreInteractions(remote);
      expect(actual, Success(tAccount));
    });

    test('failure NoConnection', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => false);

      //act
      await repository.info(tAccount.account);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verifyZeroInteractions(remote);
    });

    test('failure DioException', () async {
      //arrange
      final Failure<Account, Exception> tResponse = Failure(tDioException);

      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.info(tAccount.account)).thenThrow(tDioException);

      //act
      final actual = await repository.info(tAccount.account);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verify(() => remote.info(tAccount.account)).called(1);
      expect(actual, isA<Failure>());
      expect(actual, tResponse);
      verifyNoMoreInteractions(networkInfo);
      verifyNoMoreInteractions(remote);
    });
  });

  group('AccountRepositoryImpl.history()', () {
    final params = tHistoryRequestModel.toParams();

    test('success', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.history(tHistoryRequestModel)).thenAnswer(
        (_) async => tHistoryModel,
      );

      //act
      final actual = await repository.history(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verify(() => remote.history(tHistoryRequestModel)).called(1);
      verifyNoMoreInteractions(remote);
      expect(actual, Success(tHistory));
    });

    test('failure NoConnection', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => false);

      //act
      await repository.history(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verifyZeroInteractions(remote);
    });

    test('failure DioException', () async {
      //arrange
      final Failure<History, Exception> tResponse = Failure(tDioException);

      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.history(tHistoryRequestModel)).thenThrow(tDioException);

      //act
      final actual = await repository.history(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verify(() => remote.history(tHistoryRequestModel)).called(1);
      expect(actual, isA<Failure>());
      expect(actual, tResponse);
      verifyNoMoreInteractions(networkInfo);
      verifyNoMoreInteractions(remote);
    });
  });

  group('AccountRepositoryImpl.validate()', () {
    final params = tTransferRequestModelV.toParams();

    test('success', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.validate(tTransferRequestModelV)).thenAnswer(
        (_) async => tTransferValidateModel,
      );

      //act
      final actual = await repository.validate(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verify(() => remote.validate(tTransferRequestModelV)).called(1);
      verifyNoMoreInteractions(remote);
      expect(actual, Success(tTransferValidate));
    });

    test('failure NoConnection', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => false);

      //act
      await repository.validate(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verifyZeroInteractions(remote);
    });

    test('failure DioException', () async {
      //arrange
      final Failure<TransferValidate, Exception> tResponse =
          Failure(tDioException);

      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.validate(tTransferRequestModelV))
          .thenThrow(tDioException);

      //act
      final actual = await repository.validate(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verify(() => remote.validate(tTransferRequestModelV)).called(1);
      expect(actual, isA<Failure>());
      expect(actual, tResponse);
      verifyNoMoreInteractions(networkInfo);
      verifyNoMoreInteractions(remote);
    });
  });

  group('AccountRepositoryImpl.perform()', () {
    final params = tTransferRequestModelP.toParams();

    log('params: $params');
    log('tT: $tTransferRequestModelP');

    test('success', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.perform(tTransferRequestModelP)).thenAnswer(
        (_) async => tTransferPerformModel,
      );

      //act
      final actual = await repository.perform(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verify(() => remote.perform(tTransferRequestModelP)).called(1);
      verifyNoMoreInteractions(remote);
      expect(actual, Success(tTransferPerform));
    });

    test('failure NoConnection', () async {
      //arrange
      when(() => networkInfo.isConnected).thenAnswer((_) async => false);

      //act
      await repository.perform(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verifyNoMoreInteractions(networkInfo);
      verifyZeroInteractions(remote);
    });

    test('failure DioException', () async {
      //arrange
      final Failure<TransferPerform, Exception> tResponse =
          Failure(tDioException);

      when(() => networkInfo.isConnected).thenAnswer((_) async => true);
      when(() => remote.perform(tTransferRequestModelP))
          .thenThrow(tDioException);

      //act
      final actual = await repository.perform(params);

      //assert
      verify(() => networkInfo.isConnected).called(1);
      verify(() => remote.perform(tTransferRequestModelP)).called(1);
      expect(actual, isA<Failure>());
      expect(actual, tResponse);
      verifyNoMoreInteractions(networkInfo);
      verifyNoMoreInteractions(remote);
    });
  });
}
