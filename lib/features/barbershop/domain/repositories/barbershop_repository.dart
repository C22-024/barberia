import 'package:fpdart/fpdart.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../../../../failures/failure.dart';
import '../entities/barbershop.dart';
import '../entities/post.dart';
import '../entities/service.dart';

abstract class BarbershopRepository {
  Future<Either<Failure, Barbershop>> getBarbershop(
      String id, GeoFirePoint userLocation);
  Future<Either<Failure, List<Post>>> getBarbershopPosts(String barbershopId);
  Future<Either<Failure, List<Service>>> getBarbershopServices(
    String barbershopId,
  );
}
