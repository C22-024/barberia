import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/repositories/auth_facade_impl.dart';
import 'features/auth/domain/repositories/auth_facade.dart';
import 'features/auth/domain/usecase/create_user_with_email_and_password.dart';
import 'features/auth/domain/usecase/get_signed_in_user.dart';
import 'features/auth/domain/usecase/sign_out.dart';
import 'features/auth/domain/usecase/signin_with_email_and_password.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/signin_form_bloc/signin_form_bloc.dart';
import 'features/auth/presentation/bloc/signup_form_bloc/signup_form_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // bloc
  getIt.registerLazySingleton<AuthBloc>(() => AuthBloc(
        getSignedInUser: getIt(),
        signOut: getIt(),
      ));
  getIt.registerFactory(() => SignInFormBloc(getIt()));
  getIt.registerFactory(() => SignUpFormBloc(getIt()));

  // usecase
  getIt.registerLazySingleton<GetSignedInUser>(() => GetSignedInUser(getIt()));
  getIt.registerLazySingleton<SignOut>(() => SignOut(getIt()));
  getIt.registerLazySingleton(() => SigninWithEmailAndPassword(getIt()));
  getIt.registerLazySingleton(() => CreateUserWithEmailAndPassword(getIt()));

  // repository
  getIt.registerLazySingleton<AuthFacade>(() => AuthFacadeImpl(getIt()));

  // external
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
}
