import 'package:auth/authorisation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:auth/authorisation/page/reset_password_page/reset_password_view.dart';
import 'package:auto_route/annotations.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordBloc>(
      create: (context) => appLocator<ResetPasswordBloc>(),
      child: const ResetPasswordView(),
    );
  }
}
