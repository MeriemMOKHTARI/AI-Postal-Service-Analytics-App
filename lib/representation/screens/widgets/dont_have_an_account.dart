import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/Gotouter.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  final Size size;

  const DontHaveAnAccountWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Vous n\'avez pas de compte ? ',
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).go(routerapp.signup);
          },
          child: const Text(
            'Créer un compte',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
