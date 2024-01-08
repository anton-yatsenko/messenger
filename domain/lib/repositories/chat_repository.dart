import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';

abstract interface class ChatRepository {
  Stream<DatabaseEvent> getChatSnippets();

  Future<void> createChat({
    required String chatName,
    required List<String> usersInChat,
    required Uint8List? photo,
  });
}
