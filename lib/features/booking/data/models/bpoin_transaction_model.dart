import 'package:freezed_annotation/freezed_annotation.dart';

import 'bpoin_transaction_status_model.dart';

part 'bpoin_transaction_model.freezed.dart';
part 'bpoin_transaction_model.g.dart';

@freezed
class BPoinTransactionModel with _$BPoinTransactionModel {
  const factory BPoinTransactionModel({
    required BPoinTransactionStatusModel status,
    required int amount,
    required int timestamp,
    required String description,
  }) = _BPoinTransactionModel;

  factory BPoinTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$BPoinTransactionModelFromJson(json);
}
