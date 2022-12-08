part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    required Option<String> lastPlacemarker,
    required CurrentBalanceState currentBalanceState,
    required NearestBarbershopsState nearestBarbershopsState,
  }) = _HomePageState;

  factory HomePageState.initial() => HomePageState(
        lastPlacemarker: none(),
        currentBalanceState: const CurrentBalanceState.initial(),
        nearestBarbershopsState: const NearestBarbershopsState.intial(),
      );
}
