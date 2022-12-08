part of 'home_page_bloc.dart';

@freezed
class HomePageEvent with _$HomePageEvent {
  const factory HomePageEvent.initialized() = _Initialized;
  const factory HomePageEvent.currentBalanceReceived(
      Either<Failure, int> failureOrCurrentBalance) = _CurrentBalanceReceived;
  const factory HomePageEvent.nearestBarbershopsReceived(
    Either<Failure, List<BarbershopOverview>> failureOrBarbershops,
  ) = _NearestBarbershopsReceived;
}
