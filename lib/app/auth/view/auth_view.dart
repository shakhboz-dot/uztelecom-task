import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uztelecom/app/home/components/graphql_widget_screen.dart';

import '../view_model/bloc/auth_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uztelecom'),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const GraphqlWidgetScreen()),
                (route) => false),
          );
        },
        child: Center(
          child: CupertinoButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.started());
              },
              child: const Text('Login with SSO')),
        ),
      ),
    );
  }
}
