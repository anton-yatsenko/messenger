import '../entities/message_entity.dart';

class MessageMapper {
  static Map<String, dynamic> toJson(MessageEntity messageEntity) {
    return {
      'userId': messageEntity.userId,
      'message': messageEntity.message,
      'photosPathInCloud': messageEntity.photosPathInCloud,
    };
  }

  static MessageEntity fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      userId: json['userId'],
      message: json['message'],
      photosPathInCloud: json['photosPathInCloud'] != null
          ? List<String>.from(json['photosPathInCloud'])
          : null,
    );
  }
}
