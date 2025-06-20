import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class custombottombar extends StatelessWidget {
  custombottombar(
      {super.key, required this.selectedIndex, required this.onselect});
  int selectedIndex;
  void Function(int) onselect;
  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      backgroundColor: const Color(0xff2185D5).withOpacity(0.9),
      currentIndex: selectedIndex,
      onTap: onselect,
      items: [
        CustomNavigationBarItem(
            icon: const Icon(
              IconlyLight.scan,
              color: Colors.white,
            ),
            selectedIcon: const Icon(
              IconlyBold.scan,
              color: Colors.white,
            ),
            selectedTitle: const Text(
              'QR',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8),
            )),
        CustomNavigationBarItem(
            icon: const Icon(
              IconlyLight.video,
              color: Colors.white,
            ),
            selectedIcon: const Icon(
              IconlyBold.video,
              color: Colors.white,
            ),
            selectedTitle: const Text(
              'Videos',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8),
            )),
        CustomNavigationBarItem(
            icon: const Icon(
              IconlyLight.calendar,
              color: Colors.white,
            ),
            selectedIcon: const Icon(
              IconlyBold.calendar,
              color: Colors.white,
            ),
            selectedTitle: const Text(
              'FaQ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8),
            )),
        CustomNavigationBarItem(
            icon: const Icon(
              IconlyLight.profile,
              color: Colors.white,
            ),
            selectedIcon: const Icon(
              IconlyBold.profile,
              color: Colors.white,
            ),
            selectedTitle: const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8),
            )),
      ],
    );
  }
}
