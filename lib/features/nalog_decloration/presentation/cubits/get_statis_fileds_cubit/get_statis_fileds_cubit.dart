import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/nalog_decloration/domain/use_cases/get_static_fields_usecase.dart';

part 'get_statis_fileds_cubit.freezed.dart';
part 'get_statis_fileds_state.dart';

class GetStatisFiledsCubit extends Cubit<GetStatisFiledsState> {
  GetStatisFiledsCubit({required this.useCase})
      : super(const GetStatisFiledsState.loading());

  final GetStaticFieldsUseCase useCase;

  Future<void> getStaticFields(String type) async {
    try {
      final result = await useCase.getStaticFields(type);
      emit(GetStatisFiledsState.success(result));
    } catch (e) {
      emit(GetStatisFiledsState.error(e.toString()));
    }
  }
}
