// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function() updated,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateInfoLoaded value) loaded,
    required TResult Function(UserStateUpdated value) updated,
    required TResult Function(UserStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class _$$UserStateLoadingCopyWith<$Res> {
  factory _$$UserStateLoadingCopyWith(
          _$UserStateLoading value, $Res Function(_$UserStateLoading) then) =
      __$$UserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateLoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserStateLoadingCopyWith<$Res> {
  __$$UserStateLoadingCopyWithImpl(
      _$UserStateLoading _value, $Res Function(_$UserStateLoading) _then)
      : super(_value, (v) => _then(v as _$UserStateLoading));

  @override
  _$UserStateLoading get _value => super._value as _$UserStateLoading;
}

/// @nodoc

class _$UserStateLoading implements UserStateLoading {
  const _$UserStateLoading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function() updated,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
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
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateInfoLoaded value) loaded,
    required TResult Function(UserStateUpdated value) updated,
    required TResult Function(UserStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserStateLoading implements UserState {
  const factory UserStateLoading() = _$UserStateLoading;
}

/// @nodoc
abstract class _$$UserStateInfoLoadedCopyWith<$Res> {
  factory _$$UserStateInfoLoadedCopyWith(_$UserStateInfoLoaded value,
          $Res Function(_$UserStateInfoLoaded) then) =
      __$$UserStateInfoLoadedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$$UserStateInfoLoadedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserStateInfoLoadedCopyWith<$Res> {
  __$$UserStateInfoLoadedCopyWithImpl(
      _$UserStateInfoLoaded _value, $Res Function(_$UserStateInfoLoaded) _then)
      : super(_value, (v) => _then(v as _$UserStateInfoLoaded));

  @override
  _$UserStateInfoLoaded get _value => super._value as _$UserStateInfoLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserStateInfoLoaded(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$UserStateInfoLoaded implements UserStateInfoLoaded {
  const _$UserStateInfoLoaded(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.loaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateInfoLoaded &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$UserStateInfoLoadedCopyWith<_$UserStateInfoLoaded> get copyWith =>
      __$$UserStateInfoLoadedCopyWithImpl<_$UserStateInfoLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function() updated,
    required TResult Function(String error) failed,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateInfoLoaded value) loaded,
    required TResult Function(UserStateUpdated value) updated,
    required TResult Function(UserStateFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserStateInfoLoaded implements UserState {
  const factory UserStateInfoLoaded(final User user) = _$UserStateInfoLoaded;

  User get user;
  @JsonKey(ignore: true)
  _$$UserStateInfoLoadedCopyWith<_$UserStateInfoLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserStateUpdatedCopyWith<$Res> {
  factory _$$UserStateUpdatedCopyWith(
          _$UserStateUpdated value, $Res Function(_$UserStateUpdated) then) =
      __$$UserStateUpdatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserStateUpdatedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserStateUpdatedCopyWith<$Res> {
  __$$UserStateUpdatedCopyWithImpl(
      _$UserStateUpdated _value, $Res Function(_$UserStateUpdated) _then)
      : super(_value, (v) => _then(v as _$UserStateUpdated));

  @override
  _$UserStateUpdated get _value => super._value as _$UserStateUpdated;
}

/// @nodoc

class _$UserStateUpdated implements UserStateUpdated {
  const _$UserStateUpdated();

  @override
  String toString() {
    return 'UserState.updated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserStateUpdated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function() updated,
    required TResult Function(String error) failed,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateInfoLoaded value) loaded,
    required TResult Function(UserStateUpdated value) updated,
    required TResult Function(UserStateFailed value) failed,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class UserStateUpdated implements UserState {
  const factory UserStateUpdated() = _$UserStateUpdated;
}

/// @nodoc
abstract class _$$UserStateFailedCopyWith<$Res> {
  factory _$$UserStateFailedCopyWith(
          _$UserStateFailed value, $Res Function(_$UserStateFailed) then) =
      __$$UserStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$UserStateFailedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements _$$UserStateFailedCopyWith<$Res> {
  __$$UserStateFailedCopyWithImpl(
      _$UserStateFailed _value, $Res Function(_$UserStateFailed) _then)
      : super(_value, (v) => _then(v as _$UserStateFailed));

  @override
  _$UserStateFailed get _value => super._value as _$UserStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UserStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserStateFailed implements UserStateFailed {
  const _$UserStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'UserState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$UserStateFailedCopyWith<_$UserStateFailed> get copyWith =>
      __$$UserStateFailedCopyWithImpl<_$UserStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function() updated,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function()? updated,
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
    required TResult Function(UserStateLoading value) loading,
    required TResult Function(UserStateInfoLoaded value) loaded,
    required TResult Function(UserStateUpdated value) updated,
    required TResult Function(UserStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateLoading value)? loading,
    TResult Function(UserStateInfoLoaded value)? loaded,
    TResult Function(UserStateUpdated value)? updated,
    TResult Function(UserStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class UserStateFailed implements UserState {
  const factory UserStateFailed(final String error) = _$UserStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$UserStateFailedCopyWith<_$UserStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
