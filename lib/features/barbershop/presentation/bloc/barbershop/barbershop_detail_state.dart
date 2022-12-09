import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/entities/barbershop.dart';

part 'barbershop_detail_state.freezed.dart';

@freezed
class BarbershopDetailState with _$BarbershopDetailState {
  const factory BarbershopDetailState.initial() = _Initial;
  const factory BarbershopDetailState.loadInProgress() = _LoadInProgress;
  const factory BarbershopDetailState.loadSuccess(Barbershop barbershop) =
      _LoadSuccess;
  const factory BarbershopDetailState.loadFailure(Failure failure) =
      _LoadFailure;
}
