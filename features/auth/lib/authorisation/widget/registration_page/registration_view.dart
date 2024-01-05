import 'package:auth/authorisation/widget/registration_page/registration_form.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Padding(
              padding:
                  EdgeInsets.fromLTRB(topPadding, topPadding, topPadding, 10),
              child: IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RegistrationForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
