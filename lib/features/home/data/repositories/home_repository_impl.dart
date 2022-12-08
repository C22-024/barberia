import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../failures/failure.dart';
import '../../domain/entitites/barbershop_overview.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._homeRemoteDataSource);

  final HomeRemoteDataSource _homeRemoteDataSource;

  @override
  Future<Either<Failure, Unit>> updateLastLocation({
    required String userId,
    required GeoFirePoint currentLocation,
  }) async {
    try {
      await _homeRemoteDataSource.updateLastLocation(
        userId: userId,
        currentLocation: currentLocation,
      );
      return right(unit);
    } on FirebaseException catch (e) {
      return left(
        Failure.unexpected(e.toString(), error: e, stackTrace: e.stackTrace),
      );
    }
  }

  @override
  Stream<Either<Failure, int>> getCurrentBalance(String userId) async* {
    yield* _homeRemoteDataSource
        .getCurrentBalance(userId)
        .map((currentBalance) => right<Failure, int>(currentBalance))
        .onErrorReturnWith((error, stackTrace) =>
            left(Failure.unexpected(error.toString(), stackTrace: stackTrace)));
  }

  @override
  Stream<Either<Failure, List<BarbershopOverview>>> getNearestBarbershops(
    GeoFirePoint userLocation,
  ) async* {
    yield* _homeRemoteDataSource.getNearestBarbershops(userLocation).asyncMap(
      (models) async {
        final entities = await Future.wait(
          models.map((model) => model.toDomain(userLocation)),
        );
        return right<Failure, List<BarbershopOverview>>(entities);
      },
    ).onErrorReturnWith(
      (e, _) {
        return left(Failure.unexpected(e.toString()));
      },
    );
  }
}
