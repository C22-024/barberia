import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_token.freezed.dart';

@freezed
class TransactionToken with _$TransactionToken {
  const factory TransactionToken({
    required String token,
    required String redirectUrl,
  }) = _TransactionToken;
}
