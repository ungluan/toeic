// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'barchart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BarChartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> dataUser, List<double> dataApp)
        loaded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BarChartStateLoading value) loading,
    required TResult Function(BarChartStateLoaded value) loaded,
    required TResult Function(BarChartStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarChartStateCopyWith<$Res> {
  factory $BarChartStateCopyWith(
          BarChartState value, $Res Function(BarChartState) then) =
      _$BarChartStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BarChartStateCopyWithImpl<$Res>
    implements $BarChartStateCopyWith<$Res> {
  _$BarChartStateCopyWithImpl(this._value, this._then);

  final BarChartState _value;
  // ignore: unused_field
  final $Res Function(BarChartState) _then;
}

/// @nodoc
abstract class _$$BarChartStateLoadingCopyWith<$Res> {
  factory _$$BarChartStateLoadingCopyWith(_$BarChartStateLoading value,
          $Res Function(_$BarChartStateLoading) then) =
      __$$BarChartStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BarChartStateLoadingCopyWithImpl<$Res>
    extends _$BarChartStateCopyWithImpl<$Res>
    implements _$$BarChartStateLoadingCopyWith<$Res> {
  __$$BarChartStateLoadingCopyWithImpl(_$BarChartStateLoading _value,
      $Res Function(_$BarChartStateLoading) _then)
      : super(_value, (v) => _then(v as _$BarChartStateLoading));

  @override
  _$BarChartStateLoading get _value => super._value as _$BarChartStateLoading;
}

/// @nodoc

class _$BarChartStateLoading implements BarChartStateLoading {
  const _$BarChartStateLoading();

  @override
  String toString() {
    return 'BarChartState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BarChartStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> dataUser, List<double> dataApp)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
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
    required TResult Function(BarChartStateLoading value) loading,
    required TResult Function(BarChartStateLoaded value) loaded,
    required TResult Function(BarChartStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BarChartStateLoading implements BarChartState {
  const factory BarChartStateLoading() = _$BarChartStateLoading;
}

/// @nodoc
abstract class _$$BarChartStateLoadedCopyWith<$Res> {
  factory _$$BarChartStateLoadedCopyWith(_$BarChartStateLoaded value,
          $Res Function(_$BarChartStateLoaded) then) =
      __$$BarChartStateLoadedCopyWithImpl<$Res>;
  $Res call({List<double> dataUser, List<double> dataApp});
}

/// @nodoc
class __$$BarChartStateLoadedCopyWithImpl<$Res>
    extends _$BarChartStateCopyWithImpl<$Res>
    implements _$$BarChartStateLoadedCopyWith<$Res> {
  __$$BarChartStateLoadedCopyWithImpl(
      _$BarChartStateLoaded _value, $Res Function(_$BarChartStateLoaded) _then)
      : super(_value, (v) => _then(v as _$BarChartStateLoaded));

  @override
  _$BarChartStateLoaded get _value => super._value as _$BarChartStateLoaded;

  @override
  $Res call({
    Object? dataUser = freezed,
    Object? dataApp = freezed,
  }) {
    return _then(_$BarChartStateLoaded(
      dataUser == freezed
          ? _value._dataUser
          : dataUser // ignore: cast_nullable_to_non_nullable
              as List<double>,
      dataApp == freezed
          ? _value._dataApp
          : dataApp // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$BarChartStateLoaded implements BarChartStateLoaded {
  const _$BarChartStateLoaded(
      final List<double> dataUser, final List<double> dataApp)
      : _dataUser = dataUser,
        _dataApp = dataApp;

  final List<double> _dataUser;
  @override
  List<double> get dataUser {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataUser);
  }

  final List<double> _dataApp;
  @override
  List<double> get dataApp {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataApp);
  }

  @override
  String toString() {
    return 'BarChartState.loaded(dataUser: $dataUser, dataApp: $dataApp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarChartStateLoaded &&
            const DeepCollectionEquality().equals(other._dataUser, _dataUser) &&
            const DeepCollectionEquality().equals(other._dataApp, _dataApp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dataUser),
      const DeepCollectionEquality().hash(_dataApp));

  @JsonKey(ignore: true)
  @override
  _$$BarChartStateLoadedCopyWith<_$BarChartStateLoaded> get copyWith =>
      __$$BarChartStateLoadedCopyWithImpl<_$BarChartStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> dataUser, List<double> dataApp)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return loaded(dataUser, dataApp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call(dataUser, dataApp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(dataUser, dataApp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BarChartStateLoading value) loading,
    required TResult Function(BarChartStateLoaded value) loaded,
    required TResult Function(BarChartStateFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BarChartStateLoaded implements BarChartState {
  const factory BarChartStateLoaded(
          final List<double> dataUser, final List<double> dataApp) =
      _$BarChartStateLoaded;

  List<double> get dataUser;
  List<double> get dataApp;
  @JsonKey(ignore: true)
  _$$BarChartStateLoadedCopyWith<_$BarChartStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BarChartStateFailedCopyWith<$Res> {
  factory _$$BarChartStateFailedCopyWith(_$BarChartStateFailed value,
          $Res Function(_$BarChartStateFailed) then) =
      __$$BarChartStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$BarChartStateFailedCopyWithImpl<$Res>
    extends _$BarChartStateCopyWithImpl<$Res>
    implements _$$BarChartStateFailedCopyWith<$Res> {
  __$$BarChartStateFailedCopyWithImpl(
      _$BarChartStateFailed _value, $Res Function(_$BarChartStateFailed) _then)
      : super(_value, (v) => _then(v as _$BarChartStateFailed));

  @override
  _$BarChartStateFailed get _value => super._value as _$BarChartStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$BarChartStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BarChartStateFailed implements BarChartStateFailed {
  const _$BarChartStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'BarChartState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarChartStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$BarChartStateFailedCopyWith<_$BarChartStateFailed> get copyWith =>
      __$$BarChartStateFailedCopyWithImpl<_$BarChartStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<double> dataUser, List<double> dataApp)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<double> dataUser, List<double> dataApp)? loaded,
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
    required TResult Function(BarChartStateLoading value) loading,
    required TResult Function(BarChartStateLoaded value) loaded,
    required TResult Function(BarChartStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BarChartStateLoading value)? loading,
    TResult Function(BarChartStateLoaded value)? loaded,
    TResult Function(BarChartStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class BarChartStateFailed implements BarChartState {
  const factory BarChartStateFailed(final String error) = _$BarChartStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$BarChartStateFailedCopyWith<_$BarChartStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
