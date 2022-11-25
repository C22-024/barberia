import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/data/repositories/auth_facade_impl.dart';
import 'features/auth/domain/repositories/auth_facade.dart';
import 'features/auth/domain/usecase/get_signed_in_user.dart';
import 'features/auth/domain/usecase/sign_out.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // bloc
  getIt.registerLazySingleton<AuthBloc>(() => AuthBloc(
        getSignedInUser: getIt(),
        signOut: getIt(),
      ));

  // usecase
  getIt.registerLazySingleton<GetSignedInUser>(() => GetSignedInUser(getIt()));
  getIt.registerLazySingleton<SignOut>(() => SignOut(getIt()));

  // repository
  getIt.registerLazySingleton<AuthFacade>(() => AuthFacadeImpl(getIt()));

  // external
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
}
