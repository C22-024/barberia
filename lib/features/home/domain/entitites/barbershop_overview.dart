import 'package:freezed_annotation/freezed_annotation.dart';

part 'barbershop_overview.freezed.dart';

@freezed
class BarbershopOverview with _$BarbershopOverview {
  const factory BarbershopOverview({
    required String id,
    required String name,
    required double rating,
    required double distance,
    String? photoUrl,
    String? bannerUrl,
  }) = _BarbershopOverview;
}
