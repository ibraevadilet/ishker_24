import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/send_nalog_data_usecase.dart';

part 'send_saved_data_cubit.freezed.dart';
part 'send_saved_data_state.dart';

class SendSavedDataCubit extends Cubit<SendSavedDataState> {
  SendSavedDataCubit({required this.useCase})
      : super(const SendSavedDataState.initial());
  final SendNalogDataUseCase useCase;

  Future<void> sendData(Map<String, dynamic> sendModel, String type, String pinCode) async {
    emit(const SendSavedDataState.loading());
    try {
      await useCase.sendNalogData(sendModel, type, pinCode);

      emit(const SendSavedDataState.success());
    } catch (e) {
      emit(SendSavedDataState.error(e.toString()));
    }
  }
}
