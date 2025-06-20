import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/Gotouter.dart';
import 'package:happy_tech_mastering_api_with_flutter/representation/cubit/post_cubit.dart';

import 'cache/cachehelper.dart';
import 'core/api/dio_consumer.dart';
import 'representation/cubit/user_cubit.dart';
import 'representation/cubit/user_signupcubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => PostCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowMaterialGrid: false,
      routerConfig: routerapp.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
