import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

import '../../../../constants/appointment_status_code.dart';

class StatusAppointment extends StatelessWidget {
  const StatusAppointment({
    Key? key,
    required this.status,
    this.style,
    this.color,
  }) : super(key: key);

  final String status;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final AppointmentStatusInfo appointmentStatusInfo =
        appointmentStatusInfoList.firstWhere((appointmentStatusInfo) =>
            appointmentStatusInfo.statusCode == status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color ?? appointmentStatusInfo.backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: BText(
        appointmentStatusInfo.bahasa,
        style: style ??
            baseTextStyle.copyWith(
              color: appointmentStatusInfo.foregroundColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
