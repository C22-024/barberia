import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/entitites/barbershop_overview.dart';

part 'nearest_barbershops_state.freezed.dart';

@freezed
class NearestBarbershopsState with _$NearestBarbershopsState {
  const factory NearestBarbershopsState.intial() = _Initial;
  const factory NearestBarbershopsState.loadInProgess() = _LoadInProgess;
  const factory NearestBarbershopsState.loadSuccess(
      List<BarbershopOverview> barbershops) = _LoadSuccess;
  const factory NearestBarbershopsState.loadFailure(Failure failure) =
      _LoadFailure;
}
