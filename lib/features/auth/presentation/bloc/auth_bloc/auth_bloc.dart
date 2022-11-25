import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecase/get_signed_in_user.dart';
import '../../../domain/usecase/sign_out.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetSignedInUser getSignedInUser;
  final SignOut signOut;

  AuthBloc({
    required this.getSignedInUser,
    required this.signOut,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        authCheckRequested: () async {
          final result = await getSignedInUser();
          result.fold(
            () => emit(const AuthState.unauthenticated()),
            (user) {
              late final String oldUserId;
              User newUser = user.copyWith();

              state.maybeWhen(
                authenticated: (oldUser) => oldUserId = oldUser.id,
                orElse: () => oldUserId = '',
              );

              if (user.id != oldUserId) {
                // TODO: fetch new user profile stream
              }

              emit(AuthState.authenticated(newUser));
            },
          );
        },
        signedOutRequested: () async {
          await signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
