// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_qr_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenerateQrState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(String link, List<AccountChetModel> accountsList)
        success,
    required TResult Function(String partyId) emptyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(String link, List<AccountChetModel> accountsList)?
        success,
    TResult? Function(String partyId)? emptyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(String link, List<AccountChetModel> accountsList)? success,
    TResult Function(String partyId)? emptyAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_EmptyAccount value) emptyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_EmptyAccount value)? emptyAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_EmptyAccount value)? emptyAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateQrStateCopyWith<$Res> {
  factory $GenerateQrStateCopyWith(
          GenerateQrState value, $Res Function(GenerateQrState) then) =
      _$GenerateQrStateCopyWithImpl<$Res, GenerateQrState>;
}

/// @nodoc
class _$GenerateQrStateCopyWithImpl<$Res, $Val extends GenerateQrState>
    implements $GenerateQrStateCopyWith<$Res> {
  _$GenerateQrStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GenerateQrStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GenerateQrState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(String link, List<AccountChetModel> accountsList)
        success,
    required TResult Function(String partyId) emptyAccount,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(String link, List<AccountChetModel> accountsList)?
        success,
    TResult? Function(String partyId)? emptyAccount,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(String link, List<AccountChetModel> accountsList)? success,
    TResult Function(String partyId)? emptyAccount,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_EmptyAccount value) emptyAccount,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_EmptyAccount value)? emptyAccount,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_EmptyAccount value)? emptyAccount,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GenerateQrState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GenerateQrStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GenerateQrState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(String link, List<AccountChetModel> accountsList)
        success,
    required TResult Function(String partyId) emptyAccount,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(String link, List<AccountChetModel> accountsList)?
        success,
    TResult? Function(String partyId)? emptyAccount,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(String link, List<AccountChetModel> accountsList)? success,
    TResult Function(String partyId)? emptyAccount,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_EmptyAccount value) emptyAccount,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_EmptyAccount value)? emptyAccount,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_EmptyAccount value)? emptyAccount,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GenerateQrState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String link, List<AccountChetModel> accountsList});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$GenerateQrStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? accountsList = null,
  }) {
    return _then(_$SuccessImpl(
      null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      null == accountsList
          ? _value._accountsList
          : accountsList // ignore: cast_nullable_to_non_nullable
              as List<AccountChetModel>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.link, final List<AccountChetModel> accountsList)
      : _accountsList = accountsList;

  @override
  final String link;
  final List<AccountChetModel> _accountsList;
  @override
  List<AccountChetModel> get accountsList {
    if (_accountsList is EqualUnmodifiableListView) return _accountsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountsList);
  }

  @override
  String toString() {
    return 'GenerateQrState.success(link: $link, accountsList: $accountsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._accountsList, _accountsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, link, const DeepCollectionEquality().hash(_accountsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(String link, List<AccountChetModel> accountsList)
        success,
    required TResult Function(String partyId) emptyAccount,
  }) {
    return success(link, accountsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(String link, List<AccountChetModel> accountsList)?
        success,
    TResult? Function(String partyId)? emptyAccount,
  }) {
    return success?.call(link, accountsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(String link, List<AccountChetModel> accountsList)? success,
    TResult Function(String partyId)? emptyAccount,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(link, accountsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_EmptyAccount value) emptyAccount,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_EmptyAccount value)? emptyAccount,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_EmptyAccount value)? emptyAccount,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GenerateQrState {
  const factory _Success(
          final String link, final List<AccountChetModel> accountsList) =
      _$SuccessImpl;

  String get link;
  List<AccountChetModel> get accountsList;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyAccountImplCopyWith<$Res> {
  factory _$$EmptyAccountImplCopyWith(
          _$EmptyAccountImpl value, $Res Function(_$EmptyAccountImpl) then) =
      __$$EmptyAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String partyId});
}

/// @nodoc
class __$$EmptyAccountImplCopyWithImpl<$Res>
    extends _$GenerateQrStateCopyWithImpl<$Res, _$EmptyAccountImpl>
    implements _$$EmptyAccountImplCopyWith<$Res> {
  __$$EmptyAccountImplCopyWithImpl(
      _$EmptyAccountImpl _value, $Res Function(_$EmptyAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partyId = null,
  }) {
    return _then(_$EmptyAccountImpl(
      null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyAccountImpl implements _EmptyAccount {
  const _$EmptyAccountImpl(this.partyId);

  @override
  final String partyId;

  @override
  String toString() {
    return 'GenerateQrState.emptyAccount(partyId: $partyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyAccountImpl &&
            (identical(other.partyId, partyId) || other.partyId == partyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyAccountImplCopyWith<_$EmptyAccountImpl> get copyWith =>
      __$$EmptyAccountImplCopyWithImpl<_$EmptyAccountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(String link, List<AccountChetModel> accountsList)
        success,
    required TResult Function(String partyId) emptyAccount,
  }) {
    return emptyAccount(partyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(String link, List<AccountChetModel> accountsList)?
        success,
    TResult? Function(String partyId)? emptyAccount,
  }) {
    return emptyAccount?.call(partyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(String link, List<AccountChetModel> accountsList)? success,
    TResult Function(String partyId)? emptyAccount,
    required TResult orElse(),
  }) {
    if (emptyAccount != null) {
      return emptyAccount(partyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_EmptyAccount value) emptyAccount,
  }) {
    return emptyAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_EmptyAccount value)? emptyAccount,
  }) {
    return emptyAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_EmptyAccount value)? emptyAccount,
    required TResult orElse(),
  }) {
    if (emptyAccount != null) {
      return emptyAccount(this);
    }
    return orElse();
  }
}

abstract class _EmptyAccount implements GenerateQrState {
  const factory _EmptyAccount(final String partyId) = _$EmptyAccountImpl;

  String get partyId;
  @JsonKey(ignore: true)
  _$$EmptyAccountImplCopyWith<_$EmptyAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
