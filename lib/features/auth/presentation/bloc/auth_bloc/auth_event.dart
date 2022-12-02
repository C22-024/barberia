part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
  const factory AuthEvent.userProfileReceived(
      Either<Failure, User> failureOrUser) = _UserProfileReceived;
  const factory AuthEvent.signedOutRequested() = _SignedOutRequested;
}
