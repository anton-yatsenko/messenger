import '../entities/chat_entity.dart';
import '../entities/message_entity.dart';
import 'message_mapper.dart';

class ChatMapper {
  static Map<String, dynamic> toJson(ChatEntity chatEntity) {
    List<Map<String, dynamic>>? messagesJson;
    if (chatEntity.messages != null) {
      messagesJson = chatEntity.messages!
          .map((message) => MessageMapper.toJson(message))
          .toList();
    }

    return {
      'name': chatEntity.name,
      'members': chatEntity.members,
      'photoPathInCloud': chatEntity.photoPathInCloud,
      'messages': messagesJson,
    };
  }

  static ChatEntity fromJson(Map<String, dynamic> json) {
    List<MessageEntity>? messagesList;
    if (json['messages'] != null) {
      messagesList = List<MessageEntity>.from(json['messages']
          .map((messageJson) => MessageMapper.fromJson(messageJson)));
    }

    return ChatEntity(
      name: json['name'],
      members: List<String>.from(json['members']),
      photoPathInCloud: json['photoPathInCloud'],
      messages: messagesList,
    );
  }
}
