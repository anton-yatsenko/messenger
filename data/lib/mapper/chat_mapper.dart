import '../entities/chat_entity.dart';

class ChatMapper {
  static Map<String, dynamic> toJson(ChatEntity chat) {
    return {
      'name': chat.name,
      'usersInChat': chat.usersInChat,
    };
  }

  static ChatEntity fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      name: json['name'],
      usersInChat: List<String>.from(json['usersInChat']),
    );
  }
}
