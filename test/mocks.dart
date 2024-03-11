import 'package:bloc_test/bloc_test.dart';
import 'package:ishker_24/core/network/netrowk_info.dart';
import 'package:ishker_24/core/network/rsk_service.dart';
import 'package:ishker_24/features/account/data/datasources/account_datasource.dart';
import 'package:ishker_24/features/account/domain/usecases/account_info_usecase.dart';
import 'package:ishker_24/features/account/domain/usecases/history_usecase.dart';
import 'package:ishker_24/features/account/presentation/history/cubit/history_cubit.dart';
import 'package:ishker_24/features/account/presentation/info/cubit/account_info_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockRskService extends Mock implements RskService {}

class MockINetworkInfo extends Mock implements INetworkInfo {}

class MockIAccountDataSource extends Mock implements IAccountDataSource {}

class MockAccountInfoUseCase extends Mock implements AccountInfoUseCase {}

class MockAccountInfoCubit extends MockCubit<AccountInfoState>
    implements AccountInfoCubit {}

class MockHistoryUseCase extends Mock implements HistoryUseCase {}

class MockHistoryCubit extends MockCubit<HistoryState>
    implements HistoryCubit {}
