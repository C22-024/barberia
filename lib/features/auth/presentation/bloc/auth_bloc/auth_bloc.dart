import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../constants/unauthenticated_reason.dart';
import '../../../../../failures/failure.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecase/get_signed_in_user.dart';
import '../../../domain/usecase/get_user_profile.dart';
import '../../../domain/usecase/sign_out.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetSignedInUser getSignedInUser;
  final SignOut signOut;
  final GetUserProfile getUserProfile;

  StreamSubscription<Either<Failure, User?>>? _userProfileStreamSubscription;

  AuthBloc({
    required this.getSignedInUser,
    required this.signOut,
    required this.getUserProfile,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        authCheckRequested: () async {
          final result = await getSignedInUser();
          result.fold(
            () => emit(const AuthState.unauthenticated(
              UnauthenticatedReason.notSignedIn,
            )),
            (user) {
              late final String oldUserId;

              state.maybeWhen(
                authenticated: (oldUser) => oldUserId = oldUser.id,
                orElse: () => oldUserId = '',
              );

              if (user.id != oldUserId || user.name == null) {
                _userProfileStreamSubscription?.cancel();
                _userProfileStreamSubscription = getUserProfile(user.id).listen(
                  (failureOrUser) {
                    failureOrUser.fold(
                      (failure) => add(AuthEvent.userProfileReceived(
                          left<Failure, User>(failure))),
                      (userProfile) {
                        final mergedUser = user.copyWith(
                          name: userProfile?.name,
                          photoUrl: userProfile?.photoUrl,
                          lastLocation: userProfile?.lastLocation,
                        );
                        add(AuthEvent.userProfileReceived(
                          right<Failure, User>(mergedUser),
                        ));
                      },
                    );
                  },
                );
              } else {
                emit(AuthState.authenticated(user));
              }
            },
          );
        },
        userProfileReceived: (failureOrUser) async {
          failureOrUser.fold(
            (failure) {
              failure.maybeWhen(
                unexpected: (_, __, ___) =>
                    emit(const AuthState.unauthenticated(
                  UnauthenticatedReason.failedToLoadProfile,
                )),
                orElse: () {},
              );
            },
            (user) => emit(AuthState.authenticated(user)),
          );
        },
        signedOutRequested: () async {
          await signOut();
          await _userProfileStreamSubscription?.cancel();
          emit(
            const AuthState.unauthenticated(UnauthenticatedReason.signedOut),
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    _userProfileStreamSubscription?.cancel();
    return super.close();
  }
}
