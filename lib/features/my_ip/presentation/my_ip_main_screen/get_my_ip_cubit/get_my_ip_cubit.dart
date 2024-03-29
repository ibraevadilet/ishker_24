import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/home/data/models/check_has_ip_model.dart';
import 'package:ishker_24/features/home/domain/use_cases/check_has_ip_use_case.dart';

part 'get_my_ip_cubit.freezed.dart';
part 'get_my_ip_state.dart';

class GetMyIpCubit extends Cubit<GetMyIpState> {
  GetMyIpCubit({required this.useCase}) : super(const GetMyIpState.loading()) {
    getMyIp();
  }

  final CheckHasIPUseCase useCase;

  Future<void> getMyIp() async {
    emit(const GetMyIpState.loading());
    try {
      // emit(
      //   GetMyIpState.success(
      //     CheckHasIPModel(
      //       tin: '21605200001255',
      //       gnsStatus: '',
      //       declinedReason: '',
      //       firstName: 'Адилет',
      //       lastName: 'Джаанбаевич',
      //       middleName: 'Ибраев',
      //       created: DateTime.now(),
      //       isNewIp: true,
      //       image:
      //           'https://qr.salyk.kg/getcertificate?encodedText=j7pBI-O0UBMbc66TrW2eg3F8dFh5PECwQyDAKjLbiSw',
      //     ),
      //   ),
      // );
      final result = await useCase.checkIp();
      if (result == null) {
        emit(const GetMyIpState.emptyIp());
      } else {
        if (result.gnsStatus == 'REFUSED') {
          emit(GetMyIpState.declinedIp(result.declinedReason, result.created!));
        } else if (result.gnsStatus == 'IN_PROCESS') {
          emit(const GetMyIpState.inProccess());
        } else {
          emit(GetMyIpState.success(result));
        }
      }
    } catch (e) {
      emit(GetMyIpState.error(e.toString()));
    }
  }
}
