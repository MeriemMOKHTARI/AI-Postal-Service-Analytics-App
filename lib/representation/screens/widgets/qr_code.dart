import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/Gotouter.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/cubit/post_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/cubit/user_signupcubit.dart';

class qr_code extends StatefulWidget {
  const qr_code({super.key});

  @override
  State<qr_code> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<qr_code> {
  String _scanResult = 'Not yet scanned';

  Future<void> _scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#003B95',
        'Cancel',
        true,
        ScanMode.QR,
      );
    } catch (e) {
      barcodeScanRes = 'Failed to get scanning result';
    }

    if (!mounted) return;
    context.read<PostCubit>().getPosts(barcodeScanRes);

    setState(() {
      _scanResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.postModel.last_name),
          ));
          GoRouter.of(context).push(routerapp.CardViewpath);
        }
        if (state is PostFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errmessage),
          ));
        }
      },
      builder: (context, state) {
        print(state);
        return Expanded(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tabs

                // Scan Button
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _scanQR,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2185D5),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                        ),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _scanResult,
                        style: GoogleFonts.poppins(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabButton(String title, {required bool isSelected}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
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
}
