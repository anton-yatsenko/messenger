import 'package:core/constants/api_constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageReferences {
  final FirebaseStorage _storage;

  StorageReferences({
    required FirebaseStorage storage,
  }) : _storage = storage;

  Reference getUsersRef() {
    return _storage.ref().child(ApiConstants.users);
  }

  Reference getUserProfilePicRef({required String userId}) {
    return getUsersRef().child(userId).child(ApiConstants.profilePicture);
  }
}
