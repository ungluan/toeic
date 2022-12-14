// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() successful,
    required TResult Function(Map<String, dynamic> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateFailed value) failed,
    required TResult Function(RegisterStateSuccessful value) successful,
    required TResult Function(RegisterStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState _value;
  // ignore: unused_field
  final $Res Function(RegisterState) _then;
}

/// @nodoc
abstract class _$$RegisterStateLoadingCopyWith<$Res> {
  factory _$$RegisterStateLoadingCopyWith(_$RegisterStateLoading value,
          $Res Function(_$RegisterStateLoading) then) =
      __$$RegisterStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterStateLoadingCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$RegisterStateLoadingCopyWith<$Res> {
  __$$RegisterStateLoadingCopyWithImpl(_$RegisterStateLoading _value,
      $Res Function(_$RegisterStateLoading) _then)
      : super(_value, (v) => _then(v as _$RegisterStateLoading));

  @override
  _$RegisterStateLoading get _value => super._value as _$RegisterStateLoading;
}

/// @nodoc

class _$RegisterStateLoading implements RegisterStateLoading {
  const _$RegisterStateLoading();

  @override
  String toString() {
    return 'RegisterState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() successful,
    required TResult Function(Map<String, dynamic> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
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
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateFailed value) failed,
    required TResult Function(RegisterStateSuccessful value) successful,
    required TResult Function(RegisterStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegisterStateLoading implements RegisterState {
  const factory RegisterStateLoading() = _$RegisterStateLoading;
}

/// @nodoc
abstract class _$$RegisterStateFailedCopyWith<$Res> {
  factory _$$RegisterStateFailedCopyWith(_$RegisterStateFailed value,
          $Res Function(_$RegisterStateFailed) then) =
      __$$RegisterStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$RegisterStateFailedCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$RegisterStateFailedCopyWith<$Res> {
  __$$RegisterStateFailedCopyWithImpl(
      _$RegisterStateFailed _value, $Res Function(_$RegisterStateFailed) _then)
      : super(_value, (v) => _then(v as _$RegisterStateFailed));

  @override
  _$RegisterStateFailed get _value => super._value as _$RegisterStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RegisterStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterStateFailed implements RegisterStateFailed {
  const _$RegisterStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RegisterState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$RegisterStateFailedCopyWith<_$RegisterStateFailed> get copyWith =>
      __$$RegisterStateFailedCopyWithImpl<_$RegisterStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() successful,
    required TResult Function(Map<String, dynamic> data) loaded,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateFailed value) failed,
    required TResult Function(RegisterStateSuccessful value) successful,
    required TResult Function(RegisterStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class RegisterStateFailed implements RegisterState {
  const factory RegisterStateFailed(final String error) = _$RegisterStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$RegisterStateFailedCopyWith<_$RegisterStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterStateSuccessfulCopyWith<$Res> {
  factory _$$RegisterStateSuccessfulCopyWith(_$RegisterStateSuccessful value,
          $Res Function(_$RegisterStateSuccessful) then) =
      __$$RegisterStateSuccessfulCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterStateSuccessfulCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$RegisterStateSuccessfulCopyWith<$Res> {
  __$$RegisterStateSuccessfulCopyWithImpl(_$RegisterStateSuccessful _value,
      $Res Function(_$RegisterStateSuccessful) _then)
      : super(_value, (v) => _then(v as _$RegisterStateSuccessful));

  @override
  _$RegisterStateSuccessful get _value =>
      super._value as _$RegisterStateSuccessful;
}

/// @nodoc

class _$RegisterStateSuccessful implements RegisterStateSuccessful {
  const _$RegisterStateSuccessful();

  @override
  String toString() {
    return 'RegisterState.successful()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateSuccessful);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() successful,
    required TResult Function(Map<String, dynamic> data) loaded,
  }) {
    return successful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
  }) {
    return successful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateFailed value) failed,
    required TResult Function(RegisterStateSuccessful value) successful,
    required TResult Function(RegisterStateLoaded value) loaded,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class RegisterStateSuccessful implements RegisterState {
  const factory RegisterStateSuccessful() = _$RegisterStateSuccessful;
}

/// @nodoc
abstract class _$$RegisterStateLoadedCopyWith<$Res> {
  factory _$$RegisterStateLoadedCopyWith(_$RegisterStateLoaded value,
          $Res Function(_$RegisterStateLoaded) then) =
      __$$RegisterStateLoadedCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$RegisterStateLoadedCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res>
    implements _$$RegisterStateLoadedCopyWith<$Res> {
  __$$RegisterStateLoadedCopyWithImpl(
      _$RegisterStateLoaded _value, $Res Function(_$RegisterStateLoaded) _then)
      : super(_value, (v) => _then(v as _$RegisterStateLoaded));

  @override
  _$RegisterStateLoaded get _value => super._value as _$RegisterStateLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RegisterStateLoaded(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$RegisterStateLoaded implements RegisterStateLoaded {
  const _$RegisterStateLoaded(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'RegisterState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$RegisterStateLoadedCopyWith<_$RegisterStateLoaded> get copyWith =>
      __$$RegisterStateLoadedCopyWithImpl<_$RegisterStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() successful,
    required TResult Function(Map<String, dynamic> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? successful,
    TResult Function(Map<String, dynamic> data)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterStateLoading value) loading,
    required TResult Function(RegisterStateFailed value) failed,
    required TResult Function(RegisterStateSuccessful value) successful,
    required TResult Function(RegisterStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterStateLoading value)? loading,
    TResult Function(RegisterStateFailed value)? failed,
    TResult Function(RegisterStateSuccessful value)? successful,
    TResult Function(RegisterStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RegisterStateLoaded implements RegisterState {
  const factory RegisterStateLoaded(final Map<String, dynamic> data) =
      _$RegisterStateLoaded;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$RegisterStateLoadedCopyWith<_$RegisterStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
