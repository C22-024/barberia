import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/firebase_extensions.dart';
import '../models/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Stream<List<AppointmentModel>> getAppointments();
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  const AppointmentRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Stream<List<AppointmentModel>> getAppointments() async* {
    yield* _firestore.appointmentColRef.snapshots().map((event) => event.docs
        .map((e) => AppointmentModel.fromFirestore(
            e as DocumentSnapshot<Map<String, dynamic>>))
        .toList());
  }
}
