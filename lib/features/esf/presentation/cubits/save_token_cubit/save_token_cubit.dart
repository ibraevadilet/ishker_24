import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/esf/domain/usecases/save_token_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'save_token_cubit.freezed.dart';
part 'save_token_state.dart';

class SaveTokenCubit extends Cubit<SaveTokenState> {
  SaveTokenCubit({required this.useCase})
      : super(const SaveTokenState.initial());
  final SaveTokenUseCase useCase;

  Future<void> saveToken({
    required String data,
    required bool isFile,
    String? fileName,
  }) async {
    emit(const SaveTokenState.loading());
    try {
      await useCase.saveToken(data: data, isFile: isFile, fileName: fileName);
      emit(const SaveTokenState.success());
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString());
      emit(const SaveTokenState.initial());
    }
  }
}
