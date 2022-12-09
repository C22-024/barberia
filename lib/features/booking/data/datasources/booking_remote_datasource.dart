import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/bpoin_transaction_status_code.dart';
import '../../../../utils/firebase_extensions.dart';
import '../models/appointment_model.dart';
import '../models/bpoin_transaction_model.dart';
import '../models/bpoin_transaction_status_model.dart';
import '../models/transaction_token_model.dart';

abstract class BookingRemoteDatasource {
  Future<TransactionTokenModel> getTransactionToken(
      AppointmentModel appointment);
  Future<void> createAppointment(AppointmentModel appointment);
}

class BookingRemoteDatasourceImpl implements BookingRemoteDatasource {
  const BookingRemoteDatasourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  int calculateGrossAmount(AppointmentModel appointment) {
    int grossAmount = 0;
    for (final element in appointment.paymentDetails.details) {
      grossAmount += element.amount;
    }
    return grossAmount;
  }

  @override
  Future<void> createAppointment(AppointmentModel appointment) async {
    final pointBalanceDocRef =
        _firestore.pointBalanceDocRef(appointment.user.id);
    final appointmentDocRef = _firestore.appointmentColRef.doc();
    final pointHistoryDocRef =
        _firestore.pointHistoryColRef(appointment.user.id).doc();

    await _firestore.runTransaction((transaction) async {
      if (appointment.paymentDetails.channels.isNotEmpty) {
        final snapshot = await transaction.get(pointBalanceDocRef);
        final currentBalance = snapshot.get('currentBalance');
        final payWithBPoinAmount =
            appointment.paymentDetails.channels[0].amount;
        if (currentBalance < payWithBPoinAmount) {
          throw Exception('Insufficient BPoin balance.');
        }

        final timestamp = DateTime.now().millisecondsSinceEpoch;

        final bpoinTransaction = BPoinTransactionModel(
          status: BPoinTransactionStatusModel(
            code: BPoinTransactionStatusCode.success,
            updatedAt: timestamp,
          ),
          amount: payWithBPoinAmount,
          timestamp: timestamp,
          description: 'Pembayaran appointment ${appointment.id}',
        );

        transaction.update(pointBalanceDocRef, {
          'currentBalance': FieldValue.increment(-payWithBPoinAmount),
        });
        transaction.set(pointHistoryDocRef, bpoinTransaction.toJson());
      }
      transaction.set(appointmentDocRef, appointment.toJson());
    });
  }

  @override
  Future<TransactionTokenModel> getTransactionToken(
    AppointmentModel appointment,
  ) async {
    final url = Uri.https('app.sandbox.midtrans.com', 'snap/v1/transactions');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${const String.fromEnvironment('AUTH_STRING')}',
    };
    final grossAmount = calculateGrossAmount(appointment);
    final itemDetails = appointment.paymentDetails.details
        .map((e) => {
              'id': e.id,
              'name': e.name,
              'price': e.amount,
              'quantity': 1,
            })
        .toList();
    final body = {
      'transaction_details': {
        'order_id': appointment.id,
        'gross_amount': grossAmount,
      },
      'customer_details': {
        'first_name': appointment.user.name,
      },
      'item_details': itemDetails,
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode != 201) {
      throw Exception('Status Code: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return TransactionTokenModel.fromJson(decoded);
  }
}
