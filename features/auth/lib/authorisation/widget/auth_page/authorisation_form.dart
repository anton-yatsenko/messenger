import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/authorisation_bloc/authorisation_bloc.dart';

class AuthorisationForm extends StatefulWidget {
  const AuthorisationForm({super.key});

  @override
  State<AuthorisationForm> createState() => _AuthorisationFormState();
}

class _AuthorisationFormState extends State<AuthorisationForm> {
  final _authorisationFormKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthorisationBloc>(context);
    const double spaceSize = 15;
    return Column(
      children: [
        Form(
          key: _authorisationFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'auth.auth_page.email_field.hint_text'.tr(),
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
                validator: (value) {
                  if (value == null) {
                    return 'auth.auth_page.email_field.empty_value_error_msg'
                        .tr();
                  } else if (!value.isValidEmail()) {
                    return "auth.auth_page.email_field.invalid_email_msg".tr();
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(
                height: spaceSize,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'auth.auth_page.password_field.hint_text'.tr(),
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "auth.auth_page.password_field.empty_value_error_msg"
                        .tr();
                  } else if (value.length < 6) {
                    return "auth.auth_page.password_field.invalid_password_msg"
                        .tr();
                  } else {
                    return null;
                  }
                },
              ),
              GestureDetector(
                child: Text(
                  "auth.auth_page.forgot_password_clickable_text".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.blue),
                ),
                onTap: () =>
                    authBloc.add(AuthorisationRouteToForgotPasswordPage()),
              ),
              const SizedBox(
                height: spaceSize,
              ),
              BlocBuilder<AuthorisationBloc, AuthorisationState>(
                builder: (context, state) {
                  if (state is AuthorisationInProgress) {
                    return const FilledButton(
                      onPressed: null,
                      child: LinearProgressIndicator(),
                    );
                  } else {
                    return FilledButton(
                      onPressed: () {
                        authBloc.add(AuthorisationWait());
                        if (_authorisationFormKey.currentState?.validate() ??
                            false) {
                          authBloc.add(AuthorisationAttempt(
                              email: _email, password: _password));
                        }
                      },
                      child: Text("auth.auth_page.sign_in_button_text".tr()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: spaceSize,
        ),
        BlocBuilder<AuthorisationBloc, AuthorisationState>(
            builder: (context, state) {
          final textStyle = Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red);
          late final Widget child;
          if (state is AuthorisationInvalidCredential) {
            child = Text(
              "auth.auth_page.error_messages.invalid_email_and_password_comb_msg"
                  .tr(),
              style: textStyle,
            );
          } else if (state is AuthorisationUserDisabled) {
            child = Text(
              "auth.auth_page.error_messages.blocked_user_msg".tr(),
              style: textStyle,
            );
          } else if (state is AuthorisationUnexpectedEvent) {
            child = Text(
              "auth.auth_page.error_messages.unexpected_email_msg".tr(),
              style: textStyle,
            );
          } else if (state is AuthorisationEmailNotVerified) {
            child = Text(
              "auth.auth_page.error_messages.email_not_verified_msg".tr(),
              style: textStyle,
            );
          } else {
            child = const SizedBox();
          }
          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: SizedBox(
              child: Wrap(
                children: [child],
              ),
            ),
          );
        }),
        const SizedBox(
          height: spaceSize,
        ),
      ],
    );
  }
}
