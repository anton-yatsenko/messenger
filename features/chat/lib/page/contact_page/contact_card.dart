import 'package:chat/widget/profile_pic_or_placeholder.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final UserModel _contact;

  const ContactCard({
    super.key,
    required contact,
  }) : _contact = contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ProfilePicOrPlaceholder(
            imageBytes: _contact.profilePictureBytes,
            radius: 20,
          ),
          Text("${_contact.name} ${_contact.surname}")
        ],
      ),
    );
  }
}
