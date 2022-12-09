import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'features/activities/data/datasources/appointment_remote_data_source.dart';
import 'features/activities/data/repositories/appointment_repository_impl.dart';
import 'features/activities/domain/repositories/appointment_repository.dart';
import 'features/activities/domain/usecases/get_appointments.dart';
import 'features/activities/presentation/bloc/appoinment_getter/appoinment_getter_bloc.dart';
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
import 'features/profile/data/datasource/profile_user_remote_data_source.dart';
import 'features/profile/data/repositories/profile_user_repository_impl.dart';
import 'features/profile/domain/repositories/profile_user_repository.dart';
import 'features/profile/domain/usecase/get_profile_picture.dart';
import 'features/profile/domain/usecase/update_user_profile.dart';
import 'features/profile/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'features/profile/presentation/bloc/get_profile_picture_bloc/get_profile_picture_bloc.dart';
import 'features/barbershop/data/datasources/barbershop_remote_datasource.dart';
import 'features/barbershop/data/repositories/barbershop_repository_impl.dart';
import 'features/barbershop/domain/repositories/barbershop_repository.dart';
import 'features/barbershop/domain/usecases/get_barbershop.dart';
import 'features/barbershop/domain/usecases/get_barbershop_posts.dart';
import 'features/barbershop/domain/usecases/get_barbershop_services.dart';
import 'features/barbershop/presentation/bloc/barbershop/barbershop_bloc.dart';
import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_current_balance.dart';
import 'features/home/domain/usecases/get_gps_location.dart';
import 'features/home/domain/usecases/get_nearest_barbershops.dart';
import 'features/home/domain/usecases/get_placemark_from_coordinates.dart';
import 'features/home/domain/usecases/request_location_permission.dart';
import 'features/home/domain/usecases/update_last_location.dart';
import 'features/home/presentation/bloc/home_page_bloc/home_page_bloc.dart';
import 'features/home/presentation/bloc/location_settings_bloc/location_settings_bloc.dart';

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
  getIt.registerFactory(() => GetProfilePictureBloc(getIt()));
  getIt.registerFactory(() => EditProfileBloc(getIt(), getIt(), getIt(), getIt()));
  getIt.registerFactory(() => AppoinmentGetterBloc(getIt()));
  getIt.registerFactory(() => LocationSettingsBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory(() => HomePageBloc(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => BarbershopBloc(getIt(), getIt(), getIt()));

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
  getIt.registerLazySingleton(() => GetProfilePicture(getIt()));
  getIt.registerLazySingleton(() => UpdateUserProfile(getIt()));
  getIt.registerLazySingleton(() => GetAppointments(getIt()));
  getIt.registerLazySingleton(() => UpdateLastLocation(getIt()));
  getIt.registerLazySingleton(() => const RequestLocationPermission());
  getIt.registerLazySingleton(() => const GetGPSLocation());
  getIt.registerLazySingleton(() => const GetPlacemarkFromCoordinates());
  getIt.registerLazySingleton(() => GetCurrentBalance(getIt()));
  getIt.registerLazySingleton(() => GetNearestBarbershops(getIt()));
  getIt.registerLazySingleton(() => GetBarbershop(getIt()));
  getIt.registerLazySingleton(() => GetBarbershopPosts(getIt()));
  getIt.registerLazySingleton(() => GetBarbershopServices(getIt()));

  // repository
  getIt.registerLazySingleton<AuthFacade>(() => AuthFacadeImpl(getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));
  getIt.registerLazySingleton<ProfileUserRepository>(() => ProfileUserRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AppointmentRepository>(() => AppointmentRepositoryImpl(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));
  getIt.registerLazySingleton<BarbershopRepository>(
    () => BarbershopRepositoryImpl(getIt()),
  );

  // data source
  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<ProfileUserRemoteDataSource>(() => ProfileUserRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<AppointmentRemoteDataSource>(() => AppointmentRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(getIt(), getIt()));
  getIt.registerLazySingleton<BarbershopRemoteDatasource>(() => BarbershopRemoteDatasourceImpl(getIt()));

  // external
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseStorage.instance);
  getIt.registerLazySingleton(() => GeoFlutterFire());
  getIt.registerLazySingleton(() => ImagePicker());
  getIt.registerLazySingleton(() => ImageCropper());
}
