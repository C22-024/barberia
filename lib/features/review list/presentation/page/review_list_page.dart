import 'package:barberia/constants/appointment_status_code.dart';
import 'package:barberia/features/activities/domain/entities/appointment.dart';
import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewListPage extends StatelessWidget {
  final List<AppointmentReview> appointmentReview = [
    AppointmentReview(
      user: 'Mas kukuh',
      rate: 4,
      content: 'Mantap...\nRecomended gan...\nCocok untuk segala usia...',
    ),
    AppointmentReview(
      user: 'Mas Kevin',
      rate: 5,
      content:
          'Tempat yang bagus untuk memotong rambut Anda, Anda juga akan mendapatkan pijat dan minuman gratis .... bagus.',
    ),
    AppointmentReview(
      user: 'Mas Zafran',
      rate: 3,
      content: 'Pelayanan nya memuaskan',
    ),
  ];

  final String barbershopName = 'United Barbershop';

  ReviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title: BText.titleMedium('Daftar Review ${barbershopName}'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: appointmentReview.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: BColors.background,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BText.titleMedium(appointmentReview[index].user),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: RatingBarIndicator(
                          rating: appointmentReview[index].rate.toDouble(),
                          itemCount: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star_sharp,
                            color: BColors.warning,
                          ),
                          itemSize: 15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: BText.body(
                          appointmentReview[index].content,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
