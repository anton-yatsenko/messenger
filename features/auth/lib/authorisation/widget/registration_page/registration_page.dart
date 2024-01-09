import 'package:auth/authorisation/widget/registration_page/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/di/app_di.dart';
import 'package:auto_route/auto_route.dart';

import '../../state/registration_bloc/registration_bloc.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<RegistrationBloc>(),
      child: const RegistrationView(),
    );
  }
}
