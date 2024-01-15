import 'package:chat/page/contact_page/contact_card.dart';
import 'package:chat/page/contact_page/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc/contact_bloc.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final contactBloc = BlocProvider.of<ContactBloc>(context);
    return Scaffold(
      body: BlocConsumer<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContactWaiting) {
            return ContactList(
              contacts: state.contacts,
            );
          } else {
            return Center(
                child: TextButton(
              child: Text('Error'),
              onPressed: () => contactBloc.add(ContactUpdatePage()),
            ));
          }
        },
        listener: (context, state) {
          if (state is ContactInitial) {
            contactBloc.add(ContactUpdatePage());
          }
        },
      ),
    );
  }
}
