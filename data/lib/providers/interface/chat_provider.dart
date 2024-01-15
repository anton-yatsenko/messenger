import 'dart:typed_data';

abstract interface class ChatProvider {
  void createChat({
    required String chatName,
    required List<String> usersInChat,
    Uint8List? photo,
  });
}
