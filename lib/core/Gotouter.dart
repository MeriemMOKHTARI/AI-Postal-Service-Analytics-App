import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/formscreen.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/homeview.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/sign_in_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/sign_up_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/splashScreen.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/widgets/qr_code.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/screens/widgets/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class routerapp {
  static const LoginPath = '/login';
  static const HomePath = '/home';
  static const CardViewpath = '/Cardview';
  static const KTrackingview = '/trackingview';
  static const KSettings = '/settingsview';
  static const Knotif = '/notif';
  static const signup = '/signup';
  static const scan = '/scan';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Splashscreen();
        },
      ),
      GoRoute(
        path: HomePath,
        builder: (context, state) {
          return const Home_view();
        },
      ),
      GoRoute(
        path: LoginPath,
        builder: (context, state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: signup,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: CardViewpath,
        builder: (context, state) {
          return const ModernProFormScreen();
        },
      ),
    ],
  );
}
