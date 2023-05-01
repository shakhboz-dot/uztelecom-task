import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uztelecom/app/auth/repositories/auth_repository.dart';
import 'package:uztelecom/app/auth/view_model/bloc/auth_bloc.dart';
import 'package:uztelecom/app/splash/splash_view.dart';

import 'core/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(BlocProvider(
    create: (context) => AuthBloc(locator.get<AuthRepository>()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashView(),
    );
  }
}
