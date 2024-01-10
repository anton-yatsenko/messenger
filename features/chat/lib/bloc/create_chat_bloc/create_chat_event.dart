part of 'create_chat_bloc.dart';

@immutable
abstract class CreateChatEvent {}

class CreateChatAttempt extends CreateChatEvent {
  final String chatName;
  final List<String> members;

  CreateChatAttempt({
    required this.chatName,
    required this.members,
  });
}

class CreateChatPickPhotoFromDevice extends CreateChatEvent {}

class CreateChatTakePhoto extends CreateChatEvent {}
