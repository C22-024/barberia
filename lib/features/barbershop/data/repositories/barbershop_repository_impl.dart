import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../failures/failure.dart';
import '../../domain/entities/barbershop.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/service.dart';
import '../../domain/repositories/barbershop_repository.dart';
import '../datasources/barbershop_remote_datasource.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  const BarbershopRepositoryImpl(this._barbershopRemoteDatasource);

  final BarbershopRemoteDatasource _barbershopRemoteDatasource;

  @override
  Future<Either<Failure, Barbershop>> getBarbershop(
    String id,
    GeoFirePoint userLocation,
  ) async {
    try {
      final model = await _barbershopRemoteDatasource.getBarbershop(id);
      final barbershop = await model.toDomain(userLocation);
      return right(barbershop);
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getBarbershopPosts(
    String barbershopId,
  ) async {
    try {
      final postModels =
          await _barbershopRemoteDatasource.getBarbershopPosts(barbershopId);
      final result = await Future.wait(
        postModels.map((postModel) => postModel.toDomain()),
      );
      return right(result);
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Service>>> getBarbershopServices(
    String barbershopId,
  ) async {
    try {
      final result =
          await _barbershopRemoteDatasource.getBarbershopServices(barbershopId);
      return right(
        result.map((serviceModel) => serviceModel.toDomain()).toList(),
      );
    } catch (e) {
      return left(Failure.unexpected(e.toString()));
    }
  }
}
