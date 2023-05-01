import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uztelecom/app/home/components/graphql_widget_screen.dart';
import 'package:uztelecom/core/cache_manager.dart';
import 'package:uztelecom/core/locator.dart';

import '../auth/view/auth_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () async {
      locator.get<CacheManager>().loadAccessToken.then((token) {
        if (token != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const GraphqlWidgetScreen()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AuthView()),
              (route) => false);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/uztelecom.png'),
      ),
    );
  }
}
