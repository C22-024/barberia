import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/firebase_extensions.dart';
import '../models/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Stream<List<AppointmentModel>> getAppointments(String userId);
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  const AppointmentRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Stream<List<AppointmentModel>> getAppointments(String userId) async* {
    yield* _firestore.appointmentColRef
        .where('user.id', isEqualTo: userId)
        .orderBy('status.updatedAt', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => AppointmentModel.fromFirestore(
                e as DocumentSnapshot<Map<String, dynamic>>))
            .toList());
  }
}
