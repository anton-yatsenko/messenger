import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseReferences {
  final FirebaseDatabase _database;

  DatabaseReferences({
    required FirebaseDatabase database,
  }) : _database = database;

  DatabaseReference getCurrentUserRef({
    required String userId,
  }) {
    return getUsersRef().child(userId);
  }

  DatabaseReference getUsersRef() {
    return _database.ref().child(ApiConstants.users);
  }

  DatabaseReference getCurrentUserContactRef({required String userId}) {
    return getCurrentUserRef(
      userId: userId,
    ).child(
      ApiConstants.contacts,
    );
  }
}
