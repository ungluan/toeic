// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double data) loaded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProgressStateLoading value) loading,
    required TResult Function(ProgressStateLoaded value) loaded,
    required TResult Function(ProgressStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStateCopyWith<$Res> {
  factory $ProgressStateCopyWith(
          ProgressState value, $Res Function(ProgressState) then) =
      _$ProgressStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProgressStateCopyWithImpl<$Res>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._value, this._then);

  final ProgressState _value;
  // ignore: unused_field
  final $Res Function(ProgressState) _then;
}

/// @nodoc
abstract class _$$ProgressStateLoadingCopyWith<$Res> {
  factory _$$ProgressStateLoadingCopyWith(_$ProgressStateLoading value,
          $Res Function(_$ProgressStateLoading) then) =
      __$$ProgressStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProgressStateLoadingCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res>
    implements _$$ProgressStateLoadingCopyWith<$Res> {
  __$$ProgressStateLoadingCopyWithImpl(_$ProgressStateLoading _value,
      $Res Function(_$ProgressStateLoading) _then)
      : super(_value, (v) => _then(v as _$ProgressStateLoading));

  @override
  _$ProgressStateLoading get _value => super._value as _$ProgressStateLoading;
}

/// @nodoc

class _$ProgressStateLoading implements ProgressStateLoading {
  const _$ProgressStateLoading();

  @override
  String toString() {
    return 'ProgressState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProgressStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double data) loaded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
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
    required TResult Function(ProgressStateLoading value) loading,
    required TResult Function(ProgressStateLoaded value) loaded,
    required TResult Function(ProgressStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProgressStateLoading implements ProgressState {
  const factory ProgressStateLoading() = _$ProgressStateLoading;
}

/// @nodoc
abstract class _$$ProgressStateLoadedCopyWith<$Res> {
  factory _$$ProgressStateLoadedCopyWith(_$ProgressStateLoaded value,
          $Res Function(_$ProgressStateLoaded) then) =
      __$$ProgressStateLoadedCopyWithImpl<$Res>;
  $Res call({double data});
}

/// @nodoc
class __$$ProgressStateLoadedCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res>
    implements _$$ProgressStateLoadedCopyWith<$Res> {
  __$$ProgressStateLoadedCopyWithImpl(
      _$ProgressStateLoaded _value, $Res Function(_$ProgressStateLoaded) _then)
      : super(_value, (v) => _then(v as _$ProgressStateLoaded));

  @override
  _$ProgressStateLoaded get _value => super._value as _$ProgressStateLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ProgressStateLoaded(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ProgressStateLoaded implements ProgressStateLoaded {
  const _$ProgressStateLoaded(this.data);

  @override
  final double data;

  @override
  String toString() {
    return 'ProgressState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStateLoaded &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$ProgressStateLoadedCopyWith<_$ProgressStateLoaded> get copyWith =>
      __$$ProgressStateLoadedCopyWithImpl<_$ProgressStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double data) loaded,
    required TResult Function(String error) failed,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
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
    required TResult Function(ProgressStateLoading value) loading,
    required TResult Function(ProgressStateLoaded value) loaded,
    required TResult Function(ProgressStateFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProgressStateLoaded implements ProgressState {
  const factory ProgressStateLoaded(final double data) = _$ProgressStateLoaded;

  double get data;
  @JsonKey(ignore: true)
  _$$ProgressStateLoadedCopyWith<_$ProgressStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProgressStateFailedCopyWith<$Res> {
  factory _$$ProgressStateFailedCopyWith(_$ProgressStateFailed value,
          $Res Function(_$ProgressStateFailed) then) =
      __$$ProgressStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$ProgressStateFailedCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res>
    implements _$$ProgressStateFailedCopyWith<$Res> {
  __$$ProgressStateFailedCopyWithImpl(
      _$ProgressStateFailed _value, $Res Function(_$ProgressStateFailed) _then)
      : super(_value, (v) => _then(v as _$ProgressStateFailed));

  @override
  _$ProgressStateFailed get _value => super._value as _$ProgressStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ProgressStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProgressStateFailed implements ProgressStateFailed {
  const _$ProgressStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ProgressState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ProgressStateFailedCopyWith<_$ProgressStateFailed> get copyWith =>
      __$$ProgressStateFailedCopyWithImpl<_$ProgressStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double data) loaded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double data)? loaded,
    TResult Function(String error)? failed,
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
    required TResult Function(ProgressStateLoading value) loading,
    required TResult Function(ProgressStateLoaded value) loaded,
    required TResult Function(ProgressStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProgressStateLoading value)? loading,
    TResult Function(ProgressStateLoaded value)? loaded,
    TResult Function(ProgressStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class ProgressStateFailed implements ProgressState {
  const factory ProgressStateFailed(final String error) = _$ProgressStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$ProgressStateFailedCopyWith<_$ProgressStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
