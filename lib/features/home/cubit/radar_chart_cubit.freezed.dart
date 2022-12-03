// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'radar_chart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RadarChartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> data) loaded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RadarChartStateLoading value) loading,
    required TResult Function(RadarChartStateLoaded value) loaded,
    required TResult Function(RadarChartStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadarChartStateCopyWith<$Res> {
  factory $RadarChartStateCopyWith(
          RadarChartState value, $Res Function(RadarChartState) then) =
      _$RadarChartStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RadarChartStateCopyWithImpl<$Res>
    implements $RadarChartStateCopyWith<$Res> {
  _$RadarChartStateCopyWithImpl(this._value, this._then);

  final RadarChartState _value;
  // ignore: unused_field
  final $Res Function(RadarChartState) _then;
}

/// @nodoc
abstract class _$$RadarChartStateLoadingCopyWith<$Res> {
  factory _$$RadarChartStateLoadingCopyWith(_$RadarChartStateLoading value,
          $Res Function(_$RadarChartStateLoading) then) =
      __$$RadarChartStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RadarChartStateLoadingCopyWithImpl<$Res>
    extends _$RadarChartStateCopyWithImpl<$Res>
    implements _$$RadarChartStateLoadingCopyWith<$Res> {
  __$$RadarChartStateLoadingCopyWithImpl(_$RadarChartStateLoading _value,
      $Res Function(_$RadarChartStateLoading) _then)
      : super(_value, (v) => _then(v as _$RadarChartStateLoading));

  @override
  _$RadarChartStateLoading get _value =>
      super._value as _$RadarChartStateLoading;
}

/// @nodoc

class _$RadarChartStateLoading implements RadarChartStateLoading {
  const _$RadarChartStateLoading();

  @override
  String toString() {
    return 'RadarChartState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RadarChartStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> data) loaded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
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
    required TResult Function(RadarChartStateLoading value) loading,
    required TResult Function(RadarChartStateLoaded value) loaded,
    required TResult Function(RadarChartStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RadarChartStateLoading implements RadarChartState {
  const factory RadarChartStateLoading() = _$RadarChartStateLoading;
}

/// @nodoc
abstract class _$$RadarChartStateLoadedCopyWith<$Res> {
  factory _$$RadarChartStateLoadedCopyWith(_$RadarChartStateLoaded value,
          $Res Function(_$RadarChartStateLoaded) then) =
      __$$RadarChartStateLoadedCopyWithImpl<$Res>;
  $Res call({List<double> data});
}

/// @nodoc
class __$$RadarChartStateLoadedCopyWithImpl<$Res>
    extends _$RadarChartStateCopyWithImpl<$Res>
    implements _$$RadarChartStateLoadedCopyWith<$Res> {
  __$$RadarChartStateLoadedCopyWithImpl(_$RadarChartStateLoaded _value,
      $Res Function(_$RadarChartStateLoaded) _then)
      : super(_value, (v) => _then(v as _$RadarChartStateLoaded));

  @override
  _$RadarChartStateLoaded get _value => super._value as _$RadarChartStateLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RadarChartStateLoaded(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$RadarChartStateLoaded implements RadarChartStateLoaded {
  const _$RadarChartStateLoaded(final List<double> data) : _data = data;

  final List<double> _data;
  @override
  List<double> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RadarChartState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadarChartStateLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$RadarChartStateLoadedCopyWith<_$RadarChartStateLoaded> get copyWith =>
      __$$RadarChartStateLoadedCopyWithImpl<_$RadarChartStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> data) loaded,
    required TResult Function(String error) failed,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
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
    required TResult Function(RadarChartStateLoading value) loading,
    required TResult Function(RadarChartStateLoaded value) loaded,
    required TResult Function(RadarChartStateFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RadarChartStateLoaded implements RadarChartState {
  const factory RadarChartStateLoaded(final List<double> data) =
      _$RadarChartStateLoaded;

  List<double> get data;
  @JsonKey(ignore: true)
  _$$RadarChartStateLoadedCopyWith<_$RadarChartStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RadarChartStateFailedCopyWith<$Res> {
  factory _$$RadarChartStateFailedCopyWith(_$RadarChartStateFailed value,
          $Res Function(_$RadarChartStateFailed) then) =
      __$$RadarChartStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$RadarChartStateFailedCopyWithImpl<$Res>
    extends _$RadarChartStateCopyWithImpl<$Res>
    implements _$$RadarChartStateFailedCopyWith<$Res> {
  __$$RadarChartStateFailedCopyWithImpl(_$RadarChartStateFailed _value,
      $Res Function(_$RadarChartStateFailed) _then)
      : super(_value, (v) => _then(v as _$RadarChartStateFailed));

  @override
  _$RadarChartStateFailed get _value => super._value as _$RadarChartStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RadarChartStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RadarChartStateFailed implements RadarChartStateFailed {
  const _$RadarChartStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RadarChartState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadarChartStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$RadarChartStateFailedCopyWith<_$RadarChartStateFailed> get copyWith =>
      __$$RadarChartStateFailedCopyWithImpl<_$RadarChartStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> data) loaded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> data)? loaded,
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
    required TResult Function(RadarChartStateLoading value) loading,
    required TResult Function(RadarChartStateLoaded value) loaded,
    required TResult Function(RadarChartStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RadarChartStateLoading value)? loading,
    TResult Function(RadarChartStateLoaded value)? loaded,
    TResult Function(RadarChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class RadarChartStateFailed implements RadarChartState {
  const factory RadarChartStateFailed(final String error) =
      _$RadarChartStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$RadarChartStateFailedCopyWith<_$RadarChartStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
