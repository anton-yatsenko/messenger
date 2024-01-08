import 'dart:typed_data';

import 'package:data/entities/chat_entity.dart';
import 'package:data/mapper/chat_mapper.dart';
import 'package:domain/repositories/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;

  ChatRepositoryImpl(
      {required FirebaseAuth auth, required FirebaseDatabase database})
      : _auth = auth,
        _database = database;

  @override
  Stream<DatabaseEvent> getChatSnippets() {
    // TODO: implement getChatSnippets
    throw UnimplementedError();
  }

  @override
  Future<void> createChat({
    required String chatName,
    required List<String> usersInChat,
    required Uint8List? photo,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      usersInChat.add(userId);
      final chat = ChatEntity(name: chatName, usersInChat: usersInChat);
      //TODO: доделать с фото
      await _database.ref("chats").push().set(ChatMapper.toJson(chat));
    }
  }
}
