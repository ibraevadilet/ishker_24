part of 'get_statis_fileds_cubit.dart';

@freezed
class GetStatisFiledsState with _$GetStatisFiledsState {
  const factory GetStatisFiledsState.loading() = _Loading;
  const factory GetStatisFiledsState.error(String error) = _Error;
  const factory GetStatisFiledsState.success(Map<String, dynamic> model) =
      _Success;
}
