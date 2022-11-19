// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TestStateLoading value) loading,
    required TResult Function(TestStateFailed value) failed,
    required TResult Function(TestStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestStateCopyWith<$Res> {
  factory $TestStateCopyWith(TestState value, $Res Function(TestState) then) =
      _$TestStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TestStateCopyWithImpl<$Res> implements $TestStateCopyWith<$Res> {
  _$TestStateCopyWithImpl(this._value, this._then);

  final TestState _value;
  // ignore: unused_field
  final $Res Function(TestState) _then;
}

/// @nodoc
abstract class _$$TestStateLoadingCopyWith<$Res> {
  factory _$$TestStateLoadingCopyWith(
          _$TestStateLoading value, $Res Function(_$TestStateLoading) then) =
      __$$TestStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TestStateLoadingCopyWithImpl<$Res>
    extends _$TestStateCopyWithImpl<$Res>
    implements _$$TestStateLoadingCopyWith<$Res> {
  __$$TestStateLoadingCopyWithImpl(
      _$TestStateLoading _value, $Res Function(_$TestStateLoading) _then)
      : super(_value, (v) => _then(v as _$TestStateLoading));

  @override
  _$TestStateLoading get _value => super._value as _$TestStateLoading;
}

/// @nodoc

class _$TestStateLoading implements TestStateLoading {
  const _$TestStateLoading();

  @override
  String toString() {
    return 'TestState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TestStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
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
    required TResult Function(TestStateLoading value) loading,
    required TResult Function(TestStateFailed value) failed,
    required TResult Function(TestStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TestStateLoading implements TestState {
  const factory TestStateLoading() = _$TestStateLoading;
}

/// @nodoc
abstract class _$$TestStateFailedCopyWith<$Res> {
  factory _$$TestStateFailedCopyWith(
          _$TestStateFailed value, $Res Function(_$TestStateFailed) then) =
      __$$TestStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$TestStateFailedCopyWithImpl<$Res>
    extends _$TestStateCopyWithImpl<$Res>
    implements _$$TestStateFailedCopyWith<$Res> {
  __$$TestStateFailedCopyWithImpl(
      _$TestStateFailed _value, $Res Function(_$TestStateFailed) _then)
      : super(_value, (v) => _then(v as _$TestStateFailed));

  @override
  _$TestStateFailed get _value => super._value as _$TestStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$TestStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TestStateFailed implements TestStateFailed {
  const _$TestStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TestState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$TestStateFailedCopyWith<_$TestStateFailed> get copyWith =>
      __$$TestStateFailedCopyWithImpl<_$TestStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() loaded,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
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
    required TResult Function(TestStateLoading value) loading,
    required TResult Function(TestStateFailed value) failed,
    required TResult Function(TestStateLoaded value) loaded,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class TestStateFailed implements TestState {
  const factory TestStateFailed(final String error) = _$TestStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$TestStateFailedCopyWith<_$TestStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TestStateLoadedCopyWith<$Res> {
  factory _$$TestStateLoadedCopyWith(
          _$TestStateLoaded value, $Res Function(_$TestStateLoaded) then) =
      __$$TestStateLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TestStateLoadedCopyWithImpl<$Res>
    extends _$TestStateCopyWithImpl<$Res>
    implements _$$TestStateLoadedCopyWith<$Res> {
  __$$TestStateLoadedCopyWithImpl(
      _$TestStateLoaded _value, $Res Function(_$TestStateLoaded) _then)
      : super(_value, (v) => _then(v as _$TestStateLoaded));

  @override
  _$TestStateLoaded get _value => super._value as _$TestStateLoaded;
}

/// @nodoc

class _$TestStateLoaded implements TestStateLoaded {
  const _$TestStateLoaded();

  @override
  String toString() {
    return 'TestState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TestStateLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TestStateLoading value) loading,
    required TResult Function(TestStateFailed value) failed,
    required TResult Function(TestStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TestStateLoading value)? loading,
    TResult Function(TestStateFailed value)? failed,
    TResult Function(TestStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TestStateLoaded implements TestState {
  const factory TestStateLoaded() = _$TestStateLoaded;
}
