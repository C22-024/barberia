import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../entities/post.dart';
import '../repositories/barbershop_repository.dart';

class GetBarbershopPosts {
  const GetBarbershopPosts(this._repository);

  final BarbershopRepository _repository;

  Future<Either<Failure, List<Post>>> call(String barbershopId) {
    return _repository.getBarbershopPosts(barbershopId);
  }
}
