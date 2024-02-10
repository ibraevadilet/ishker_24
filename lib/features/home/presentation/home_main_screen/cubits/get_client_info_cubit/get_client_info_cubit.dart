import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/home/data/models/get_client_info_model.dart';
import 'package:ishker_24/features/home/domain/use_cases/get_client_info_usecase.dart';

part 'get_client_info_cubit.freezed.dart';
part 'get_client_info_state.dart';

class GetClientInfoCubit extends Cubit<GetClientInfoState> {
  GetClientInfoCubit({required this.useCase})
      : super(const GetClientInfoState.loading()) {
    getClientInfo();
  }

  final GetClientInfoUseCase useCase;

  Future<void> getClientInfo() async {
    try {
      final result = await useCase.getClientInfo();
      emit(GetClientInfoState.success(result));
    } catch (e) {
      emit(GetClientInfoState.error(e.toString()));
    }
  }
}
