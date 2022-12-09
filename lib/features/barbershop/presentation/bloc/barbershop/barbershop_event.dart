part of 'barbershop_bloc.dart';

@freezed
class BarbershopEvent with _$BarbershopEvent {
  const factory BarbershopEvent.initialized(String barbershopId) = _Initialized;
  const factory BarbershopEvent.postsRequested(String barbershopId) =
      _PostsRequested;
  const factory BarbershopEvent.servicesRequested(String barbershopId) =
      _ServicesRequested;
}
