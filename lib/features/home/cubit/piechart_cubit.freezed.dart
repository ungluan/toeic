// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'piechart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PieChartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double>? data) loaded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PieChartStateLoading value) loading,
    required TResult Function(PieChartStateLoaded value) loaded,
    required TResult Function(PieChartStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieChartStateCopyWith<$Res> {
  factory $PieChartStateCopyWith(
          PieChartState value, $Res Function(PieChartState) then) =
      _$PieChartStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PieChartStateCopyWithImpl<$Res>
    implements $PieChartStateCopyWith<$Res> {
  _$PieChartStateCopyWithImpl(this._value, this._then);

  final PieChartState _value;
  // ignore: unused_field
  final $Res Function(PieChartState) _then;
}

/// @nodoc
abstract class _$$PieChartStateLoadingCopyWith<$Res> {
  factory _$$PieChartStateLoadingCopyWith(_$PieChartStateLoading value,
          $Res Function(_$PieChartStateLoading) then) =
      __$$PieChartStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PieChartStateLoadingCopyWithImpl<$Res>
    extends _$PieChartStateCopyWithImpl<$Res>
    implements _$$PieChartStateLoadingCopyWith<$Res> {
  __$$PieChartStateLoadingCopyWithImpl(_$PieChartStateLoading _value,
      $Res Function(_$PieChartStateLoading) _then)
      : super(_value, (v) => _then(v as _$PieChartStateLoading));

  @override
  _$PieChartStateLoading get _value => super._value as _$PieChartStateLoading;
}

/// @nodoc

class _$PieChartStateLoading implements PieChartStateLoading {
  const _$PieChartStateLoading();

  @override
  String toString() {
    return 'PieChartState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PieChartStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double>? data) loaded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
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
    required TResult Function(PieChartStateLoading value) loading,
    required TResult Function(PieChartStateLoaded value) loaded,
    required TResult Function(PieChartStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PieChartStateLoading implements PieChartState {
  const factory PieChartStateLoading() = _$PieChartStateLoading;
}

/// @nodoc
abstract class _$$PieChartStateLoadedCopyWith<$Res> {
  factory _$$PieChartStateLoadedCopyWith(_$PieChartStateLoaded value,
          $Res Function(_$PieChartStateLoaded) then) =
      __$$PieChartStateLoadedCopyWithImpl<$Res>;
  $Res call({List<double>? data});
}

/// @nodoc
class __$$PieChartStateLoadedCopyWithImpl<$Res>
    extends _$PieChartStateCopyWithImpl<$Res>
    implements _$$PieChartStateLoadedCopyWith<$Res> {
  __$$PieChartStateLoadedCopyWithImpl(
      _$PieChartStateLoaded _value, $Res Function(_$PieChartStateLoaded) _then)
      : super(_value, (v) => _then(v as _$PieChartStateLoaded));

  @override
  _$PieChartStateLoaded get _value => super._value as _$PieChartStateLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$PieChartStateLoaded(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc

class _$PieChartStateLoaded implements PieChartStateLoaded {
  const _$PieChartStateLoaded(final List<double>? data) : _data = data;

  final List<double>? _data;
  @override
  List<double>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PieChartState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieChartStateLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$PieChartStateLoadedCopyWith<_$PieChartStateLoaded> get copyWith =>
      __$$PieChartStateLoadedCopyWithImpl<_$PieChartStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double>? data) loaded,
    required TResult Function(String error) failed,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
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
    required TResult Function(PieChartStateLoading value) loading,
    required TResult Function(PieChartStateLoaded value) loaded,
    required TResult Function(PieChartStateFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PieChartStateLoaded implements PieChartState {
  const factory PieChartStateLoaded(final List<double>? data) =
      _$PieChartStateLoaded;

  List<double>? get data;
  @JsonKey(ignore: true)
  _$$PieChartStateLoadedCopyWith<_$PieChartStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PieChartStateFailedCopyWith<$Res> {
  factory _$$PieChartStateFailedCopyWith(_$PieChartStateFailed value,
          $Res Function(_$PieChartStateFailed) then) =
      __$$PieChartStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$PieChartStateFailedCopyWithImpl<$Res>
    extends _$PieChartStateCopyWithImpl<$Res>
    implements _$$PieChartStateFailedCopyWith<$Res> {
  __$$PieChartStateFailedCopyWithImpl(
      _$PieChartStateFailed _value, $Res Function(_$PieChartStateFailed) _then)
      : super(_value, (v) => _then(v as _$PieChartStateFailed));

  @override
  _$PieChartStateFailed get _value => super._value as _$PieChartStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PieChartStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PieChartStateFailed implements PieChartStateFailed {
  const _$PieChartStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PieChartState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieChartStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$PieChartStateFailedCopyWith<_$PieChartStateFailed> get copyWith =>
      __$$PieChartStateFailedCopyWithImpl<_$PieChartStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double>? data) loaded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double>? data)? loaded,
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
    required TResult Function(PieChartStateLoading value) loading,
    required TResult Function(PieChartStateLoaded value) loaded,
    required TResult Function(PieChartStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PieChartStateLoading value)? loading,
    TResult Function(PieChartStateLoaded value)? loaded,
    TResult Function(PieChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class PieChartStateFailed implements PieChartState {
  const factory PieChartStateFailed(final String error) = _$PieChartStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$PieChartStateFailedCopyWith<_$PieChartStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
