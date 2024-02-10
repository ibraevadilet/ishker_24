import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/use_cases/generate_qr_usecase.dart';

part 'generate_qr_cubit.freezed.dart';
part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit({required this.useCase})
      : super(const GenerateQrState.loading());

  final GenerateQrUseCase useCase;

  Future<void> generateQr() async {
    try {
      final postModel = GenerateQrPostModel(
        account: 'account',
        tspName: 'tspName',
        serviceName: 'serviceName',
        comments: 'comments',
        mcc: 'mcc',
        currency: 'currency',
        amount: 'amount',
        payerNameLat: 'payerNameLat',
      );
      final result = await useCase.generateQr(postModel);
      emit(GenerateQrState.success(result));
    } catch (e) {
      emit(GenerateQrState.error(e.toString()));
    }
  }
}
