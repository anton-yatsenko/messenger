import 'package:auth/authorisation/state/registration_bloc/registration_bloc.dart';
import 'package:auth/authorisation/state/reset_password_bloc/reset_password_bloc.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _resetFormKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    final resetBloc = BlocProvider.of<ResetPasswordBloc>(context);
    return Form(
      key: _resetFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'auth.forgot_password_page.email_field.hint_text'.tr(),
              hintStyle: Theme.of(context).textTheme.titleMedium,
              filled: true,
              fillColor: Theme.of(context).colorScheme.tertiary,
            ),
            validator: (value) {
              if (value == null) {
                return 'auth.forgot_password_page.email_field.empty_value_error_msg'
                    .tr();
              } else if (!value.isValidEmail()) {
                return "auth.forgot_password_page.email_field.invalid_email_msg"
                    .tr();
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
            height: 15,
          ),
          BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
            builder: (context, state) {
              late final Widget child;
              final textStyle = Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.red);
              if (state is ResetPasswordInvalidEmail) {
                child = Text(
                  "auth.forgot_password_page.invalid_email_error_msg".tr(),
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
            },
          ),
          BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
            builder: (context, state) {
              if (state is RegistrationInProgress) {
                return FilledButton(
                  onPressed: null,
                  child: LinearProgressIndicator(),
                );
              } else {
                return FilledButton(
                  onPressed: () {
                    resetBloc.add(ResetPasswordWait());
                    if (_resetFormKey.currentState?.validate() ?? false) {
                      resetBloc.add(ResetPasswordAttempt(email: _email));
                    }
                  },
                  child: Text(
                      "auth.forgot_password_page.send_email_button_text".tr()),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
