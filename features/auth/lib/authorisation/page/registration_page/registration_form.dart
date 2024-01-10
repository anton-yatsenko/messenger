import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/registration_bloc/registration_bloc.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _registrationFormKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final regBloc = BlocProvider.of<RegistrationBloc>(context);
    const double spaceSize = 15;
    return Column(
      children: [
        Form(
          key: _registrationFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'auth.reg_page.email_field.hint_text'.tr(),
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
                validator: (value) {
                  if (value == null) {
                    return "auth.reg_page.email_field.empty_value_error_msg"
                        .tr();
                  } else if (!value.isValidEmail()) {
                    return "auth.reg_page.email_field.invalid_email_msg".tr();
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
                  hintText: 'auth.reg_page.password_field.hint_text'.tr(),
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
                    return "auth.reg_page.password_field.empty_value_error_msg"
                        .tr();
                  } else if (value.length < 6) {
                    return "auth.reg_page.password_field.invalid_password_msg"
                        .tr();
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: spaceSize,
              ),
              BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  final textStyle = Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.red);
                  late final Widget child;
                  if (state is RegistrationWeakPassword) {
                    child = Text(
                      "auth.reg_page.error_messages.weak_password_msg".tr(),
                      style: textStyle,
                    );
                  } else if (state is RegistrationEmailAlreadyInUse) {
                    child = Text(
                      "auth.reg_page.error_messages.email_already_in_use".tr(),
                      style: textStyle,
                    );
                  } else if (state is RegistrationInvalidEmail) {
                    child = Text(
                      "auth.reg_page.error_messages.invalid_email_error_msg"
                          .tr(),
                      style: textStyle,
                    );
                  } else if (state is RegistrationUnexpectedEvent) {
                    child = Text(
                      "auth.reg_page.error_messages.unexpected_event_msg".tr(),
                      style: textStyle,
                    );
                  } else {
                    child = SizedBox();
                  }
                  return SizedBox(
                    child: child,
                  );
                },
              ),
              SizedBox(
                height: spaceSize,
              ),
              BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                if (state is RegistrationInProgress) {
                  return FilledButton(
                    onPressed: null,
                    child: LinearProgressIndicator(),
                  );
                } else {
                  return FilledButton(
                    onPressed: () {
                      if (_registrationFormKey.currentState?.validate() ??
                          false) {
                        regBloc.add(RegistrationWithEmailAndPasswordAttempt(
                            email: _email, password: _password));
                      }
                    },
                    child: Text("auth.reg_page.sign_up_button_text".tr()),
                  );
                }
              }),
            ],
          ),
        )
      ],
    );
  }
}
