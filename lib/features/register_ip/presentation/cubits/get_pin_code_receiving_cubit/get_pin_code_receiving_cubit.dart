import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_pin_code_receiving_usecase.dart';

part 'get_pin_code_receiving_cubit.freezed.dart';
part 'get_pin_code_receiving_state.dart';

class GetPinCodeReceivingCubit extends Cubit<GetPinCodeReceivingState> {
  GetPinCodeReceivingCubit({required this.useCase})
      : super(const GetPinCodeReceivingState.loading()) {
    getPinRecievTypes();
  }

  final GetPinCodeReceivingUseCase useCase;

  Future<void> getPinRecievTypes() async {
    emit(const GetPinCodeReceivingState.loading());
    try {
      final result = await useCase.getPinCodeReceiving();
      emit(GetPinCodeReceivingState.success(result));
    } catch (e) {
      emit(GetPinCodeReceivingState.error(e.toString()));
    }
  }
}
