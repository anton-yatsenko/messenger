import 'package:data/entities/message_entity.dart';

class ChatEntity {
  final String name;
  final List<String> members;
  final String? photoPathInCloud;
  final List<MessageEntity>? messages;

  ChatEntity(
      {required this.name,
      required this.members,
      this.photoPathInCloud,
      this.messages});
}
