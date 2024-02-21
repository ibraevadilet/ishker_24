part of 'personal_data_cubit.dart';

@freezed
class PersonalDataState with _$PersonalDataState {
   const factory PersonalDataState.initial() = _Initial;
  const factory PersonalDataState.error(String error) = _Error;
  const factory PersonalDataState.success(String path) = _Success;
}
