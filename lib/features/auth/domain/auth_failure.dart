import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.weakPassword() = _WeakPassword;
  const factory AuthFailure.invalidEmailOrPassword() = _InvalidEmailOrPassword;
  const factory AuthFailure.invalidEmail() = _InvalidEmail;
  const factory AuthFailure.timeout() = _Timeout;
  const factory AuthFailure.unexpected(String message) = _Unexpected;
}
