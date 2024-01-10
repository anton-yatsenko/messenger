import 'package:auth/authorisation/bloc/authorisation_bloc/authorisation_bloc.dart';
import 'package:auth/authorisation/page/auth_page/authorisation_view.dart';
import 'package:auto_route/annotations.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthorisationPage extends StatelessWidget {
  const AuthorisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<AuthorisationBloc>(),
      child: const AuthorisationView(),
    );
  }
}
