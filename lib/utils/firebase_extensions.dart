import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get userColRef => collection('users');
  CollectionReference get pointBalanceColRef => collection('pointBalances');
  CollectionReference get appointmentColRef => collection('appointments');
  CollectionReference get reviewColRef => collection('reviews');
  CollectionReference get barbershopColRef => collection('barbershops');
  CollectionReference barbershopPostColRef(String barbershopId) =>
      barbershopDocRef(barbershopId).collection('posts');
  CollectionReference barbershopServiceColRef(String barbershopId) =>
      barbershopDocRef(barbershopId).collection('services');
  CollectionReference pointHistoryColRef(String id) =>
      pointBalanceDocRef(id).collection('history');

  DocumentReference userDocRef(String id) => userColRef.doc(id);
  DocumentReference pointBalanceDocRef(String id) => pointBalanceColRef.doc(id);
  DocumentReference appointmentDocRef(String id) => appointmentColRef.doc(id);
  DocumentReference barbershopDocRef(String id) => barbershopColRef.doc(id);
}
