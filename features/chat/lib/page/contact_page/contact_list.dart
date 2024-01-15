import 'package:chat/bloc/contact_bloc/contact_bloc.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/profile_pic_or_placeholder.dart';
import 'contact_card.dart';

class ContactList extends StatelessWidget {
  final List<UserModel> _contacts;

  const ContactList({
    super.key,
    required List<UserModel> contacts,
  }) : _contacts = contacts;

  @override
  Widget build(BuildContext context) {
    final contactBloc = BlocProvider.of<ContactBloc>(context);
    const paddingSize = 5.0;
    const avatarRadius = 30.0;

    return RefreshIndicator(
      onRefresh: () async {
        contactBloc.add(ContactUpdatePage());
        await contactBloc.stream
            .firstWhere((element) => element != ContactLoading());
        return;
      },
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Contacts',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new contact',
                  onPressed: () {
                    /* ... */
                  },
                ),
              ]),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final myContacts = [
                  ..._contacts,
                  ..._contacts,
                  ..._contacts,
                  ..._contacts,
                  ..._contacts,
                  ..._contacts
                ];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingSize),
                          child: Row(
                            children: [
                              ProfilePicOrPlaceholder(
                                imageBytes:
                                    myContacts[index].profilePictureBytes,
                                radius: avatarRadius,
                              ),
                              Text(
                                  "${myContacts[index].name} ${myContacts[index].surname}")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.black38,
                    ),
                  ],
                );
              },
              childCount: _contacts.length * 6,
            ),
            itemExtent: (paddingSize + avatarRadius) * 2 + 1,
          )
        ],
      ),
    );
  }
}
