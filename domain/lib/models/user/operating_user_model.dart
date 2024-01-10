import '../chat/chat_model.dart';
import 'user_model.dart';

class OperatingUserModel extends UserModel {
  final Stream<ChatModel> chats;
  final Stream<UserModel> contacts;

  const OperatingUserModel({
    required this.chats,
    required this.contacts,
    required super.id,
    required super.name,
    required super.surname,
    required super.email,
    required super.dateOfBirth,
    required super.additionalInfo,
    required super.profilePictureBytes,
  });
}
