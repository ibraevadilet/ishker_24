import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/bank/data/models/get_client_passport_model.dart';
import 'package:ishker_24/features/bank/domain/use_cases/get_client_passport_usecase.dart';

part 'get_client_passport_cubit.freezed.dart';
part 'get_client_passport_state.dart';

class GetClientPassportCubit extends Cubit<GetClientPassportState> {
  GetClientPassportCubit({required this.useCase})
      : super(const GetClientPassportState.loading()) {
    getClientPassport();
  }

  final GetClientPassportUseCase useCase;

  Future<void> getClientPassport() async {
    try {
      final result = await useCase.getClientPassport();
      emit(GetClientPassportState.success(result));
    } catch (e) {
      emit(GetClientPassportState.error(e.toString()));
    }
  }
}
