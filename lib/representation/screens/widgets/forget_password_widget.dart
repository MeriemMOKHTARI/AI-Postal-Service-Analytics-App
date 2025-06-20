import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  final Size size;

  const ForgetPasswordWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement forgot password functionality
      },
      child: const Text(
        'Mot de passe oublié ?',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
