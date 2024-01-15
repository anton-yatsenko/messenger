import 'package:domain/models/user/user_model.dart';

abstract interface class UserRepository {
  Future<void> signOut();

  Future<void> deleteUser();

  Future<List<UserModel>> getAllUsers();

  Future<List<UserModel>> getContacts();

  Future<UserModel> getCurrentUserInfo();

  ///[allContactIds] must include all contactIds for current user
  Future<List<UserModel>> addContacts({required List<String> allContactIds});
}
