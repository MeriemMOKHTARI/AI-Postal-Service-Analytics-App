import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/formule.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/widgets/qr_code.dart';

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key});

  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  int selectedtype = 0;
  List list = [const qr_code(), const FormulaireScreen()];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildTabButton('QR Code', isSelected: selectedtype == 0,
                  onPressed: () {
                selectedtype = 0;
                setState(() {});
              }),
              const SizedBox(width: 16),
              _buildTabButton(
                'Formulaire',
                isSelected: selectedtype == 1,
                onPressed: () {
                  selectedtype = 1;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        list[selectedtype],
      ],
    );
  }
}

Widget _buildTabButton(String title,
    {required bool isSelected, required void Function()? onPressed}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xff2185D5) : Colors.white,
        foregroundColor: isSelected ? Colors.white : const Color(0xff2185D5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.transparent : const Color(0xff2185D5),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    ),
  );
}
