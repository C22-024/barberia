part of 'barbershop_bloc.dart';

@freezed
class BarbershopState with _$BarbershopState {
  const factory BarbershopState({
    required BarbershopDetailState barbershopDetailState,
    required PostsState postsState,
    required ServicesState servicesState,
  }) = _BarbershopState;

  factory BarbershopState.initial() => const BarbershopState(
        barbershopDetailState: BarbershopDetailState.initial(),
        postsState: PostsState.initial(),
        servicesState: ServicesState.initial(),
      );
}
