// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T get value => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
  @useResult
  $Res call({T value, String? message});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValueFailureCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$_ValueFailureCopyWith(
          _$_ValueFailure<T> value, $Res Function(_$_ValueFailure<T>) then) =
      __$$_ValueFailureCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T value, String? message});
}

/// @nodoc
class __$$_ValueFailureCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_ValueFailure<T>>
    implements _$$_ValueFailureCopyWith<T, $Res> {
  __$$_ValueFailureCopyWithImpl(
      _$_ValueFailure<T> _value, $Res Function(_$_ValueFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ValueFailure<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ValueFailure<T> implements _ValueFailure<T> {
  const _$_ValueFailure(this.value, {this.message});

  @override
  final T value;
  @override
  final String? message;

  @override
  String toString() {
    return 'ValueFailure<$T>(value: $value, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueFailure<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(value), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValueFailureCopyWith<T, _$_ValueFailure<T>> get copyWith =>
      __$$_ValueFailureCopyWithImpl<T, _$_ValueFailure<T>>(this, _$identity);
}

abstract class _ValueFailure<T> implements ValueFailure<T> {
  const factory _ValueFailure(final T value, {final String? message}) =
      _$_ValueFailure<T>;

  @override
  T get value;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ValueFailureCopyWith<T, _$_ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
