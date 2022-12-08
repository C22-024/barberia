// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordResetFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? submitButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetFormEventCopyWith<$Res> {
  factory $PasswordResetFormEventCopyWith(PasswordResetFormEvent value,
          $Res Function(PasswordResetFormEvent) then) =
      _$PasswordResetFormEventCopyWithImpl<$Res, PasswordResetFormEvent>;
}

/// @nodoc
class _$PasswordResetFormEventCopyWithImpl<$Res,
        $Val extends PasswordResetFormEvent>
    implements $PasswordResetFormEventCopyWith<$Res> {
  _$PasswordResetFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EmailChangedCopyWith<$Res> {
  factory _$$_EmailChangedCopyWith(
          _$_EmailChanged value, $Res Function(_$_EmailChanged) then) =
      __$$_EmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_EmailChangedCopyWithImpl<$Res>
    extends _$PasswordResetFormEventCopyWithImpl<$Res, _$_EmailChanged>
    implements _$$_EmailChangedCopyWith<$Res> {
  __$$_EmailChangedCopyWithImpl(
      _$_EmailChanged _value, $Res Function(_$_EmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_EmailChanged(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetFormEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      __$$_EmailChangedCopyWithImpl<_$_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() submitButtonPressed,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? submitButtonPressed,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements PasswordResetFormEvent {
  const factory _EmailChanged(final String email) = _$_EmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitButtonPressedCopyWith<$Res> {
  factory _$$_SubmitButtonPressedCopyWith(_$_SubmitButtonPressed value,
          $Res Function(_$_SubmitButtonPressed) then) =
      __$$_SubmitButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmitButtonPressedCopyWithImpl<$Res>
    extends _$PasswordResetFormEventCopyWithImpl<$Res, _$_SubmitButtonPressed>
    implements _$$_SubmitButtonPressedCopyWith<$Res> {
  __$$_SubmitButtonPressedCopyWithImpl(_$_SubmitButtonPressed _value,
      $Res Function(_$_SubmitButtonPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SubmitButtonPressed implements _SubmitButtonPressed {
  const _$_SubmitButtonPressed();

  @override
  String toString() {
    return 'PasswordResetFormEvent.submitButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SubmitButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() submitButtonPressed,
  }) {
    return submitButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? submitButtonPressed,
  }) {
    return submitButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (submitButtonPressed != null) {
      return submitButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) {
    return submitButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) {
    return submitButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (submitButtonPressed != null) {
      return submitButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _SubmitButtonPressed implements PasswordResetFormEvent {
  const factory _SubmitButtonPressed() = _$_SubmitButtonPressed;
}

/// @nodoc
mixin _$PasswordResetFormState {
  Either<ValueFailure<String>, String> get email =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get errorMessagesShown => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get sendEmailFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordResetFormStateCopyWith<PasswordResetFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetFormStateCopyWith<$Res> {
  factory $PasswordResetFormStateCopyWith(PasswordResetFormState value,
          $Res Function(PasswordResetFormState) then) =
      _$PasswordResetFormStateCopyWithImpl<$Res, PasswordResetFormState>;
  @useResult
  $Res call(
      {Either<ValueFailure<String>, String> email,
      bool isSubmitting,
      bool errorMessagesShown,
      Option<Either<AuthFailure, Unit>> sendEmailFailureOrSuccessOption});
}

/// @nodoc
class _$PasswordResetFormStateCopyWithImpl<$Res,
        $Val extends PasswordResetFormState>
    implements $PasswordResetFormStateCopyWith<$Res> {
  _$PasswordResetFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? isSubmitting = null,
    Object? errorMessagesShown = null,
    Object? sendEmailFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessagesShown: null == errorMessagesShown
          ? _value.errorMessagesShown
          : errorMessagesShown // ignore: cast_nullable_to_non_nullable
              as bool,
      sendEmailFailureOrSuccessOption: null == sendEmailFailureOrSuccessOption
          ? _value.sendEmailFailureOrSuccessOption
          : sendEmailFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordResetFormStateCopyWith<$Res>
    implements $PasswordResetFormStateCopyWith<$Res> {
  factory _$$_PasswordResetFormStateCopyWith(_$_PasswordResetFormState value,
          $Res Function(_$_PasswordResetFormState) then) =
      __$$_PasswordResetFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Either<ValueFailure<String>, String> email,
      bool isSubmitting,
      bool errorMessagesShown,
      Option<Either<AuthFailure, Unit>> sendEmailFailureOrSuccessOption});
}

/// @nodoc
class __$$_PasswordResetFormStateCopyWithImpl<$Res>
    extends _$PasswordResetFormStateCopyWithImpl<$Res,
        _$_PasswordResetFormState>
    implements _$$_PasswordResetFormStateCopyWith<$Res> {
  __$$_PasswordResetFormStateCopyWithImpl(_$_PasswordResetFormState _value,
      $Res Function(_$_PasswordResetFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? isSubmitting = null,
    Object? errorMessagesShown = null,
    Object? sendEmailFailureOrSuccessOption = null,
  }) {
    return _then(_$_PasswordResetFormState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessagesShown: null == errorMessagesShown
          ? _value.errorMessagesShown
          : errorMessagesShown // ignore: cast_nullable_to_non_nullable
              as bool,
      sendEmailFailureOrSuccessOption: null == sendEmailFailureOrSuccessOption
          ? _value.sendEmailFailureOrSuccessOption
          : sendEmailFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_PasswordResetFormState implements _PasswordResetFormState {
  const _$_PasswordResetFormState(
      {required this.email,
      required this.isSubmitting,
      required this.errorMessagesShown,
      required this.sendEmailFailureOrSuccessOption});

  @override
  final Either<ValueFailure<String>, String> email;
  @override
  final bool isSubmitting;
  @override
  final bool errorMessagesShown;
  @override
  final Option<Either<AuthFailure, Unit>> sendEmailFailureOrSuccessOption;

  @override
  String toString() {
    return 'PasswordResetFormState(email: $email, isSubmitting: $isSubmitting, errorMessagesShown: $errorMessagesShown, sendEmailFailureOrSuccessOption: $sendEmailFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordResetFormState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessagesShown, errorMessagesShown) ||
                other.errorMessagesShown == errorMessagesShown) &&
            (identical(other.sendEmailFailureOrSuccessOption,
                    sendEmailFailureOrSuccessOption) ||
                other.sendEmailFailureOrSuccessOption ==
                    sendEmailFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, isSubmitting,
      errorMessagesShown, sendEmailFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordResetFormStateCopyWith<_$_PasswordResetFormState> get copyWith =>
      __$$_PasswordResetFormStateCopyWithImpl<_$_PasswordResetFormState>(
          this, _$identity);
}

abstract class _PasswordResetFormState implements PasswordResetFormState {
  const factory _PasswordResetFormState(
      {required final Either<ValueFailure<String>, String> email,
      required final bool isSubmitting,
      required final bool errorMessagesShown,
      required final Option<Either<AuthFailure, Unit>>
          sendEmailFailureOrSuccessOption}) = _$_PasswordResetFormState;

  @override
  Either<ValueFailure<String>, String> get email;
  @override
  bool get isSubmitting;
  @override
  bool get errorMessagesShown;
  @override
  Option<Either<AuthFailure, Unit>> get sendEmailFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordResetFormStateCopyWith<_$_PasswordResetFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
