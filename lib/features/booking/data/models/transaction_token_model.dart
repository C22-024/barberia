import 'package:barberia/features/booking/domain/entities/transaction_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_token_model.freezed.dart';
part 'transaction_token_model.g.dart';

@freezed
class TransactionTokenModel with _$TransactionTokenModel {
  const factory TransactionTokenModel({
    required String token,
    required String redirectUrl,
  }) = _TransactionTokenModel;

  const TransactionTokenModel._();

  factory TransactionTokenModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionTokenModelFromJson(json);

  TransactionToken toDomain() {
    return TransactionToken(token: token, redirectUrl: redirectUrl);
  }
}
