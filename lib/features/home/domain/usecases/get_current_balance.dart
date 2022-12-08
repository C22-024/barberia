import 'package:fpdart/fpdart.dart';

import '../../../../failures/failure.dart';
import '../repositories/home_repository.dart';

class GetCurrentBalance {
  const GetCurrentBalance(this._homeRepository);

  final HomeRepository _homeRepository;

  Stream<Either<Failure, int>> call(String userId) {
    return _homeRepository.getCurrentBalance(userId);
  }
}
