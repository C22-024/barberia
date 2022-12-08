import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get userColRef => collection('users');
  CollectionReference get pointBalanceColRef => collection('pointBalances');
  CollectionReference get appointmentColRef => collection('appointments');

  DocumentReference userDocRef(String id) => userColRef.doc(id);
  DocumentReference pointBalanceDocRef(String id) => pointBalanceColRef.doc(id);
}
