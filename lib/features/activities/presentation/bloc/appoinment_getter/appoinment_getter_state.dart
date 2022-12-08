part of 'appoinment_getter_bloc.dart';

@freezed
class AppoinmentGetterState with _$AppoinmentGetterState {
  const factory AppoinmentGetterState.initial() = _Initial;
  const factory AppoinmentGetterState.inProgress() = _InProgress;
  const factory AppoinmentGetterState.failure(Failure failure) = _Failure;
  const factory AppoinmentGetterState.success(List<Appointment> appointments) =
      _Success;
}
