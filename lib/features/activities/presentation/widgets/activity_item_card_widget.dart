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
    required this.activityType,
  }) : super(key: key);

  final Appointment appointment;
  final String activityType;

  @override
  Widget build(BuildContext context) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(appointment.status['updatedAt']);

    return InkWell(
      onTap: () {
        context.pushNamed('detail-$activityType-activity', extra: appointment);
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
                child: const Icon(
                  Icons.cut_rounded,
                  size: 60,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BText.titleSmall(
                          appointment.barbershop['name'],
                        ),
                        BText.caption(timeago.format(date, locale: 'id')),
                      ],
                    ),
                    StatusAppointment(status: appointment.status['code']),
                    BText.body(
                      'Rp. ${appointment.services![0]['price'].toString()}',
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
