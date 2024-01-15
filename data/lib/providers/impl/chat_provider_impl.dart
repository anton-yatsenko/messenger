import 'dart:typed_data';

import 'package:core/constants/api_constants.dart';
import 'package:data/providers/interface/chat_provider.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../entities/chat_entity.dart';
import '../../mapper/chat_mapper.dart';
import '../database_references.dart';
import '../storage_references.dart';

class ChatProviderImpl implements ChatProvider {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;
  final FirebaseStorage _storage;
  final StorageReferences _storageReferences;

  ChatProviderImpl({
    required FirebaseAuth auth,
    required FirebaseDatabase database,
    required FirebaseStorage storage,
    required StorageReferences storageReferences,
  })  : _auth = auth,
        _database = database,
        _storage = storage,
        _storageReferences = storageReferences;

  @override
  void createChat(
      {required String chatName,
      required List<String> usersInChat,
      Uint8List? photo}) {
// TODO: implement createChat
    throw UnimplementedError();
  }
}
