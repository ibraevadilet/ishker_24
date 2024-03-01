import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/megakassa/domain/entities/gns_registration_request_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_entity.dart';
import 'package:ishker_24/features/megakassa/domain/entities/kkm_registration_entity.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/gns_registration_methods_usecase.dart';
import 'package:ishker_24/features/megakassa/domain/use_cases/gns_registration_usecase.dart';
import 'package:ishker_24/features/register_ip/data/models/pin_code_types_model.dart';
import 'package:ishker_24/widgets/styled_toasts.dart';

part 'gns_registration_cubit.freezed.dart';
part 'gns_registration_state.dart';

class MegaKassaGnsRegistrationCubit extends Cubit<GnsRegistrationState> {
  MegaKassaGnsRegistrationCubit({
    required this.useCase,
    required this.methodsUseCase,
  }) : super(const GnsRegistrationState.initial());

  final MegaKassaGnsRegistrationUseCase useCase;
  final MegaKassaGnsRegistrationMethodsUseCase methodsUseCase;

  Future<void> register({
    MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    MegaKassaKkmRegistrationEntity? registrationKkmEntity,
    required String pincode,
  }) async {
    try {
      emit(const GnsRegistrationState.loading());

      final (message, kkm, statusCode) = await useCase.registerGns(
        registrationEntity: registrationEntity,
        registrationKkmEntity: registrationKkmEntity,
        pincode: pincode,
      );
      if (statusCode == 200) {
        emit(GnsRegistrationState.success(
          registrationEntity: registrationEntity,
          kkmRegistrationEntity: registrationKkmEntity,
          kkmEntity: kkm,
          methods: [],
        ));
      } else if (statusCode == 400) {
        AppSnackBar.showSnackBar(message, isSuccess: false);
      } else {
        emit(const GnsRegistrationState.initial());
      }
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString(), isSuccess: false);
      emit(GnsRegistrationState.error(e.toString()));
    }
  }

  Future<void> getMethods({
    MegaKassaGnsRegistrationRequestEntity? registrationEntity,
    MegaKassaKkmRegistrationEntity? kkmRegistrationEntity,
  }) async {
    try {
      emit(const GnsRegistrationState.loading());
      final methods = await methodsUseCase.getGnsMethods();

      if (registrationEntity != null) {
        emit(GnsRegistrationState.success(
          methods: methods,
          registrationEntity: registrationEntity,
        ));
      }

      if (kkmRegistrationEntity != null) {
        emit(GnsRegistrationState.success(
          methods: methods,
          kkmRegistrationEntity: kkmRegistrationEntity,
        ));
      }
    } catch (e) {
      AppSnackBar.showSnackBar(e.toString(), isSuccess: false);
      emit(const GnsRegistrationState.initial());
    }
  }
}
