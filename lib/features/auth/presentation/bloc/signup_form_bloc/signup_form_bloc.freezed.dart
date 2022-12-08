// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmationPassword)
        confirmationPasswordChanged,
    required TResult Function() signUpButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult? Function()? signUpButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult Function()? signUpButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmationPasswordChanged value)
        confirmationPasswordChanged,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult? Function(_SignUpButtonPressed value)? signUpButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormEventCopyWith<$Res> {
  factory $SignUpFormEventCopyWith(
          SignUpFormEvent value, $Res Function(SignUpFormEvent) then) =
      _$SignUpFormEventCopyWithImpl<$Res, SignUpFormEvent>;
}

/// @nodoc
class _$SignUpFormEventCopyWithImpl<$Res, $Val extends SignUpFormEvent>
    implements $SignUpFormEventCopyWith<$Res> {
  _$SignUpFormEventCopyWithImpl(this._value, this._then);

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
    extends _$SignUpFormEventCopyWithImpl<$Res, _$_EmailChanged>
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
    return 'SignUpFormEvent.emailChanged(email: $email)';
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
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmationPassword)
        confirmationPasswordChanged,
    required TResult Function() signUpButtonPressed,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult? Function()? signUpButtonPressed,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult Function()? signUpButtonPressed,
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
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmationPasswordChanged value)
        confirmationPasswordChanged,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult? Function(_SignUpButtonPressed value)? signUpButtonPressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements SignUpFormEvent {
  const factory _EmailChanged(final String email) = _$_EmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PasswordChangedCopyWith<$Res> {
  factory _$$_PasswordChangedCopyWith(
          _$_PasswordChanged value, $Res Function(_$_PasswordChanged) then) =
      __$$_PasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_PasswordChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$_PasswordChanged>
    implements _$$_PasswordChangedCopyWith<$Res> {
  __$$_PasswordChangedCopyWithImpl(
      _$_PasswordChanged _value, $Res Function(_$_PasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_PasswordChanged(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordChanged implements _PasswordChanged {
  const _$_PasswordChanged(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignUpFormEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordChanged &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      __$$_PasswordChangedCopyWithImpl<_$_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmationPassword)
        confirmationPasswordChanged,
    required TResult Function() signUpButtonPressed,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult? Function()? signUpButtonPressed,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult Function()? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmationPasswordChanged value)
        confirmationPasswordChanged,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult? Function(_SignUpButtonPressed value)? signUpButtonPressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SignUpFormEvent {
  const factory _PasswordChanged(final String password) = _$_PasswordChanged;

  String get password;
  @JsonKey(ignore: true)
  _$$_PasswordChangedCopyWith<_$_PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmationPasswordChangedCopyWith<$Res> {
  factory _$$_ConfirmationPasswordChangedCopyWith(
          _$_ConfirmationPasswordChanged value,
          $Res Function(_$_ConfirmationPasswordChanged) then) =
      __$$_ConfirmationPasswordChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String confirmationPassword});
}

/// @nodoc
class __$$_ConfirmationPasswordChangedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$_ConfirmationPasswordChanged>
    implements _$$_ConfirmationPasswordChangedCopyWith<$Res> {
  __$$_ConfirmationPasswordChangedCopyWithImpl(
      _$_ConfirmationPasswordChanged _value,
      $Res Function(_$_ConfirmationPasswordChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmationPassword = null,
  }) {
    return _then(_$_ConfirmationPasswordChanged(
      null == confirmationPassword
          ? _value.confirmationPassword
          : confirmationPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ConfirmationPasswordChanged implements _ConfirmationPasswordChanged {
  const _$_ConfirmationPasswordChanged(this.confirmationPassword);

  @override
  final String confirmationPassword;

  @override
  String toString() {
    return 'SignUpFormEvent.confirmationPasswordChanged(confirmationPassword: $confirmationPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmationPasswordChanged &&
            (identical(other.confirmationPassword, confirmationPassword) ||
                other.confirmationPassword == confirmationPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmationPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfirmationPasswordChangedCopyWith<_$_ConfirmationPasswordChanged>
      get copyWith => __$$_ConfirmationPasswordChangedCopyWithImpl<
          _$_ConfirmationPasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmationPassword)
        confirmationPasswordChanged,
    required TResult Function() signUpButtonPressed,
  }) {
    return confirmationPasswordChanged(confirmationPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult? Function()? signUpButtonPressed,
  }) {
    return confirmationPasswordChanged?.call(confirmationPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult Function()? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (confirmationPasswordChanged != null) {
      return confirmationPasswordChanged(confirmationPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmationPasswordChanged value)
        confirmationPasswordChanged,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
  }) {
    return confirmationPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult? Function(_SignUpButtonPressed value)? signUpButtonPressed,
  }) {
    return confirmationPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (confirmationPasswordChanged != null) {
      return confirmationPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class _ConfirmationPasswordChanged implements SignUpFormEvent {
  const factory _ConfirmationPasswordChanged(
      final String confirmationPassword) = _$_ConfirmationPasswordChanged;

  String get confirmationPassword;
  @JsonKey(ignore: true)
  _$$_ConfirmationPasswordChangedCopyWith<_$_ConfirmationPasswordChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpButtonPressedCopyWith<$Res> {
  factory _$$_SignUpButtonPressedCopyWith(_$_SignUpButtonPressed value,
          $Res Function(_$_SignUpButtonPressed) then) =
      __$$_SignUpButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpButtonPressedCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$_SignUpButtonPressed>
    implements _$$_SignUpButtonPressedCopyWith<$Res> {
  __$$_SignUpButtonPressedCopyWithImpl(_$_SignUpButtonPressed _value,
      $Res Function(_$_SignUpButtonPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUpButtonPressed implements _SignUpButtonPressed {
  const _$_SignUpButtonPressed();

  @override
  String toString() {
    return 'SignUpFormEvent.signUpButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignUpButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmationPassword)
        confirmationPasswordChanged,
    required TResult Function() signUpButtonPressed,
  }) {
    return signUpButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult? Function()? signUpButtonPressed,
  }) {
    return signUpButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmationPassword)? confirmationPasswordChanged,
    TResult Function()? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (signUpButtonPressed != null) {
      return signUpButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmationPasswordChanged value)
        confirmationPasswordChanged,
    required TResult Function(_SignUpButtonPressed value) signUpButtonPressed,
  }) {
    return signUpButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult? Function(_SignUpButtonPressed value)? signUpButtonPressed,
  }) {
    return signUpButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmationPasswordChanged value)?
        confirmationPasswordChanged,
    TResult Function(_SignUpButtonPressed value)? signUpButtonPressed,
    required TResult orElse(),
  }) {
    if (signUpButtonPressed != null) {
      return signUpButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _SignUpButtonPressed implements SignUpFormEvent {
  const factory _SignUpButtonPressed() = _$_SignUpButtonPressed;
}

/// @nodoc
mixin _$SignUpFormState {
  Either<ValueFailure<String>, String> get email =>
      throw _privateConstructorUsedError;
  Either<ValueFailure<String>, String> get password =>
      throw _privateConstructorUsedError;
  String get confirmationPassword => throw _privateConstructorUsedError;
  bool get isConfirmationPasswordValid => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get errorMessagesShown => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpFormStateCopyWith<SignUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormStateCopyWith<$Res> {
  factory $SignUpFormStateCopyWith(
          SignUpFormState value, $Res Function(SignUpFormState) then) =
      _$SignUpFormStateCopyWithImpl<$Res, SignUpFormState>;
  @useResult
  $Res call(
      {Either<ValueFailure<String>, String> email,
      Either<ValueFailure<String>, String> password,
      String confirmationPassword,
      bool isConfirmationPasswordValid,
      bool isSubmitting,
      bool errorMessagesShown,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignUpFormStateCopyWithImpl<$Res, $Val extends SignUpFormState>
    implements $SignUpFormStateCopyWith<$Res> {
  _$SignUpFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmationPassword = null,
    Object? isConfirmationPasswordValid = null,
    Object? isSubmitting = null,
    Object? errorMessagesShown = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      confirmationPassword: null == confirmationPassword
          ? _value.confirmationPassword
          : confirmationPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isConfirmationPasswordValid: null == isConfirmationPasswordValid
          ? _value.isConfirmationPasswordValid
          : isConfirmationPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessagesShown: null == errorMessagesShown
          ? _value.errorMessagesShown
          : errorMessagesShown // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupFormStateCopyWith<$Res>
    implements $SignUpFormStateCopyWith<$Res> {
  factory _$$_SignupFormStateCopyWith(
          _$_SignupFormState value, $Res Function(_$_SignupFormState) then) =
      __$$_SignupFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Either<ValueFailure<String>, String> email,
      Either<ValueFailure<String>, String> password,
      String confirmationPassword,
      bool isConfirmationPasswordValid,
      bool isSubmitting,
      bool errorMessagesShown,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_SignupFormStateCopyWithImpl<$Res>
    extends _$SignUpFormStateCopyWithImpl<$Res, _$_SignupFormState>
    implements _$$_SignupFormStateCopyWith<$Res> {
  __$$_SignupFormStateCopyWithImpl(
      _$_SignupFormState _value, $Res Function(_$_SignupFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmationPassword = null,
    Object? isConfirmationPasswordValid = null,
    Object? isSubmitting = null,
    Object? errorMessagesShown = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_SignupFormState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      confirmationPassword: null == confirmationPassword
          ? _value.confirmationPassword
          : confirmationPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isConfirmationPasswordValid: null == isConfirmationPasswordValid
          ? _value.isConfirmationPasswordValid
          : isConfirmationPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessagesShown: null == errorMessagesShown
          ? _value.errorMessagesShown
          : errorMessagesShown // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_SignupFormState implements _SignupFormState {
  const _$_SignupFormState(
      {required this.email,
      required this.password,
      required this.confirmationPassword,
      required this.isConfirmationPasswordValid,
      required this.isSubmitting,
      required this.errorMessagesShown,
      required this.authFailureOrSuccessOption});

  @override
  final Either<ValueFailure<String>, String> email;
  @override
  final Either<ValueFailure<String>, String> password;
  @override
  final String confirmationPassword;
  @override
  final bool isConfirmationPasswordValid;
  @override
  final bool isSubmitting;
  @override
  final bool errorMessagesShown;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignUpFormState(email: $email, password: $password, confirmationPassword: $confirmationPassword, isConfirmationPasswordValid: $isConfirmationPasswordValid, isSubmitting: $isSubmitting, errorMessagesShown: $errorMessagesShown, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupFormState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmationPassword, confirmationPassword) ||
                other.confirmationPassword == confirmationPassword) &&
            (identical(other.isConfirmationPasswordValid,
                    isConfirmationPasswordValid) ||
                other.isConfirmationPasswordValid ==
                    isConfirmationPasswordValid) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessagesShown, errorMessagesShown) ||
                other.errorMessagesShown == errorMessagesShown) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      confirmationPassword,
      isConfirmationPasswordValid,
      isSubmitting,
      errorMessagesShown,
      authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupFormStateCopyWith<_$_SignupFormState> get copyWith =>
      __$$_SignupFormStateCopyWithImpl<_$_SignupFormState>(this, _$identity);
}

abstract class _SignupFormState implements SignUpFormState {
  const factory _SignupFormState(
      {required final Either<ValueFailure<String>, String> email,
      required final Either<ValueFailure<String>, String> password,
      required final String confirmationPassword,
      required final bool isConfirmationPasswordValid,
      required final bool isSubmitting,
      required final bool errorMessagesShown,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_SignupFormState;

  @override
  Either<ValueFailure<String>, String> get email;
  @override
  Either<ValueFailure<String>, String> get password;
  @override
  String get confirmationPassword;
  @override
  bool get isConfirmationPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get errorMessagesShown;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SignupFormStateCopyWith<_$_SignupFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
