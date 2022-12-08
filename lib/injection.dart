import 'package:barberia/features/activities/data/datasources/appointment_remote_data_source.dart';
import 'package:barberia/features/activities/data/repositories/appointment_repository_impl.dart';
import 'package:barberia/features/activities/domain/repositories/appointment_repository.dart';
import 'package:barberia/features/activities/domain/usecases/get_appointments.dart';
import 'package:barberia/features/activities/presentation/bloc/appoinment_getter/appoinment_getter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'features/auth/data/datasources/user_remote_data_source.dart';
import 'features/auth/data/repositories/auth_facade_impl.dart';
import 'features/auth/data/repositories/user_repository_impl.dart';
import 'features/auth/domain/repositories/auth_facade.dart';
import 'features/auth/domain/repositories/user_repository.dart';
import 'features/auth/domain/usecase/create_user_profile.dart';
import 'features/auth/domain/usecase/create_user_with_email_and_password.dart';
import 'features/auth/domain/usecase/get_signed_in_user.dart';
import 'features/auth/domain/usecase/get_user_profile.dart';
import 'features/auth/domain/usecase/pick_image.dart';
import 'features/auth/domain/usecase/send_password_reset_email.dart';
import 'features/auth/domain/usecase/sign_out.dart';
import 'features/auth/domain/usecase/signin_with_email_and_password.dart';
import 'features/auth/domain/usecase/upload_profile_picture.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/password_reset_form_bloc/password_reset_form_bloc.dart';
import 'features/auth/presentation/bloc/profile_setup_form_bloc/profile_setup_bloc.dart';
import 'features/auth/presentation/bloc/signin_form_bloc/signin_form_bloc.dart';
import 'features/auth/presentation/bloc/signup_form_bloc/signup_form_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // bloc
  getIt.registerLazySingleton(() => AuthBloc(
        getSignedInUser: getIt(),
        signOut: getIt(),
        getUserProfile: getIt(),
      ));
  getIt.registerFactory(() => SignInFormBloc(getIt()));
  getIt.registerFactory(() => SignUpFormBloc(getIt()));
  getIt.registerFactory(() => PasswordResetFormBloc(getIt()));
  getIt.registerFactory(() => ProfileSetupFormBloc(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => AppoinmentGetterBloc(getIt()));

  // usecase
  getIt.registerLazySingleton(() => GetSignedInUser(getIt()));
  getIt.registerLazySingleton(() => SignOut(getIt()));
  getIt.registerLazySingleton(() => SigninWithEmailAndPassword(getIt()));
  getIt.registerLazySingleton(() => CreateUserWithEmailAndPassword(getIt()));
  getIt.registerLazySingleton(() => SendPasswordResetEmail(getIt()));
  getIt.registerLazySingleton(() => GetUserProfile(getIt()));
  getIt.registerLazySingleton(() => CreateUserProfile(getIt()));
  getIt.registerLazySingleton(() => PickImage(getIt(), getIt()));
  getIt.registerLazySingleton(() => UploadProfilePicture(getIt()));
  getIt.registerLazySingleton(() => GetAppointments(getIt()));

  // repository
  getIt.registerLazySingleton<AuthFacade>(() => AuthFacadeImpl(getIt()));
  getIt
      .registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AppointmentRepository>(
      () => AppointmentRepositoryImpl(getIt()));

  // data source
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<AppointmentRemoteDataSource>(
      () => AppointmentRemoteDataSourceImpl(getIt()));

  // external
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseStorage.instance);
  getIt.registerLazySingleton(() => ImagePicker());
  getIt.registerLazySingleton(() => ImageCropper());
}
