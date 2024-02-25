part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.pin = '',
    this.persistentToken = '',
    this.authModel = IshkerAuthModel.empty,
    this.status = const AuthInitial(),
  });

  final String pin;
  final String persistentToken;
  final IshkerAuthModel authModel;
  final AuthStatus status;

  AuthState copyWith({
    String? pin,
    String? persistentToken,
    IshkerAuthModel? authModel,
    AuthStatus? status,
  }) =>
      AuthState(
        pin: pin ?? this.pin,
        persistentToken: persistentToken ?? this.persistentToken,
        authModel: authModel ?? this.authModel,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [pin, persistentToken, authModel, status];
}

sealed class AuthStatus extends Equatable {
  const AuthStatus();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthStatus {
  const AuthInitial();
}

final class Unauthenticated extends AuthStatus {}

final class Authenticated extends AuthStatus {}



// class AuthState extends Equatable {
//   const AuthState({
//     this.status = const AuthStatusUnknown(),
//     this.authEntity = AuthEntity.empty,
//   });

//   final AuthStatus status;
//   final AuthEntity authEntity;

//   @override
//   List<Object?> get props => [];
// }

// sealed class AuthStatus extends Equatable {
//   const AuthStatus();
  
//   @override
//   List<Object?> get props => [];
// }

// final class AuthStatusUnknown extends AuthStatus {
//   const AuthStatusUnknown();

//   @override
//   List<Object?> get props => [];
// }

// final class Unauthenticated extends AuthStatus {}

// final class Authenticated extends AuthStatus {}
