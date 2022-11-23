// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'examination_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExaminationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExaminationStateCopyWith<$Res> {
  factory $ExaminationStateCopyWith(
          ExaminationState value, $Res Function(ExaminationState) then) =
      _$ExaminationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExaminationStateCopyWithImpl<$Res>
    implements $ExaminationStateCopyWith<$Res> {
  _$ExaminationStateCopyWithImpl(this._value, this._then);

  final ExaminationState _value;
  // ignore: unused_field
  final $Res Function(ExaminationState) _then;
}

/// @nodoc
abstract class _$$ExaminationStateLoadingCopyWith<$Res> {
  factory _$$ExaminationStateLoadingCopyWith(_$ExaminationStateLoading value,
          $Res Function(_$ExaminationStateLoading) then) =
      __$$ExaminationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExaminationStateLoadingCopyWithImpl<$Res>
    extends _$ExaminationStateCopyWithImpl<$Res>
    implements _$$ExaminationStateLoadingCopyWith<$Res> {
  __$$ExaminationStateLoadingCopyWithImpl(_$ExaminationStateLoading _value,
      $Res Function(_$ExaminationStateLoading) _then)
      : super(_value, (v) => _then(v as _$ExaminationStateLoading));

  @override
  _$ExaminationStateLoading get _value =>
      super._value as _$ExaminationStateLoading;
}

/// @nodoc

class _$ExaminationStateLoading implements ExaminationStateLoading {
  const _$ExaminationStateLoading();

