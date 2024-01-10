import 'package:auth/authorisation/page/auth_page/authorisation_form.dart';
import 'package:auth/authorisation/page/auth_page/lower_part.dart';
import 'package:flutter/material.dart';

class AuthorisationView extends StatelessWidget {
  const AuthorisationView({super.key});

  @override
  Widget build(BuildContext context) {
    const double topPadding = 30;
    const double containerCornerRadius = 20;
    return Scaffold(
      body: LayoutBuilder(builder: (context, viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Expanded(child: SizedBox()),
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
                      padding: EdgeInsets.fromLTRB(
                          topPadding, topPadding, topPadding, 10),
                      child: IntrinsicWidth(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AuthorisationForm(),
                            LowerPart(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
