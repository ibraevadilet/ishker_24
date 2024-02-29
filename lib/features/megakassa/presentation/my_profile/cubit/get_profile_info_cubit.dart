import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/profile_entity.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/get_profile_info_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'get_profile_info_cubit.freezed.dart';
part 'get_profile_info_state.dart';

class MegaKassaGetProfileInfoCubit extends Cubit<GetProfileInfoState> {
  MegaKassaGetProfileInfoCubit({required this.useCase})
      : super(const GetProfileInfoState.loading());

  final MegaKassaGetProfileInfoUseCase useCase;

  Future<void> getProfileInfo() async {
    try {
      final profile = await useCase.getProfileInfo();

      emit(GetProfileInfoState.success(profile: profile));
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString(), isSuccess: false);
      emit(GetProfileInfoState.error(e.toString()));
    }
  }
}
