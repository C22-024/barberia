import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:barberia/features/activities/presentation/widgets/status_appointment_widget.dart';
import 'package:barberia/features/review/domain/entities/appointment.dart'
    as review;
import 'package:barberia/features/review/domain/entities/user.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class DetailHistoryPage extends StatelessWidget {
  final Appointment appointment;

  const DetailHistoryPage({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
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
                                rating: appointment.review == null
                                    ? 0
                                    : appointment.review!['rate'].toDouble(),
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow,
                                ),
                                itemSize: 40,
                              ),
                            ],
                          ),
                          Center(
                            child: BCard(
                              margin: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Column(
                                  children: [
                                    BText.caption('Review anda :'),
                                    BText.caption(
                                      appointment.review == null
                                          ? 'belum direview'
                                          : appointment.review!['content'],
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                            padding: const EdgeInsets.only(bottom: 10),
                            child: BText.titleSmall('Pelayanan'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(
                                'Jenis Layanan',
                              ),
                              BText.body(
                                appointment.services![0]['name'],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(
                                'Durasi Layanan',
                              ),
                              BText.body(
                                '${appointment.services![0]['durationInMinutes']} menit',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(
                                'Harga Layanan',
                              ),
                              BText.body(
                                'Rp. ${appointment.services![0]['price']}',
                              ),
                            ],
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
                            padding: const EdgeInsets.only(bottom: 10),
                            child: BText.titleSmall('Detail Pembayaran'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BText.body(
                                'Harga Layanan',
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
                                'Biaya admin',
                              ),
                              BText.body(
                                'Rp. 1000',
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
                                  'Rp. ${(1000) + appointment.services![0]['price']}',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BButton(
                variant: BButtonVariant.positive,
                label: 'Tambahkan Review',
                onPressed: () => context.pushNamed('add-review',
                    extra: review.Appointment(
                      id: appointment.id,
                      barbershopId: appointment.id,
                      barbershopName: appointment.barbershop['name'],
                      user: User(
                        id: appointment.user['id'],
                        name: appointment.user['name'],
                      ),
                      timestamp: appointment.timeStamp!,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
