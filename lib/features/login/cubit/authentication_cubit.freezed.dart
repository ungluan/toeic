// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function(String error) failed,
    required TResult Function(Map<String, dynamic> data) otp,
    required TResult Function() level1,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnAuthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateFailed value) failed,
    required TResult Function(AuthenticationStateOtp value) otp,
    required TResult Function(AuthenticationStateLevel1 value) level1,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class _$$AuthenticationStateUnAuthenticatedCopyWith<$Res> {
  factory _$$AuthenticationStateUnAuthenticatedCopyWith(
          _$AuthenticationStateUnAuthenticated value,
          $Res Function(_$AuthenticationStateUnAuthenticated) then) =
      __$$AuthenticationStateUnAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStateUnAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateUnAuthenticatedCopyWith<$Res> {
  __$$AuthenticationStateUnAuthenticatedCopyWithImpl(
      _$AuthenticationStateUnAuthenticated _value,
      $Res Function(_$AuthenticationStateUnAuthenticated) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateUnAuthenticated));

  @override
  _$AuthenticationStateUnAuthenticated get _value =>
      super._value as _$AuthenticationStateUnAuthenticated;
}

/// @nodoc

class _$AuthenticationStateUnAuthenticated
    implements AuthenticationStateUnAuthenticated {
  const _$AuthenticationStateUnAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateUnAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function(String error) failed,
    required TResult Function(Map<String, dynamic> data) otp,
    required TResult Function() level1,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnAuthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateFailed value) failed,
    required TResult Function(AuthenticationStateOtp value) otp,
    required TResult Function(AuthenticationStateLevel1 value) level1,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateUnAuthenticated
    implements AuthenticationState {
  const factory AuthenticationStateUnAuthenticated() =
      _$AuthenticationStateUnAuthenticated;
}

/// @nodoc
abstract class _$$AuthenticationStateAuthenticatedCopyWith<$Res> {
  factory _$$AuthenticationStateAuthenticatedCopyWith(
          _$AuthenticationStateAuthenticated value,
          $Res Function(_$AuthenticationStateAuthenticated) then) =
      __$$AuthenticationStateAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateAuthenticatedCopyWith<$Res> {
  __$$AuthenticationStateAuthenticatedCopyWithImpl(
      _$AuthenticationStateAuthenticated _value,
      $Res Function(_$AuthenticationStateAuthenticated) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateAuthenticated));

  @override
  _$AuthenticationStateAuthenticated get _value =>
      super._value as _$AuthenticationStateAuthenticated;
}

/// @nodoc

class _$AuthenticationStateAuthenticated
    implements AuthenticationStateAuthenticated {
  const _$AuthenticationStateAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function(String error) failed,
    required TResult Function(Map<String, dynamic> data) otp,
    required TResult Function() level1,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnAuthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateFailed value) failed,
    required TResult Function(AuthenticationStateOtp value) otp,
    required TResult Function(AuthenticationStateLevel1 value) level1,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateAuthenticated implements AuthenticationState {
  const factory AuthenticationStateAuthenticated() =
      _$AuthenticationStateAuthenticated;
}

/// @nodoc
abstract class _$$AuthenticationStateFailedCopyWith<$Res> {
  factory _$$AuthenticationStateFailedCopyWith(
          _$AuthenticationStateFailed value,
          $Res Function(_$AuthenticationStateFailed) then) =
      __$$AuthenticationStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$AuthenticationStateFailedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateFailedCopyWith<$Res> {
  __$$AuthenticationStateFailedCopyWithImpl(_$AuthenticationStateFailed _value,
      $Res Function(_$AuthenticationStateFailed) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateFailed));