  @override
  String toString() {
    return 'ExaminationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExaminationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
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
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExaminationStateLoading implements ExaminationState {
  const factory ExaminationStateLoading() = _$ExaminationStateLoading;
}

/// @nodoc
abstract class _$$ExaminationStateFailedCopyWith<$Res> {
  factory _$$ExaminationStateFailedCopyWith(_$ExaminationStateFailed value,
          $Res Function(_$ExaminationStateFailed) then) =
      __$$ExaminationStateFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$ExaminationStateFailedCopyWithImpl<$Res>
    extends _$ExaminationStateCopyWithImpl<$Res>
    implements _$$ExaminationStateFailedCopyWith<$Res> {
  __$$ExaminationStateFailedCopyWithImpl(_$ExaminationStateFailed _value,
      $Res Function(_$ExaminationStateFailed) _then)
      : super(_value, (v) => _then(v as _$ExaminationStateFailed));

  @override
  _$ExaminationStateFailed get _value =>
      super._value as _$ExaminationStateFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ExaminationStateFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExaminationStateFailed implements ExaminationStateFailed {
  const _$ExaminationStateFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ExaminationState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExaminationStateFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ExaminationStateFailedCopyWith<_$ExaminationStateFailed> get copyWith =>
      __$$ExaminationStateFailedCopyWithImpl<_$ExaminationStateFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
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
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class ExaminationStateFailed implements ExaminationState {
  const factory ExaminationStateFailed(final String error) =
      _$ExaminationStateFailed;

  String get error;
  @JsonKey(ignore: true)
  _$$ExaminationStateFailedCopyWith<_$ExaminationStateFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExaminationStateLoadedCopyWith<$Res> {
  factory _$$ExaminationStateLoadedCopyWith(_$ExaminationStateLoaded value,
          $Res Function(_$ExaminationStateLoaded) then) =
      __$$ExaminationStateLoadedCopyWithImpl<$Res>;
  $Res call({Test data, List<Choice> selections});
}

/// @nodoc
class __$$ExaminationStateLoadedCopyWithImpl<$Res>
    extends _$ExaminationStateCopyWithImpl<$Res>
    implements _$$ExaminationStateLoadedCopyWith<$Res> {
  __$$ExaminationStateLoadedCopyWithImpl(_$ExaminationStateLoaded _value,
      $Res Function(_$ExaminationStateLoaded) _then)
      : super(_value, (v) => _then(v as _$ExaminationStateLoaded));

  @override
  _$ExaminationStateLoaded get _value =>
      super._value as _$ExaminationStateLoaded;

  @override
  $Res call({
    Object? data = freezed,
    Object? selections = freezed,
  }) {
    return _then(_$ExaminationStateLoaded(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Test,
      selections == freezed
          ? _value._selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
    ));
  }
}

/// @nodoc

class _$ExaminationStateLoaded implements ExaminationStateLoaded {
  const _$ExaminationStateLoaded(this.data, final List<Choice> selections)
      : _selections = selections;

  @override
  final Test data;
  final List<Choice> _selections;
  @override
  List<Choice> get selections {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selections);
  }

  @override
  String toString() {
    return 'ExaminationState.loaded(data: $data, selections: $selections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExaminationStateLoaded &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_selections));

  @JsonKey(ignore: true)
  @override
  _$$ExaminationStateLoadedCopyWith<_$ExaminationStateLoaded> get copyWith =>
      __$$ExaminationStateLoadedCopyWithImpl<_$ExaminationStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) {
    return loaded(data, selections);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) {
    return loaded?.call(data, selections);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, selections);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ExaminationStateLoaded implements ExaminationState {
  const factory ExaminationStateLoaded(
          final Test data, final List<Choice> selections) =
      _$ExaminationStateLoaded;

  Test get data;
  List<Choice> get selections;
  @JsonKey(ignore: true)
  _$$ExaminationStateLoadedCopyWith<_$ExaminationStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExaminationStateStartedCopyWith<$Res> {
  factory _$$ExaminationStateStartedCopyWith(_$ExaminationStateStarted value,
          $Res Function(_$ExaminationStateStarted) then) =
      __$$ExaminationStateStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExaminationStateStartedCopyWithImpl<$Res>
    extends _$ExaminationStateCopyWithImpl<$Res>
    implements _$$ExaminationStateStartedCopyWith<$Res> {
  __$$ExaminationStateStartedCopyWithImpl(_$ExaminationStateStarted _value,
      $Res Function(_$ExaminationStateStarted) _then)
      : super(_value, (v) => _then(v as _$ExaminationStateStarted));

  @override
  _$ExaminationStateStarted get _value =>
      super._value as _$ExaminationStateStarted;
}

/// @nodoc

class _$ExaminationStateStarted implements ExaminationStateStarted {
  const _$ExaminationStateStarted();

  @override
  String toString() {
    return 'ExaminationState.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExaminationStateStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ExaminationStateStarted implements ExaminationState {
  const factory ExaminationStateStarted() = _$ExaminationStateStarted;
}

/// @nodoc
abstract class _$$ExaminationStateSubmittedCopyWith<$Res> {
  factory _$$ExaminationStateSubmittedCopyWith(
          _$ExaminationStateSubmitted value,
          $Res Function(_$ExaminationStateSubmitted) then) =
      __$$ExaminationStateSubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExaminationStateSubmittedCopyWithImpl<$Res>
    extends _$ExaminationStateCopyWithImpl<$Res>
    implements _$$ExaminationStateSubmittedCopyWith<$Res> {
  __$$ExaminationStateSubmittedCopyWithImpl(_$ExaminationStateSubmitted _value,
      $Res Function(_$ExaminationStateSubmitted) _then)
      : super(_value, (v) => _then(v as _$ExaminationStateSubmitted));

  @override
  _$ExaminationStateSubmitted get _value =>
      super._value as _$ExaminationStateSubmitted;
}

/// @nodoc

class _$ExaminationStateSubmitted implements ExaminationStateSubmitted {
  const _$ExaminationStateSubmitted();

  @override
  String toString() {
    return 'ExaminationState.submitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExaminationStateSubmitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class ExaminationStateSubmitted implements ExaminationState {
  const factory ExaminationStateSubmitted() = _$ExaminationStateSubmitted;
}

/// @nodoc
abstract class _$$ExaminationStateHistoryCopyWith<$Res> {
  factory _$$ExaminationStateHistoryCopyWith(_$ExaminationStateHistory value,
          $Res Function(_$ExaminationStateHistory) then) =
      __$$ExaminationStateHistoryCopyWithImpl<$Res>;
  $Res call({List<Examination> examinations});
}

/// @nodoc
class __$$ExaminationStateHistoryCopyWithImpl<$Res>
    extends _$ExaminationStateCopyWithImpl<$Res>
    implements _$$ExaminationStateHistoryCopyWith<$Res> {
  __$$ExaminationStateHistoryCopyWithImpl(_$ExaminationStateHistory _value,
      $Res Function(_$ExaminationStateHistory) _then)
      : super(_value, (v) => _then(v as _$ExaminationStateHistory));

  @override
  _$ExaminationStateHistory get _value =>
      super._value as _$ExaminationStateHistory;

  @override
  $Res call({
    Object? examinations = freezed,
  }) {
    return _then(_$ExaminationStateHistory(
      examinations == freezed
          ? _value._examinations
          : examinations // ignore: cast_nullable_to_non_nullable
              as List<Examination>,
    ));
  }
}

/// @nodoc

class _$ExaminationStateHistory implements ExaminationStateHistory {
  const _$ExaminationStateHistory(final List<Examination> examinations)
      : _examinations = examinations;

  final List<Examination> _examinations;
  @override
  List<Examination> get examinations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examinations);
  }

  @override
  String toString() {
    return 'ExaminationState.history(examinations: $examinations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExaminationStateHistory &&
            const DeepCollectionEquality()
                .equals(other._examinations, _examinations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_examinations));

  @JsonKey(ignore: true)
  @override
  _$$ExaminationStateHistoryCopyWith<_$ExaminationStateHistory> get copyWith =>
      __$$ExaminationStateHistoryCopyWithImpl<_$ExaminationStateHistory>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) failed,
    required TResult Function(Test data, List<Choice> selections) loaded,
    required TResult Function() started,
    required TResult Function() submitted,
    required TResult Function(List<Examination> examinations) history,
  }) {
    return history(examinations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
  }) {
    return history?.call(examinations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? failed,
    TResult Function(Test data, List<Choice> selections)? loaded,
    TResult Function()? started,
    TResult Function()? submitted,
    TResult Function(List<Examination> examinations)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(examinations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExaminationStateLoading value) loading,
    required TResult Function(ExaminationStateFailed value) failed,
    required TResult Function(ExaminationStateLoaded value) loaded,
    required TResult Function(ExaminationStateStarted value) started,
    required TResult Function(ExaminationStateSubmitted value) submitted,
    required TResult Function(ExaminationStateHistory value) history,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExaminationStateLoading value)? loading,
    TResult Function(ExaminationStateFailed value)? failed,
    TResult Function(ExaminationStateLoaded value)? loaded,
    TResult Function(ExaminationStateStarted value)? started,
    TResult Function(ExaminationStateSubmitted value)? submitted,
    TResult Function(ExaminationStateHistory value)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class ExaminationStateHistory implements ExaminationState {
  const factory ExaminationStateHistory(final List<Examination> examinations) =
      _$ExaminationStateHistory;

  List<Examination> get examinations;
  @JsonKey(ignore: true)
  _$$ExaminationStateHistoryCopyWith<_$ExaminationStateHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
