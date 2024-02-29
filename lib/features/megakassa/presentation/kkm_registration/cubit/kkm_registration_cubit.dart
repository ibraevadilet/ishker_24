import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/kkm_registration_usecase.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'kkm_registration_cubit.freezed.dart';
part 'kkm_registration_state.dart';

class MegaKassaKkmRegistrationCubit extends Cubit<KkmRegistrationState> {
  MegaKassaKkmRegistrationCubit({required this.useCase})
      : super(const KkmRegistrationState.initial());

  final MegaKassaKkmRegistrationUseCase useCase;

  Future<void> register({
    required MegaKassaKkmRegistrationEntity registrationEntity,
  }) async {
    try {
      emit(const KkmRegistrationState.loading());

      final createdKkm = await useCase.registerKkm(
        registrationEntity: registrationEntity,
      );
      if (createdKkm.rnm.isNotEmpty) {
        emit(KkmRegistrationState.success(
          entity: createdKkm,
        ));
      } else {
        emit(const KkmRegistrationState.error(''));
      }
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString(), isSuccess: false);
      emit(const KkmRegistrationState.initial());
    }
  }
}
