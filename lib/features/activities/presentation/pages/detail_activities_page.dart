import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:barberia/features/activities/presentation/widgets/activity_item_card_widget.dart';
import 'package:barberia/features/activities/presentation/widgets/status_appointment_widget.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:timeago/timeago.dart' as timeago;

class DetailActivitiesPage extends StatelessWidget {
  final Appointment appointment;

  const DetailActivitiesPage({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(appointment.status['updatedAt']);

    return Scaffold(
      appBar: BAppBar(
        title: BText.titleMedium('Detail Aktivitas'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: StatusAppointment(
                                  status: appointment.status['code'])),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBarIndicator(
                                rating: appointment.review!['rate'].toDouble(),
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow,
                                ),
                                itemSize: 40,
                              ),
                            ],
                          ),
                          BText.titleSmall(
                            appointment.barbershop['name'],
                          ),
                          BText.body(
                            appointment.barbershop['address'],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: BText.titleSmall('Pelayanan'),
                          ),
                          BText.body(
                            appointment.services![0]['name'],
                          ),
                          BText.body(
                            '${appointment.services![0]['durationInMinutes']} menit',
                          ),
                          BText.body(
                            'Rp. ${appointment.services![0]['price']}',
                          ),
                          BText.caption(timeago.format(date, locale: 'id')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: BText.titleSmall('Detail Pembayaran'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(
                                'Harga',
                              ),
                              BText.body(
                                'Rp. ${appointment.services![0]['price']}',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(
                                'Biaya aplikasi (5%)',
                              ),
                              BText.body(
                                'Rp. ${appointment.services![0]['price'] * 5 / 100}',
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BText.body(
                                  'Total Pembayaran',
                                ),
                                BText.body(
                                  'Rp. ${(appointment.services![0]['price'] * 5 / 100) + appointment.services![0]['price']}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
