part of 'oep_terms_cubit.dart';

sealed class OepTermsState extends Equatable {
  const OepTermsState();

  @override
  List<Object?> get props => [];
}

final class OepTermsInitial extends OepTermsState {}

final class OepTermsLoading extends OepTermsState {}

final class OepTermsFailure extends OepTermsState {
  const OepTermsFailure(this.exception);

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}

final class OepTermsSuccess extends OepTermsState {
  const OepTermsSuccess(this.path);

  final String path;

  @override
  List<Object?> get props => [path];
}
