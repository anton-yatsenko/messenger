import 'package:flutter/material.dart';

@immutable
class ChatModel {
  final String name;
  final Image photo;
  final String lastMessage;

  const ChatModel(
      {required this.name, required this.photo, required this.lastMessage});
}
