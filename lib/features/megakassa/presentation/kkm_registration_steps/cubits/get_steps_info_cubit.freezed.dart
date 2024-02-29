// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_steps_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetStepsInfoState {
  MegaKassaStepsInfoEntity? get info => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MegaKassaStepsInfoEntity? info) loading,
    required TResult Function(MegaKassaStepsInfoEntity? info) initial,
    required TResult Function(String error, MegaKassaStepsInfoEntity? info)
        error,
    required TResult Function(MegaKassaStepsInfoEntity? info) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult? Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult? Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult? Function(MegaKassaStepsInfoEntity? info)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult Function(MegaKassaStepsInfoEntity? info)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetStepsInfoStateCopyWith<GetStepsInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStepsInfoStateCopyWith<$Res> {
  factory $GetStepsInfoStateCopyWith(
          GetStepsInfoState value, $Res Function(GetStepsInfoState) then) =
      _$GetStepsInfoStateCopyWithImpl<$Res, GetStepsInfoState>;
  @useResult
  $Res call({MegaKassaStepsInfoEntity? info});
}

/// @nodoc
class _$GetStepsInfoStateCopyWithImpl<$Res, $Val extends GetStepsInfoState>
    implements $GetStepsInfoStateCopyWith<$Res> {
  _$GetStepsInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MegaKassaStepsInfoEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $GetStepsInfoStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MegaKassaStepsInfoEntity? info});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GetStepsInfoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_$LoadingImpl(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MegaKassaStepsInfoEntity?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required this.info});

  @override
  final MegaKassaStepsInfoEntity? info;

  @override
  String toString() {
    return 'GetStepsInfoState.loading(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MegaKassaStepsInfoEntity? info) loading,
    required TResult Function(MegaKassaStepsInfoEntity? info) initial,
    required TResult Function(String error, MegaKassaStepsInfoEntity? info)
        error,
    required TResult Function(MegaKassaStepsInfoEntity? info) success,
  }) {
    return loading(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult? Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult? Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult? Function(MegaKassaStepsInfoEntity? info)? success,
  }) {
    return loading?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult Function(MegaKassaStepsInfoEntity? info)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GetStepsInfoState {
  const factory _Loading({required final MegaKassaStepsInfoEntity? info}) =
      _$LoadingImpl;

  @override
  MegaKassaStepsInfoEntity? get info;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetStepsInfoStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MegaKassaStepsInfoEntity? info});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetStepsInfoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_$InitialImpl(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MegaKassaStepsInfoEntity?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.info});

  @override
  final MegaKassaStepsInfoEntity? info;

  @override
  String toString() {
    return 'GetStepsInfoState.initial(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MegaKassaStepsInfoEntity? info) loading,
    required TResult Function(MegaKassaStepsInfoEntity? info) initial,
    required TResult Function(String error, MegaKassaStepsInfoEntity? info)
        error,
    required TResult Function(MegaKassaStepsInfoEntity? info) success,
  }) {
    return initial(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult? Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult? Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult? Function(MegaKassaStepsInfoEntity? info)? success,
  }) {
    return initial?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult Function(MegaKassaStepsInfoEntity? info)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetStepsInfoState {
  const factory _Initial({required final MegaKassaStepsInfoEntity? info}) =
      _$InitialImpl;

  @override
  MegaKassaStepsInfoEntity? get info;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $GetStepsInfoStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, MegaKassaStepsInfoEntity? info});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GetStepsInfoStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? info = freezed,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MegaKassaStepsInfoEntity?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.error, required this.info});

  @override
  final String error;
  @override
  final MegaKassaStepsInfoEntity? info;

  @override
  String toString() {
    return 'GetStepsInfoState.error(error: $error, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MegaKassaStepsInfoEntity? info) loading,
    required TResult Function(MegaKassaStepsInfoEntity? info) initial,
    required TResult Function(String error, MegaKassaStepsInfoEntity? info)
        error,
    required TResult Function(MegaKassaStepsInfoEntity? info) success,
  }) {
    return error(this.error, info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult? Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult? Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult? Function(MegaKassaStepsInfoEntity? info)? success,
  }) {
    return error?.call(this.error, info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult Function(MegaKassaStepsInfoEntity? info)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GetStepsInfoState {
  const factory _Error(
      {required final String error,
      required final MegaKassaStepsInfoEntity? info}) = _$ErrorImpl;

  String get error;
  @override
  MegaKassaStepsInfoEntity? get info;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $GetStepsInfoStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MegaKassaStepsInfoEntity? info});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$GetStepsInfoStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_$SuccessImpl(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MegaKassaStepsInfoEntity?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.info});

  @override
  final MegaKassaStepsInfoEntity? info;

  @override
  String toString() {
    return 'GetStepsInfoState.success(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MegaKassaStepsInfoEntity? info) loading,
    required TResult Function(MegaKassaStepsInfoEntity? info) initial,
    required TResult Function(String error, MegaKassaStepsInfoEntity? info)
        error,
    required TResult Function(MegaKassaStepsInfoEntity? info) success,
  }) {
    return success(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult? Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult? Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult? Function(MegaKassaStepsInfoEntity? info)? success,
  }) {
    return success?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MegaKassaStepsInfoEntity? info)? loading,
    TResult Function(MegaKassaStepsInfoEntity? info)? initial,
    TResult Function(String error, MegaKassaStepsInfoEntity? info)? error,
    TResult Function(MegaKassaStepsInfoEntity? info)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GetStepsInfoState {
  const factory _Success({required final MegaKassaStepsInfoEntity? info}) =
      _$SuccessImpl;

  @override
  MegaKassaStepsInfoEntity? get info;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
