import 'package:auth/authorisation/widget/reset_password_page/reset_password_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingSize = 30;
    const double containerCornerRadius = 20;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(containerCornerRadius),
                topRight: Radius.circular(containerCornerRadius),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Column(
                children: [
                  ResetPasswordForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
