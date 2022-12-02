// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_setup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileSetupFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() imagePickerOpened,
    required TResult Function(String name) nameChanged,
    required TResult Function() submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? imagePickerOpened,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? imagePickerOpened,
    TResult Function(String name)? nameChanged,
    TResult Function()? submitButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagePickerOpened value) imagePickerOpened,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSetupFormEventCopyWith<$Res> {
  factory $ProfileSetupFormEventCopyWith(ProfileSetupFormEvent value,
          $Res Function(ProfileSetupFormEvent) then) =
      _$ProfileSetupFormEventCopyWithImpl<$Res, ProfileSetupFormEvent>;
}

/// @nodoc
class _$ProfileSetupFormEventCopyWithImpl<$Res,
        $Val extends ProfileSetupFormEvent>
    implements $ProfileSetupFormEventCopyWith<$Res> {
  _$ProfileSetupFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ImagePickerOpenedCopyWith<$Res> {
  factory _$$_ImagePickerOpenedCopyWith(_$_ImagePickerOpened value,
          $Res Function(_$_ImagePickerOpened) then) =
      __$$_ImagePickerOpenedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ImagePickerOpenedCopyWithImpl<$Res>
    extends _$ProfileSetupFormEventCopyWithImpl<$Res, _$_ImagePickerOpened>
    implements _$$_ImagePickerOpenedCopyWith<$Res> {
  __$$_ImagePickerOpenedCopyWithImpl(
      _$_ImagePickerOpened _value, $Res Function(_$_ImagePickerOpened) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ImagePickerOpened implements _ImagePickerOpened {
  const _$_ImagePickerOpened();

  @override
  String toString() {
    return 'ProfileSetupFormEvent.imagePickerOpened()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ImagePickerOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() imagePickerOpened,
    required TResult Function(String name) nameChanged,
    required TResult Function() submitButtonPressed,
  }) {
    return imagePickerOpened();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? imagePickerOpened,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? submitButtonPressed,
  }) {
    return imagePickerOpened?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? imagePickerOpened,
    TResult Function(String name)? nameChanged,
    TResult Function()? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (imagePickerOpened != null) {
      return imagePickerOpened();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagePickerOpened value) imagePickerOpened,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) {
    return imagePickerOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) {
    return imagePickerOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (imagePickerOpened != null) {
      return imagePickerOpened(this);
    }
    return orElse();
  }
}

abstract class _ImagePickerOpened implements ProfileSetupFormEvent {
  const factory _ImagePickerOpened() = _$_ImagePickerOpened;
}

/// @nodoc
abstract class _$$_NameChangedCopyWith<$Res> {
  factory _$$_NameChangedCopyWith(
          _$_NameChanged value, $Res Function(_$_NameChanged) then) =
      __$$_NameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_NameChangedCopyWithImpl<$Res>
    extends _$ProfileSetupFormEventCopyWithImpl<$Res, _$_NameChanged>
    implements _$$_NameChangedCopyWith<$Res> {
  __$$_NameChangedCopyWithImpl(
      _$_NameChanged _value, $Res Function(_$_NameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_NameChanged(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'ProfileSetupFormEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameChanged &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      __$$_NameChangedCopyWithImpl<_$_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() imagePickerOpened,
    required TResult Function(String name) nameChanged,
    required TResult Function() submitButtonPressed,
  }) {
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? imagePickerOpened,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? submitButtonPressed,
  }) {
    return nameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? imagePickerOpened,
    TResult Function(String name)? nameChanged,
    TResult Function()? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ImagePickerOpened value) imagePickerOpened,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements ProfileSetupFormEvent {
  const factory _NameChanged(final String name) = _$_NameChanged;

  String get name;
  @JsonKey(ignore: true)
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
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
    extends _$ProfileSetupFormEventCopyWithImpl<$Res, _$_SubmitButtonPressed>
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
    return 'ProfileSetupFormEvent.submitButtonPressed()';
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
    required TResult Function() imagePickerOpened,
    required TResult Function(String name) nameChanged,
    required TResult Function() submitButtonPressed,
  }) {
    return submitButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? imagePickerOpened,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? submitButtonPressed,
  }) {
    return submitButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? imagePickerOpened,
    TResult Function(String name)? nameChanged,
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
    required TResult Function(_ImagePickerOpened value) imagePickerOpened,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_SubmitButtonPressed value) submitButtonPressed,
  }) {
    return submitButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_SubmitButtonPressed value)? submitButtonPressed,
  }) {
    return submitButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ImagePickerOpened value)? imagePickerOpened,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_SubmitButtonPressed value)? submitButtonPressed,
    required TResult orElse(),
  }) {
    if (submitButtonPressed != null) {
      return submitButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _SubmitButtonPressed implements ProfileSetupFormEvent {
  const factory _SubmitButtonPressed() = _$_SubmitButtonPressed;
}

/// @nodoc
mixin _$ProfileSetupFormState {
  Option<File> get profilePictureOption => throw _privateConstructorUsedError;
  Either<ValueFailure<String>, String> get name =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get errorMessagesShown => throw _privateConstructorUsedError;
  Option<Either<Failure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileSetupFormStateCopyWith<ProfileSetupFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSetupFormStateCopyWith<$Res> {
  factory $ProfileSetupFormStateCopyWith(ProfileSetupFormState value,
          $Res Function(ProfileSetupFormState) then) =
      _$ProfileSetupFormStateCopyWithImpl<$Res, ProfileSetupFormState>;
  @useResult
  $Res call(
      {Option<File> profilePictureOption,
      Either<ValueFailure<String>, String> name,
      bool isSubmitting,
      bool errorMessagesShown,
      Option<Either<Failure, Unit>> failureOrSuccessOption});
}

/// @nodoc
class _$ProfileSetupFormStateCopyWithImpl<$Res,
        $Val extends ProfileSetupFormState>
    implements $ProfileSetupFormStateCopyWith<$Res> {
  _$ProfileSetupFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePictureOption = null,
    Object? name = null,
    Object? isSubmitting = null,
    Object? errorMessagesShown = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      profilePictureOption: null == profilePictureOption
          ? _value.profilePictureOption
          : profilePictureOption // ignore: cast_nullable_to_non_nullable
              as Option<File>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessagesShown: null == errorMessagesShown
          ? _value.errorMessagesShown
          : errorMessagesShown // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileSetupFormStateCopyWith<$Res>
    implements $ProfileSetupFormStateCopyWith<$Res> {
  factory _$$_ProfileSetupFormStateCopyWith(_$_ProfileSetupFormState value,
          $Res Function(_$_ProfileSetupFormState) then) =
      __$$_ProfileSetupFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<File> profilePictureOption,
      Either<ValueFailure<String>, String> name,
      bool isSubmitting,
      bool errorMessagesShown,
      Option<Either<Failure, Unit>> failureOrSuccessOption});
}

/// @nodoc
class __$$_ProfileSetupFormStateCopyWithImpl<$Res>
    extends _$ProfileSetupFormStateCopyWithImpl<$Res, _$_ProfileSetupFormState>
    implements _$$_ProfileSetupFormStateCopyWith<$Res> {
  __$$_ProfileSetupFormStateCopyWithImpl(_$_ProfileSetupFormState _value,
      $Res Function(_$_ProfileSetupFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePictureOption = null,
    Object? name = null,
    Object? isSubmitting = null,
    Object? errorMessagesShown = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_ProfileSetupFormState(
      profilePictureOption: null == profilePictureOption
          ? _value.profilePictureOption
          : profilePictureOption // ignore: cast_nullable_to_non_nullable
              as Option<File>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure<String>, String>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessagesShown: null == errorMessagesShown
          ? _value.errorMessagesShown
          : errorMessagesShown // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ProfileSetupFormState implements _ProfileSetupFormState {
  const _$_ProfileSetupFormState(
      {required this.profilePictureOption,
      required this.name,
      required this.isSubmitting,
      required this.errorMessagesShown,
      required this.failureOrSuccessOption});

  @override
  final Option<File> profilePictureOption;
  @override
  final Either<ValueFailure<String>, String> name;
  @override
  final bool isSubmitting;
  @override
  final bool errorMessagesShown;
  @override
  final Option<Either<Failure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ProfileSetupFormState(profilePictureOption: $profilePictureOption, name: $name, isSubmitting: $isSubmitting, errorMessagesShown: $errorMessagesShown, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileSetupFormState &&
            (identical(other.profilePictureOption, profilePictureOption) ||
                other.profilePictureOption == profilePictureOption) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessagesShown, errorMessagesShown) ||
                other.errorMessagesShown == errorMessagesShown) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profilePictureOption, name,
      isSubmitting, errorMessagesShown, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileSetupFormStateCopyWith<_$_ProfileSetupFormState> get copyWith =>
      __$$_ProfileSetupFormStateCopyWithImpl<_$_ProfileSetupFormState>(
          this, _$identity);
}

abstract class _ProfileSetupFormState implements ProfileSetupFormState {
  const factory _ProfileSetupFormState(
      {required final Option<File> profilePictureOption,
      required final Either<ValueFailure<String>, String> name,
      required final bool isSubmitting,
      required final bool errorMessagesShown,
      required final Option<Either<Failure, Unit>>
          failureOrSuccessOption}) = _$_ProfileSetupFormState;

  @override
  Option<File> get profilePictureOption;
  @override
  Either<ValueFailure<String>, String> get name;
  @override
  bool get isSubmitting;
  @override
  bool get errorMessagesShown;
  @override
  Option<Either<Failure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileSetupFormStateCopyWith<_$_ProfileSetupFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
