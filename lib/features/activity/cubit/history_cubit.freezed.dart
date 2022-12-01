// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;
  // ignore: unused_field
  final $Res Function(HistoryState) _then;
}

/// @nodoc
abstract class _$$HistoryStateLoadingCopyWith<$Res> {
  factory _$$HistoryStateLoadingCopyWith(_$HistoryStateLoading value,
          $Res Function(_$HistoryStateLoading) then) =
      __$$HistoryStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoryStateLoadingCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$$HistoryStateLoadingCopyWith<$Res> {
  __$$HistoryStateLoadingCopyWithImpl(
      _$HistoryStateLoading _value, $Res Function(_$HistoryStateLoading) _then)
      : super(_value, (v) => _then(v as _$HistoryStateLoading));

  @override
  _$HistoryStateLoading get _value => super._value as _$HistoryStateLoading;
}

/// @nodoc

class _$HistoryStateLoading implements HistoryStateLoading {
  const _$HistoryStateLoading();

  @override
  String toString() {
    return 'HistoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HistoryStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HistoryStateLoading implements HistoryState {
  const factory HistoryStateLoading() = _$HistoryStateLoading;
}

/// @nodoc
abstract class _$$HistoryStateLoadedCopyWith<$Res> {
  factory _$$HistoryStateLoadedCopyWith(_$HistoryStateLoaded value,
          $Res Function(_$HistoryStateLoaded) then) =
      __$$HistoryStateLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoryStateLoadedCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$$HistoryStateLoadedCopyWith<$Res> {
  __$$HistoryStateLoadedCopyWithImpl(
      _$HistoryStateLoaded _value, $Res Function(_$HistoryStateLoaded) _then)
      : super(_value, (v) => _then(v as _$HistoryStateLoaded));

  @override
  _$HistoryStateLoaded get _value => super._value as _$HistoryStateLoaded;
}

/// @nodoc

class _$HistoryStateLoaded implements HistoryStateLoaded {
  const _$HistoryStateLoaded();

  @override
  String toString() {
    return 'HistoryState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HistoryStateLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String error) failed,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String error)? failed,
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
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HistoryStateLoaded implements HistoryState {
  const factory HistoryStateLoaded() = _$HistoryStateLoaded;
}

/// @nodoc
abstract class _$$HistoryStateFailedCopyWith<$Res> {
  factory _$$HistoryStateFailedCopyWith(_$HistoryStateFailed value,
          $Res Function(_$HistoryStateFailed) then) =
      __$$HistoryStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$HistoryStateFailedCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements _$$HistoryStateFailedCopyWith<$Res> {
  __$$HistoryStateFailedCopyWithImpl(
      _$HistoryStateFailed _value, $Res Function(_$HistoryStateFailed) _then)
      : super(_value, (v) => _then(v as _$HistoryStateFailed));

  @override
  _$HistoryStateFailed get _value => super._value as _$HistoryStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$HistoryStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HistoryStateFailed implements HistoryStateFailed {
  const _$HistoryStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HistoryState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$HistoryStateFailedCopyWith<_$HistoryStateFailed> get copyWith =>
      __$$HistoryStateFailedCopyWithImpl<_$HistoryStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loaded,
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
    required TResult Function(HistoryStateLoading value) loading,
    required TResult Function(HistoryStateLoaded value) loaded,
    required TResult Function(HistoryStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateLoading value)? loading,
    TResult Function(HistoryStateLoaded value)? loaded,
    TResult Function(HistoryStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class HistoryStateFailed implements HistoryState {
  const factory HistoryStateFailed(final String error) = _$HistoryStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$HistoryStateFailedCopyWith<_$HistoryStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
