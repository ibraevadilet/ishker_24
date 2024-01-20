import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_user_info_usecase.dart';

part 'get_user_info_cubit.freezed.dart';
part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit({required this.useCase})
      : super(const GetUserInfoState.loading()) {
    getUserInfo();
  }
  final GetUserInfoUseCase useCase;

  Future<void> getUserInfo() async {
    emit(const GetUserInfoState.loading());
    try {
      await useCase.getUserInfo();
      emit(const GetUserInfoState.success());
    } catch (e) {
      emit(GetUserInfoState.error(e.toString()));
    }
  }
}
