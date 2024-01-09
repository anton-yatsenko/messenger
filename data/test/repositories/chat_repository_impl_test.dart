import 'dart:io';
import 'dart:ui';

import 'package:core/constants/api_constants.dart';
import 'package:data/repositories/chat_repository_impl.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final database = MockFirebaseDatabase.instance;
  final storage = MockFirebaseStorage();
  final mockUser = MockUser(
    isAnonymous: false,
    uid: 'bobid',
    email: 'bob@bob.bob',
    displayName: 'Bob',
  );
  final auth = MockFirebaseAuth(
    signedIn: true,
    mockUser: mockUser,
  );
  final chatRep =
      ChatRepositoryImpl(auth: auth, database: database, storage: storage);

  const imagePath = 'D:/projects/messenger/data/test/assets/cat.png';

  final imageFile = File(imagePath);
  final imageBytes = imageFile.readAsBytesSync();

  group('chat repository tests', () {
    group('create chat tests', () {
      final chatName = 'mychat';
      final usersInChat = ['1', '2', '3'];
      test('create chat creates valid chat', () async {
        await chatRep.createChat(
            chatName: chatName, usersInChat: usersInChat, photo: imageBytes);
        // await database
        //     .ref("${ApiConstants.users}/${mockUser.uid}")
        //     .set({"name": ""});

        final data = await database.ref().get();
        print(data.value);
      });
    });
  });
}