  @override
  _$AuthenticationStateFailed get _value =>
      super._value as _$AuthenticationStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AuthenticationStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationStateFailed implements AuthenticationStateFailed {
  const _$AuthenticationStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuthenticationState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$AuthenticationStateFailedCopyWith<_$AuthenticationStateFailed>
      get copyWith => __$$AuthenticationStateFailedCopyWithImpl<
          _$AuthenticationStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function(String error) failed,
    required TResult Function(Map<String, dynamic> data) otp,
    required TResult Function() level1,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
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
    required TResult Function(AuthenticationStateUnAuthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateFailed value) failed,
    required TResult Function(AuthenticationStateOtp value) otp,
    required TResult Function(AuthenticationStateLevel1 value) level1,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateFailed implements AuthenticationState {
  const factory AuthenticationStateFailed(final String error) =
      _$AuthenticationStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$AuthenticationStateFailedCopyWith<_$AuthenticationStateFailed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationStateOtpCopyWith<$Res> {
  factory _$$AuthenticationStateOtpCopyWith(_$AuthenticationStateOtp value,
          $Res Function(_$AuthenticationStateOtp) then) =
      __$$AuthenticationStateOtpCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$AuthenticationStateOtpCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateOtpCopyWith<$Res> {
  __$$AuthenticationStateOtpCopyWithImpl(_$AuthenticationStateOtp _value,
      $Res Function(_$AuthenticationStateOtp) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateOtp));

  @override
  _$AuthenticationStateOtp get _value =>
      super._value as _$AuthenticationStateOtp;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AuthenticationStateOtp(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$AuthenticationStateOtp implements AuthenticationStateOtp {
  const _$AuthenticationStateOtp(final Map<String, dynamic> data)
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AuthenticationState.otp(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateOtp &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$AuthenticationStateOtpCopyWith<_$AuthenticationStateOtp> get copyWith =>
      __$$AuthenticationStateOtpCopyWithImpl<_$AuthenticationStateOtp>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function(String error) failed,
    required TResult Function(Map<String, dynamic> data) otp,
    required TResult Function() level1,
  }) {
    return otp(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
  }) {
    return otp?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
    required TResult orElse(),
  }) {
    if (otp != null) {
      return otp(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnAuthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateFailed value) failed,
    required TResult Function(AuthenticationStateOtp value) otp,
    required TResult Function(AuthenticationStateLevel1 value) level1,
  }) {
    return otp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
  }) {
    return otp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
    required TResult orElse(),
  }) {
    if (otp != null) {
      return otp(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateOtp implements AuthenticationState {
  const factory AuthenticationStateOtp(final Map<String, dynamic> data) =
      _$AuthenticationStateOtp;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$AuthenticationStateOtpCopyWith<_$AuthenticationStateOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationStateLevel1CopyWith<$Res> {
  factory _$$AuthenticationStateLevel1CopyWith(
          _$AuthenticationStateLevel1 value,
          $Res Function(_$AuthenticationStateLevel1) then) =
      __$$AuthenticationStateLevel1CopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStateLevel1CopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateLevel1CopyWith<$Res> {
  __$$AuthenticationStateLevel1CopyWithImpl(_$AuthenticationStateLevel1 _value,
      $Res Function(_$AuthenticationStateLevel1) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateLevel1));

  @override
  _$AuthenticationStateLevel1 get _value =>
      super._value as _$AuthenticationStateLevel1;
}

/// @nodoc

class _$AuthenticationStateLevel1 implements AuthenticationStateLevel1 {
  const _$AuthenticationStateLevel1();

  @override
  String toString() {
    return 'AuthenticationState.level1()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateLevel1);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticated,
    required TResult Function(String error) failed,
    required TResult Function(Map<String, dynamic> data) otp,
    required TResult Function() level1,
  }) {
    return level1();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
  }) {
    return level1?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticated,
    TResult Function(String error)? failed,
    TResult Function(Map<String, dynamic> data)? otp,
    TResult Function()? level1,
    required TResult orElse(),
  }) {
    if (level1 != null) {
      return level1();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateUnAuthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateFailed value) failed,
    required TResult Function(AuthenticationStateOtp value) otp,
    required TResult Function(AuthenticationStateLevel1 value) level1,
  }) {
    return level1(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
  }) {
    return level1?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateUnAuthenticated value)? unauthenticated,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateFailed value)? failed,
    TResult Function(AuthenticationStateOtp value)? otp,
    TResult Function(AuthenticationStateLevel1 value)? level1,
    required TResult orElse(),
  }) {
    if (level1 != null) {
      return level1(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateLevel1 implements AuthenticationState {
  const factory AuthenticationStateLevel1() = _$AuthenticationStateLevel1;
}
