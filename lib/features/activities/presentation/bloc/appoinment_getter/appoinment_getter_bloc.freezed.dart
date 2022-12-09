// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appoinment_getter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppoinmentGetterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getAllStarted,
    required TResult Function(
            Either<Failure, List<Appointment>> failureOrAppointments)
        appointmentsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getAllStarted,
    TResult? Function(Either<Failure, List<Appointment>> failureOrAppointments)?
        appointmentsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getAllStarted,
    TResult Function(Either<Failure, List<Appointment>> failureOrAppointments)?
        appointmentsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllStarted value) getAllStarted,
    required TResult Function(_AppointmentsReceived value) appointmentsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllStarted value)? getAllStarted,
    TResult? Function(_AppointmentsReceived value)? appointmentsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllStarted value)? getAllStarted,
    TResult Function(_AppointmentsReceived value)? appointmentsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppoinmentGetterEventCopyWith<$Res> {
  factory $AppoinmentGetterEventCopyWith(AppoinmentGetterEvent value,
          $Res Function(AppoinmentGetterEvent) then) =
      _$AppoinmentGetterEventCopyWithImpl<$Res, AppoinmentGetterEvent>;
}

/// @nodoc
class _$AppoinmentGetterEventCopyWithImpl<$Res,
        $Val extends AppoinmentGetterEvent>
    implements $AppoinmentGetterEventCopyWith<$Res> {
  _$AppoinmentGetterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetAllStartedCopyWith<$Res> {
  factory _$$_GetAllStartedCopyWith(
          _$_GetAllStarted value, $Res Function(_$_GetAllStarted) then) =
      __$$_GetAllStartedCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$_GetAllStartedCopyWithImpl<$Res>
    extends _$AppoinmentGetterEventCopyWithImpl<$Res, _$_GetAllStarted>
    implements _$$_GetAllStartedCopyWith<$Res> {
  __$$_GetAllStartedCopyWithImpl(
      _$_GetAllStarted _value, $Res Function(_$_GetAllStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$_GetAllStarted(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetAllStarted implements _GetAllStarted {
  const _$_GetAllStarted(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'AppoinmentGetterEvent.getAllStarted(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAllStarted &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAllStartedCopyWith<_$_GetAllStarted> get copyWith =>
      __$$_GetAllStartedCopyWithImpl<_$_GetAllStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getAllStarted,
    required TResult Function(
            Either<Failure, List<Appointment>> failureOrAppointments)
        appointmentsReceived,
  }) {
    return getAllStarted(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getAllStarted,
    TResult? Function(Either<Failure, List<Appointment>> failureOrAppointments)?
        appointmentsReceived,
  }) {
    return getAllStarted?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getAllStarted,
    TResult Function(Either<Failure, List<Appointment>> failureOrAppointments)?
        appointmentsReceived,
    required TResult orElse(),
  }) {
    if (getAllStarted != null) {
      return getAllStarted(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllStarted value) getAllStarted,
    required TResult Function(_AppointmentsReceived value) appointmentsReceived,
  }) {
    return getAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllStarted value)? getAllStarted,
    TResult? Function(_AppointmentsReceived value)? appointmentsReceived,
  }) {
    return getAllStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllStarted value)? getAllStarted,
    TResult Function(_AppointmentsReceived value)? appointmentsReceived,
    required TResult orElse(),
  }) {
    if (getAllStarted != null) {
      return getAllStarted(this);
    }
    return orElse();
  }
}

abstract class _GetAllStarted implements AppoinmentGetterEvent {
  const factory _GetAllStarted(final String userId) = _$_GetAllStarted;

  String get userId;
  @JsonKey(ignore: true)
  _$$_GetAllStartedCopyWith<_$_GetAllStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppointmentsReceivedCopyWith<$Res> {
  factory _$$_AppointmentsReceivedCopyWith(_$_AppointmentsReceived value,
          $Res Function(_$_AppointmentsReceived) then) =
      __$$_AppointmentsReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<Failure, List<Appointment>> failureOrAppointments});
}

/// @nodoc
class __$$_AppointmentsReceivedCopyWithImpl<$Res>
    extends _$AppoinmentGetterEventCopyWithImpl<$Res, _$_AppointmentsReceived>
    implements _$$_AppointmentsReceivedCopyWith<$Res> {
  __$$_AppointmentsReceivedCopyWithImpl(_$_AppointmentsReceived _value,
      $Res Function(_$_AppointmentsReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrAppointments = null,
  }) {
    return _then(_$_AppointmentsReceived(
      null == failureOrAppointments
          ? _value.failureOrAppointments
          : failureOrAppointments // ignore: cast_nullable_to_non_nullable
              as Either<Failure, List<Appointment>>,
    ));
  }
}

/// @nodoc

class _$_AppointmentsReceived implements _AppointmentsReceived {
  const _$_AppointmentsReceived(this.failureOrAppointments);

  @override
  final Either<Failure, List<Appointment>> failureOrAppointments;

