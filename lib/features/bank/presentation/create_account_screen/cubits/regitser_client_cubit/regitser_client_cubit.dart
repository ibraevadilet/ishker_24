import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';

part 'regitser_client_cubit.freezed.dart';
part 'regitser_client_state.dart';

class RegitserClientCubit extends Cubit<RegitserClientState> {
  RegitserClientCubit({required this.useCase})
      : super(const RegitserClientState.initial());
  final RegisterClientUseCase useCase;

  Future<void> registerClient() async {
    emit(const RegitserClientState.loading());
    try {
      final postModel = RegisterClientPostModel(
        pasportTypeAnId: 'pasportTypeAnId',
        pasportNumber: 'pasportNumber',
        phoneNumber: 'phoneNumber',
        emailAdress: 'emailAdress',
        vidDeatelnosty: 'vidDeatelnosty',
        okpo: 'okpo',
        ogrn: 'ogrn',
        seriesDocNumber: 'seriesDocNumber',
        docNumber: 'docNumber',
        docPlace: 'docPlace',
        docDate: 'docDate',
      );
      await useCase.registerClient(postModel);
      emit(const RegitserClientState.success());
    } catch (e) {
      emit(RegitserClientState.error(e.toString()));
    }
  }
}
