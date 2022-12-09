import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/entities/service.dart';

part 'services_state.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.initial() = _Initial;
  const factory ServicesState.loadInProgress() = _LoadInProgress;
  const factory ServicesState.loadSuccess(List<Service> services) =
      _LoadSuccess;
  const factory ServicesState.loadFailure(Failure failure) = _LoadFailure;
}
