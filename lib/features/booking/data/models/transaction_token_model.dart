import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transaction_token.dart';

part 'transaction_token_model.freezed.dart';
part 'transaction_token_model.g.dart';

@freezed
class TransactionTokenModel with _$TransactionTokenModel {
  const factory TransactionTokenModel({
    required String token,
    @JsonKey(name: 'redirect_url') required String redirectUrl,
  }) = _TransactionTokenModel;

  const TransactionTokenModel._();

  factory TransactionTokenModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionTokenModelFromJson(json);

  TransactionToken toDomain() {
    return TransactionToken(token: token, redirectUrl: redirectUrl);
  }
}
