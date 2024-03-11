import 'package:equatable/equatable.dart';

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> extends Equatable {
  const Result();

  @override
  List<Object?> get props => [];
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;

  @override
  List<Object?> get props => [value];
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception, {this.stackTrace});
  final E exception;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [exception];
}
