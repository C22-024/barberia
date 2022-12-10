import 'package:freezed_annotation/freezed_annotation.dart';

part 'getter_state.freezed.dart';

@freezed
class GetterState with _$GetterState {
  const factory GetterState.initial() = _Initial;
  const factory GetterState.loadInProgress() = _LoadInProgress;
  const factory GetterState.loadSuccess() = _LoadSuccess;
  const factory GetterState.loadFailure() = _LoadFailure;
}
