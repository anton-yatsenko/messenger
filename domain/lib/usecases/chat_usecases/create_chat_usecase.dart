import 'dart:typed_data';

import 'package:domain/usecases/usecase.dart';

import '../../repositories/chat_repository.dart';

class CreateChatUseCase extends FutureUseCase<
    ({
      String chatName,
      List<String> members,
      Uint8List? photo,
    }),
    void> {
  final ChatRepository _chatRepository;

  CreateChatUseCase({required ChatRepository chatRepository})
      : _chatRepository = chatRepository;

  @override
  Future<void> execute(
      ({
        String chatName,
        List<String> members,
        Uint8List? photo,
      }) input) async {
    await _chatRepository.createChat(
      chatName: input.chatName,
      usersInChat: input.members,
      photo: input.photo,
    );
  }
}
