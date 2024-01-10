import 'package:flutter/material.dart';

import '../user_model.dart';

@immutable
class ChatModel {
  final String name;
  final Image? photo;
  final List<String>? lastMessage;
  final List<UserModel>? members;

  const ChatModel({
    required this.name,
    this.photo,
    this.lastMessage,
    this.members,
  });
}