  @override
  String toString() {
    return 'AppoinmentGetterEvent.appointmentsReceived(failureOrAppointments: $failureOrAppointments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentsReceived &&
            (identical(other.failureOrAppointments, failureOrAppointments) ||
                other.failureOrAppointments == failureOrAppointments));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrAppointments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentsReceivedCopyWith<_$_AppointmentsReceived> get copyWith =>
      __$$_AppointmentsReceivedCopyWithImpl<_$_AppointmentsReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getAllStarted,
    required TResult Function(
            Either<Failure, List<Appointment>> failureOrAppointments)
        appointmentsReceived,
  }) {
    return appointmentsReceived(failureOrAppointments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getAllStarted,
    TResult? Function(Either<Failure, List<Appointment>> failureOrAppointments)?
        appointmentsReceived,
  }) {
    return appointmentsReceived?.call(failureOrAppointments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getAllStarted,
    TResult Function(Either<Failure, List<Appointment>> failureOrAppointments)?
        appointmentsReceived,
    required TResult orElse(),
  }) {
    if (appointmentsReceived != null) {
      return appointmentsReceived(failureOrAppointments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllStarted value) getAllStarted,
    required TResult Function(_AppointmentsReceived value) appointmentsReceived,
  }) {
    return appointmentsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllStarted value)? getAllStarted,
    TResult? Function(_AppointmentsReceived value)? appointmentsReceived,
  }) {
    return appointmentsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllStarted value)? getAllStarted,
    TResult Function(_AppointmentsReceived value)? appointmentsReceived,
    required TResult orElse(),
  }) {
    if (appointmentsReceived != null) {
      return appointmentsReceived(this);
    }
    return orElse();
  }
}

abstract class _AppointmentsReceived implements AppoinmentGetterEvent {
  const factory _AppointmentsReceived(
          final Either<Failure, List<Appointment>> failureOrAppointments) =
      _$_AppointmentsReceived;

  Either<Failure, List<Appointment>> get failureOrAppointments;
  @JsonKey(ignore: true)
  _$$_AppointmentsReceivedCopyWith<_$_AppointmentsReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppoinmentGetterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<Appointment> appointments) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<Appointment> appointments)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Failure failure)? failure,
    TResult Function(List<Appointment> appointments)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppoinmentGetterStateCopyWith<$Res> {
  factory $AppoinmentGetterStateCopyWith(AppoinmentGetterState value,
          $Res Function(AppoinmentGetterState) then) =
      _$AppoinmentGetterStateCopyWithImpl<$Res, AppoinmentGetterState>;
}

/// @nodoc
class _$AppoinmentGetterStateCopyWithImpl<$Res,
        $Val extends AppoinmentGetterState>
    implements $AppoinmentGetterStateCopyWith<$Res> {
  _$AppoinmentGetterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AppoinmentGetterStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AppoinmentGetterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<Appointment> appointments) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<Appointment> appointments)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Failure failure)? failure,
    TResult Function(List<Appointment> appointments)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppoinmentGetterState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_InProgressCopyWith<$Res> {
  factory _$$_InProgressCopyWith(
          _$_InProgress value, $Res Function(_$_InProgress) then) =
      __$$_InProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InProgressCopyWithImpl<$Res>
    extends _$AppoinmentGetterStateCopyWithImpl<$Res, _$_InProgress>
    implements _$$_InProgressCopyWith<$Res> {
  __$$_InProgressCopyWithImpl(
      _$_InProgress _value, $Res Function(_$_InProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InProgress implements _InProgress {
  const _$_InProgress();

  @override
  String toString() {
    return 'AppoinmentGetterState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<Appointment> appointments) success,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<Appointment> appointments)? success,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Failure failure)? failure,
    TResult Function(List<Appointment> appointments)? success,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgress implements AppoinmentGetterState {
  const factory _InProgress() = _$_InProgress;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$AppoinmentGetterStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_Failure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AppoinmentGetterState.failure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<Appointment> appointments) success,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<Appointment> appointments)? success,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Failure failure)? failure,
    TResult Function(List<Appointment> appointments)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AppoinmentGetterState {
  const factory _Failure(final Failure failure) = _$_Failure;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Appointment> appointments});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$AppoinmentGetterStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointments = null,
  }) {
    return _then(_$_Success(
      null == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(final List<Appointment> appointments)
      : _appointments = appointments;

  final List<Appointment> _appointments;
  @override
  List<Appointment> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  String toString() {
    return 'AppoinmentGetterState.success(appointments: $appointments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_appointments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<Appointment> appointments) success,
  }) {
    return success(appointments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<Appointment> appointments)? success,
  }) {
    return success?.call(appointments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(Failure failure)? failure,
    TResult Function(List<Appointment> appointments)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(appointments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InProgress value) inProgress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InProgress value)? inProgress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InProgress value)? inProgress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AppoinmentGetterState {
  const factory _Success(final List<Appointment> appointments) = _$_Success;

  List<Appointment> get appointments;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
