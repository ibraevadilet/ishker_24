import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/qr/data/models/generate_qr_post_model.dart';
import 'package:ishker_24/features/qr/domain/use_cases/generate_qr_usecase.dart';

part 'generate_qr_cubit.freezed.dart';
part 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit({required this.useCase})
      : super(const GenerateQrState.loading()) {
    generateQr(0);
  }

  final GenerateQrUseCase useCase;

  Future<void> generateQr(int amount) async {
    try {
      final postModel = GenerateQrPostModel(
        account: '1290583310033866',
        tspName: 'example_tsp_name',
        serviceName: 'example_service_name',
        comments: 'example_comments',
        mcc: 'example_mcc',
        currency: 'example_currency',
        amount: amount.toString(),
        payerNameLat: 'example_payer_name_lat',
      );
      final result = await useCase.generateQr(postModel);
      emit(GenerateQrState.success(result));
    } catch (e) {
      emit(GenerateQrState.error(e.toString()));
    }
  }
}
