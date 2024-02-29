import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/send_nalog_data_usecase.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'send_saved_data_cubit.freezed.dart';
part 'send_saved_data_state.dart';

class SendSavedDataCubit extends Cubit<SendSavedDataState> {
  SendSavedDataCubit({required this.useCase})
      : super(const SendSavedDataState.initial());
  final SendNalogDataUseCase useCase;

  Future<void> sendData(Map<String, dynamic> sendModel, String type) async {
    emit(const SendSavedDataState.loading());
    try {
      await useCase.sendNalogData(sendModel, type);
      AppRouting.pushAndPopUntilFunction(const NalogMainRoute());
      AppSnackBar.showSnackBar('Успешно сохранено', isSuccess: true);
      emit(const SendSavedDataState.initial());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const SendSavedDataState.initial());
    }
  }
}
