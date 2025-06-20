import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/FaQ.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/formule.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/homeviewbody.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/profile.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/profile_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/tutoscreen.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/widgets/custombuttombar.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/widgets/qr_code.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  int selectedIndex = 0;
  int selectedtype = 0;
  List views = [
    const Homeviewbody(),
    const Tutoscreen(),
    FAQScreen(),
    const SimpleUserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: custombottombar(
            selectedIndex: selectedIndex,
            onselect: (int) {
              setState(() {
                selectedIndex = int;
              });
            }),
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 28,
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(top: 6, left: 3),
            child: Image.asset(
              'assets/images/li.png',
              width: 12,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Algérie poste',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: views[selectedIndex]);
  }
}
