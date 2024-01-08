part of 'create_chat_bloc.dart';

@immutable
abstract class CreateChatState {
  final Uint8List? photo;

  const CreateChatState({required this.photo});
}

class ChatPageWaiting extends CreateChatState {
  const ChatPageWaiting({required super.photo});
}

class ChatPageLoading extends CreateChatState {
  const ChatPageLoading({required super.photo});
}

class ChatPageFailure extends CreateChatState {
  const ChatPageFailure({required super.photo});
}

class ChatPageSuccess extends CreateChatState {
  const ChatPageSuccess({required super.photo});
}
