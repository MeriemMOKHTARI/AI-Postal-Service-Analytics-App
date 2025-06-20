import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/widgets/qr_code.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
            child: SizedBox(
          height: 20,
        )),
        Expanded(flex: 4, child: qr_code()),
        Expanded(child: SizedBox())
      ],
    );
  }
}
