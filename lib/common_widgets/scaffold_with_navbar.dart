import 'package:barberia_ui/barberia_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.child});

  final Widget child;

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouter.of(context).location;
    if (location.startsWith('/activities')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed('home');
        break;
      case 1:
        context.goNamed('activities');
        break;
      case 2:
        context.goNamed('profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'Aktivitas',
            icon: Icon(Icons.note_outlined),
            activeIcon: Icon(Icons.note),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
          ),
        ],
        fixedColor: BColors.onBackground,
        backgroundColor: BColors.background,
        unselectedLabelStyle: captionStyle,
        selectedLabelStyle: captionStyle.copyWith(fontWeight: FontWeight.w600),
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onTap(context, index),
      ),
    );
  }
}
