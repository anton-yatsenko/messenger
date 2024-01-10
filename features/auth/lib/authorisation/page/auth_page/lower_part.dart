import 'package:auth/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authorisation_bloc/authorisation_bloc.dart';

class LowerPart extends StatelessWidget {
  const LowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthorisationBloc>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                context.setLocale(Locale("ru", "RU"));
              },
              child: Image.asset(
                'lib/src/assets/russian_flag.gif',
                package: 'core_ui',
                width: 40,
              ),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(Locale("en", "US"));
              },
              child: Image.asset(
                'lib/src/assets/english_flag.gif',
                package: 'core_ui',
                width: 40,
                height: 40,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                authBloc.add(AuthorisationSignInWithGoogle());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("auth.auth_page.sign_in_with_google_button_text".tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'lib/src/assets/google_logo.png',
                    package: 'core_ui',
                    width: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              "${"auth.auth_page.dont_have_an_account_msg".tr()} ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            GestureDetector(
              child: Text(
                "auth.auth_page.sign_up_clickable_text".tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.blue),
              ),
              onTap: () {
                authBloc.add(AuthorisationRouteToSignInPage());
              },
            ),
          ],
        ),
      ],
    );
  }
}
