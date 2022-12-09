import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../injection.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../domain/usecases/get_barbershop.dart';
import '../../../domain/usecases/get_barbershop_posts.dart';
import '../../../domain/usecases/get_barbershop_services.dart';
import 'barbershop_detail_state.dart';
import 'posts_state.dart';
import 'services_state.dart';

part 'barbershop_bloc.freezed.dart';
part 'barbershop_event.dart';
part 'barbershop_state.dart';

class BarbershopBloc extends Bloc<BarbershopEvent, BarbershopState> {
  final GetBarbershop _getBarbershop;
  final GetBarbershopPosts _getBarbershopPosts;
  final GetBarbershopServices _getBarbershopServices;

  BarbershopBloc(
    this._getBarbershop,
    this._getBarbershopPosts,
    this._getBarbershopServices,
  ) : super(BarbershopState.initial()) {
    on<BarbershopEvent>((event, emit) async {
      await event.when(
        initialized: (barbershopId) => _handleInitialized(emit, barbershopId),
        postsRequested: (barbershopId) =>
            _handlePostsRequested(emit, barbershopId),
        servicesRequested: (barbershopId) =>
            _handleServicesRequested(emit, barbershopId),
      );
    });
  }

  Future<void> _handleInitialized(
    Emitter<BarbershopState> emit,
    String barbershopId,
  ) async {
    emit(state.copyWith(
      barbershopDetailState: const BarbershopDetailState.loadInProgress(),
    ));

    final user =
        getIt<AuthBloc>().state.whenOrNull(authenticated: (user) => user)!;
    final lastLocation = user.lastLocation!;

    final result = await _getBarbershop(barbershopId, lastLocation);

    result.fold(
      (failure) => emit(state.copyWith(
        barbershopDetailState: BarbershopDetailState.loadFailure(failure),
      )),
      (barbershop) {
        emit(state.copyWith(
          barbershopDetailState: BarbershopDetailState.loadSuccess(barbershop),
        ));
        add(BarbershopEvent.postsRequested(barbershopId));
        add(BarbershopEvent.servicesRequested(barbershopId));
      },
    );
  }

  Future<void> _handlePostsRequested(
    Emitter<BarbershopState> emit,
    String barbershopId,
  ) async {
    emit(state.copyWith(
      postsState: const PostsState.loadInProgress(),
    ));

    final result = await _getBarbershopPosts(barbershopId);

    result.fold(
      (failure) => emit(state.copyWith(
        postsState: PostsState.loadFailure(failure),
      )),
      (posts) => emit(state.copyWith(
        postsState: PostsState.loadSuccess(posts),
      )),
    );
  }

  Future<void> _handleServicesRequested(
    Emitter<BarbershopState> emit,
    String barbershopId,
  ) async {
    emit(state.copyWith(
      servicesState: const ServicesState.loadInProgress(),
    ));

    final result = await _getBarbershopServices(barbershopId);

    result.fold(
      (failure) => emit(state.copyWith(
        servicesState: ServicesState.loadFailure(failure),
      )),
      (services) => emit(state.copyWith(
        servicesState: ServicesState.loadSuccess(services),
      )),
    );
  }
}
