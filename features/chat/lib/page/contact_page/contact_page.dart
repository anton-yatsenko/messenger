import 'package:auto_route/annotations.dart';
import 'package:chat/bloc/contact_bloc/contact_bloc.dart';
import 'package:chat/page/contact_page/contact_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/all_chats_bloc/all_chats_bloc.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<ContactBloc>(),
      child: const ContactView(),
    );
  }
}
