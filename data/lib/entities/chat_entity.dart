import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'chat_entity.g.dart';

@JsonSerializable()
class ChatEntity {
  final String name;
  final List<String> usersInChat;

  ChatEntity({required this.name, required this.usersInChat});

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatEntityToJson(this);
}
