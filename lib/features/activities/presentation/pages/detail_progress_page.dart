import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:barberia/features/activities/presentation/widgets/status_appointment_widget.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

class DetailProgressPage extends StatelessWidget {
  final Appointment appointment;

  const DetailProgressPage({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title: BText.titleMedium('Detail Aktivitas'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: StatusAppointment(status: appointment.status['code']),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                'Rp. 2000',
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
                                  'Rp. ${(2000) + appointment.services![0]['price']}',
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
                variant: BButtonVariant.negative,
                label: 'Batalkan Appointment',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
