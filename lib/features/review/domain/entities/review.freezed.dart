// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Review {
  String get appointmentId => throw _privateConstructorUsedError;
  String get barbershopId => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String appointmentId,
      String barbershopId,
      double rate,
      User user,
      String? content});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? barbershopId = null,
    Object? rate = null,
    Object? user = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      barbershopId: null == barbershopId
          ? _value.barbershopId
          : barbershopId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$_ReviewCopyWith(_$_Review value, $Res Function(_$_Review) then) =
      __$$_ReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appointmentId,
      String barbershopId,
      double rate,
      User user,
      String? content});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ReviewCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$_Review>
    implements _$$_ReviewCopyWith<$Res> {
  __$$_ReviewCopyWithImpl(_$_Review _value, $Res Function(_$_Review) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? barbershopId = null,
    Object? rate = null,
    Object? user = null,
    Object? content = freezed,
  }) {
    return _then(_$_Review(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      barbershopId: null == barbershopId
          ? _value.barbershopId
          : barbershopId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Review implements _Review {
  const _$_Review(
      {required this.appointmentId,
      required this.barbershopId,
      required this.rate,
      required this.user,
      this.content});

  @override
  final String appointmentId;
  @override
  final String barbershopId;
  @override
  final double rate;
  @override
  final User user;
  @override
  final String? content;

  @override
  String toString() {
    return 'Review(appointmentId: $appointmentId, barbershopId: $barbershopId, rate: $rate, user: $user, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Review &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.barbershopId, barbershopId) ||
                other.barbershopId == barbershopId) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, appointmentId, barbershopId, rate, user, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      __$$_ReviewCopyWithImpl<_$_Review>(this, _$identity);
}

abstract class _Review implements Review {
  const factory _Review(
      {required final String appointmentId,
      required final String barbershopId,
      required final double rate,
      required final User user,
      final String? content}) = _$_Review;

  @override
  String get appointmentId;
  @override
  String get barbershopId;
  @override
  double get rate;
  @override
  User get user;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      throw _privateConstructorUsedError;
}
