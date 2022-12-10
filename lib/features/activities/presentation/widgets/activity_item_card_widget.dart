import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../domain/entities/appointment.dart';
import 'status_appointment_widget.dart';

class ActivityItemCard extends StatelessWidget {
  const ActivityItemCard({
    Key? key,
    required this.appointment,
  }) : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(appointment.status['updatedAt']);

    return InkWell(
      onTap: () {
        context.goNamed('detail-activity', extra: appointment);
      },
      child: BCard(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 5),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Image.asset('assets/images/activities.png'),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BText.titleSmall(
                      appointment.barbershop['name'],
                    ),
                    StatusAppointment(status: appointment.status['code']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BText.caption(timeago.format(date, locale: 'id')),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
