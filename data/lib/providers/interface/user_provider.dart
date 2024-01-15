import 'package:data/entities/user_entity.dart';

abstract interface class UserProvider {
  Future<List<UserEntity>> getAllUsers();

  Future<List<UserEntity>> getContacts();

  Future<List<UserEntity>> getUsersById({required List<String> userIds});

  Future<List<UserEntity>> addContacts({required List<String> allContactIds});

  Future<void> signOut();
}
