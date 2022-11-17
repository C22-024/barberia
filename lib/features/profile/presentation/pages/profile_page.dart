import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title: BText.titleSmall('Profileku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: BListTile(
            prefix: CircleAvatar(
              radius: BWidgetSize.medium.value,
              foregroundImage: const AssetImage(
                'assets/images/avatar.png',
              ),
            ),
            title: BText.highlightMedium('Kaesa Lyrih'),
            subtitle: BText.body('kaesalyrih@gmail.com'),
          ),
        ),
      ),
    );
  }
}
