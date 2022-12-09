import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/bpoin_transaction_status_code.dart';

part 'bpoin_transaction_status_model.freezed.dart';
part 'bpoin_transaction_status_model.g.dart';

@freezed
class BPoinTransactionStatusModel with _$BPoinTransactionStatusModel {
  const factory BPoinTransactionStatusModel({
    required BPoinTransactionStatusCode code,
    required int updatedAt,
    String? message,
  }) = _BPoinTransactionStatus;

  factory BPoinTransactionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$BPoinTransactionStatusModelFromJson(json);
}
