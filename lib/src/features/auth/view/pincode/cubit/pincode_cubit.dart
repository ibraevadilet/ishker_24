// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ishker_24/src/features/auth/domain/entity/confirm_code_entity.dart';
// import 'package:ishker_24/src/features/auth/domain/usecases/pincode_enter_usecase.dart';
// import 'package:ishker_24/src/features/auth/domain/usecases/pincode_new_usecase.dart';
// import 'package:ishker_24/src/features/auth/domain/usecases/pincode_set_usecase.dart';
// import 'package:ishker_24/src/features/auth/domain/usecases/pincode_cached_usecase.dart';

// part 'pincode_state.dart';

// class PinCodeCubit extends Cubit<PinCodeState> {
//   PinCodeCubit({
//     // required ConfirmCodeEntity confirmCodeEntity,
//     required PinCodeCachedUseCase pinCodeCachedUseCase,
//     required PinCodeSetUseCase pinCodeSetUseCase,
//     required PinCodeNewUseCase pinCodeNewUseCase,
//     required PinCodeEnterUseCase pinCodeEnterUseCase,
//   })  :
//         //  _confirmCodeEntity = confirmCodeEntity,
//         _pinCodeCachedUseCase = pinCodeCachedUseCase,
//         _pinCodeSetUseCase = pinCodeSetUseCase,
//         _pinCodeNewUseCase = pinCodeNewUseCase,
//         _pinCodeEnterUseCase = pinCodeEnterUseCase,
//         super(PinCodeInitial());

//   // final ConfirmCodeEntity _confirmCodeEntity;
//   final PinCodeCachedUseCase _pinCodeCachedUseCase;
//   final PinCodeSetUseCase _pinCodeSetUseCase;
//   final PinCodeNewUseCase _pinCodeNewUseCase;
//   final PinCodeEnterUseCase _pinCodeEnterUseCase;

//   void init(ConfirmCodeEntity? entity) async => emit(
//         // entity?.isSucceeded == true ? PinCodeEnter() :
//         PinCodeCreate(),
//       );

//       void 
// }
