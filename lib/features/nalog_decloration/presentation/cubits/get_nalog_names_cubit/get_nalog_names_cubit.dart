import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/get_nalog_names_usecase.dart';

part 'get_nalog_names_cubit.freezed.dart';
part 'get_nalog_names_state.dart';

class GetNalogNamesCubit extends Cubit<GetNalogNamesState> {
  GetNalogNamesCubit({required this.useCase})
      : super(const GetNalogNamesState.loading()) {
    getNalogNames();
  }

  final GetNalogNamesUseCase useCase;

  Future<void> getNalogNames() async {
    try {
      final result = await useCase.getNalogNames();
      emit(GetNalogNamesState.success(result));
    } catch (e) {
      emit(GetNalogNamesState.error(e.toString()));
    }
  }
}
