part of 'esia_terms_cubit.dart';

sealed class TermsState extends Equatable {
  const TermsState();

  @override
  List<Object?> get props => [];
}

final class TermsInitial extends TermsState {}

final class TermsLoading extends TermsState {}

final class TermsFailure extends TermsState {
  const TermsFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class TermsSuccess extends TermsState {
  const TermsSuccess(this.path);

  final String path;

  @override
  List<Object?> get props => [path];
}
