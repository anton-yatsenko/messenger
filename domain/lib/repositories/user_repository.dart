import 'package:domain/models/user_model.dart';

abstract interface class UserRepository {
  Future<void> signOut();

  Future<void> deleteUser();

  Future<List<UserModel>> getAllUsers();

  Future<List<UserModel>> getContacts();

  Future<UserModel> getCurrentUserInfo();
}
