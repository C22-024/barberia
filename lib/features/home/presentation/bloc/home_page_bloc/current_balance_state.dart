import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';

part 'current_balance_state.freezed.dart';

@freezed
class CurrentBalanceState with _$CurrentBalanceState {
  const factory CurrentBalanceState.initial() = _Initial;
  const factory CurrentBalanceState.loadInProgress() = _LoadInProgress;
  const factory CurrentBalanceState.loadSuccess(int currentBalance) =
      _LoadSuccess;
  const factory CurrentBalanceState.loadFailure(Failure failure) = _LoadFailure;
}
