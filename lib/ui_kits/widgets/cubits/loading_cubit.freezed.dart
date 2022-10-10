// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loading_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  final LoadingState _value;
  // ignore: unused_field
  final $Res Function(LoadingState) _then;
}

/// @nodoc
abstract class _$$LoadingStateLoadingCopyWith<$Res> {
  factory _$$LoadingStateLoadingCopyWith(_$LoadingStateLoading value,
          $Res Function(_$LoadingStateLoading) then) =
      __$$LoadingStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateLoadingCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res>
    implements _$$LoadingStateLoadingCopyWith<$Res> {
  __$$LoadingStateLoadingCopyWithImpl(
      _$LoadingStateLoading _value, $Res Function(_$LoadingStateLoading) _then)
      : super(_value, (v) => _then(v as _$LoadingStateLoading));

  @override
  _$LoadingStateLoading get _value => super._value as _$LoadingStateLoading;
}

/// @nodoc

class _$LoadingStateLoading implements LoadingStateLoading {
  const _$LoadingStateLoading();

  @override
  String toString() {
    return 'LoadingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
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
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateInit value) init,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateInit value)? init,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateInit value)? init,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingStateLoading implements LoadingState {
  const factory LoadingStateLoading() = _$LoadingStateLoading;
}

/// @nodoc
abstract class _$$LoadingStateInitCopyWith<$Res> {
  factory _$$LoadingStateInitCopyWith(
          _$LoadingStateInit value, $Res Function(_$LoadingStateInit) then) =
      __$$LoadingStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateInitCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res>
    implements _$$LoadingStateInitCopyWith<$Res> {
  __$$LoadingStateInitCopyWithImpl(
      _$LoadingStateInit _value, $Res Function(_$LoadingStateInit) _then)
      : super(_value, (v) => _then(v as _$LoadingStateInit));

  @override
  _$LoadingStateInit get _value => super._value as _$LoadingStateInit;
}

/// @nodoc

class _$LoadingStateInit implements LoadingStateInit {
  const _$LoadingStateInit();

  @override
  String toString() {
    return 'LoadingState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class LoadingStateInit implements LoadingState {
  const factory LoadingStateInit() = _$LoadingStateInit;
}
