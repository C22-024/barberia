import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

enum AppointmentStatusCode {
  waitingForPayment,
  paid,
  expired,
  accepted,
  rejected,
  autoCanceled,
  ongoing,
  completed,
  canceledByUser,
  canceledByBarbershop,
}

enum AppointmentOnProgress {
  waitingForPayment,
  paid,
  accepted,
  ongoing,
}

const statusToBahasa = {
  'waitingForPayment': 'Menunggu Pembayaran',
  'paid': 'Dibayar',
  'expired': 'Kadaluarsa',
  'accepted': 'Diterima',
  'rejected': 'Ditolak',
  'autoCanceled': 'Dibatalkan Secara Otomatis',
  'ongoing': 'Sedang Berlangsung',
  'completed': 'Selesai',
  'canceledByUser': 'Dibatalkan Oleh Pengguna',
  'canceledByBarbershop': 'Dibatalkan oleh Barber',
};

List<AppointmentStatusInfo> appointmentStatusInfoList = [
  AppointmentStatusInfo(
    statusCode: 'waitingForPayment',
    bahasa: 'Menunggu Pembayaran',
    backgroundColor: const Color(0xFFFFF8E1),
    foregroundColor: Colors.red,
  ),
  AppointmentStatusInfo(
    statusCode: 'paid',
    bahasa: 'Dibayar',
    backgroundColor: const Color(0xFFFFF8E1),
    foregroundColor: Colors.red,
  ),
  AppointmentStatusInfo(
    statusCode: 'expired',
    bahasa: 'Kadaluarsa',
    backgroundColor: BColors.neutral0,
    foregroundColor: Colors.black,
  ),
  AppointmentStatusInfo(
    statusCode: 'accepted',
    bahasa: 'Diterima',
    backgroundColor: const Color(0xFFE8F5E9),
    foregroundColor: const Color(0xFFCF9B00),
  ),
  AppointmentStatusInfo(
    statusCode: 'rejected',
    bahasa: 'Ditolak',
    backgroundColor: const Color(0xFFFFCDD2),
    foregroundColor: const Color(0xFFE53935),
  ),
  AppointmentStatusInfo(
    statusCode: 'autoCanceled',
    bahasa: 'Dibatalkan Secara Otomatis',
    backgroundColor: const Color(0xFFFFCDD2),
    foregroundColor: const Color(0xFFE53935),
  ),
  AppointmentStatusInfo(
    statusCode: 'ongoing',
    bahasa: 'Sedang Berlangsung',
    backgroundColor: const Color(0xFFE8F5E9),
    foregroundColor: const Color(0xFFCF9B00),
  ),
  AppointmentStatusInfo(
    statusCode: 'completed',
    bahasa: 'Selesai',
    backgroundColor: const Color(0xFFC8E6C9),
    foregroundColor: const Color(0xFF43A047),
  ),
  AppointmentStatusInfo(
    statusCode: 'canceledByUser',
    bahasa: 'Dibatalkan Oleh Pengguna',
    backgroundColor: const Color(0xFFFFCDD2),
    foregroundColor: const Color(0xFFE53935),
  ),
  AppointmentStatusInfo(
    statusCode: 'canceledByBarbershop',
    bahasa: 'Dibatalkan oleh Barber',
    backgroundColor: const Color(0xFFFFCDD2),
    foregroundColor: const Color(0xFFE53935),
  ),
];

class AppointmentStatusInfo {
  AppointmentStatusInfo({
    required this.statusCode,
    required this.bahasa,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String statusCode;
  final String bahasa;
  final Color backgroundColor;
  final Color foregroundColor;
}

class AppointmentReview {
  AppointmentReview({
    required this.user,
    required this.rate,
    required this.content,
  });

  final String user;
  final double rate;
  final String content;
}
