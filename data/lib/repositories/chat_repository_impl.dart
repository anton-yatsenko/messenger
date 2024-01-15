import 'dart:typed_data';

import 'package:core/constants/api_constants.dart';
import 'package:data/entities/chat_entity.dart';
import 'package:data/mapper/chat_mapper.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;
  final FirebaseStorage _storage;

  ChatRepositoryImpl(
      {required FirebaseAuth auth,
      required FirebaseDatabase database,
      required FirebaseStorage storage})
      : _auth = auth,
        _database = database,
        _storage = storage;

  @override
  Stream<DatabaseEvent> getChatSnippets() {
    // TODO: implement getChatSnippets
    throw UnimplementedError();
  }

  @override
  Future<void> createChat({
    required String chatName,
    required List<String> usersInChat,
    Uint8List? photo,
  }) async {
    // TODO: implement getChatSnippets
    throw UnimplementedError();
    // final userId = _auth.currentUser?.uid;
    // late final String? photoPath;
    // if (userId != null) {
    //   if (photo != null) {
    //     final userProfilePictureRef = _storage
    //         .ref()
    //         .child(ApiConstants.users)
    //         .child(userId)
    //         .child(ApiConstants.profilePicture);
    //     try {
    //       userProfilePictureRef.putData(photo);
    //     } on Exception {
    //       throw UnexpectedEventException();
    //     }
    //     photoPath = userProfilePictureRef.fullPath;
    //   } else {
    //     photoPath = null;
    //   }
    //   usersInChat.add(userId);
    //   final chat = ChatEntity(
    //     name: chatName,
    //     members: usersInChat,
    //     photoPathInCloud: photoPath,
    //   );
    //   final chatsRef = _database.ref().child(ApiConstants.chats);
    //   final userChatsRef = _database
    //       .ref()
    //       .child(ApiConstants.users)
    //       .child(userId)
    //       .child(ApiConstants.chatIds);
    //   final newChatRef = chatsRef.push();
    //   await newChatRef.update(ChatMapper.toJson(chat));
    //   final newChatId = newChatRef.key;
    //   if (newChatId != null) {
    //     await userChatsRef.update({newChatId: true});
    //   }
    // }
  }
}
