import 'package:core/constants/api_constants.dart';
import 'package:data/data.dart';
import 'package:data/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth_platform_interface/src/providers/oauth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../interface/authorisation_provider.dart';
import '../database_references.dart';

class AuthorisationProviderImpl implements AuthorisationProvider {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;
  final DatabaseReferences _references;

  AuthorisationProviderImpl({
    required FirebaseAuth auth,
    required FirebaseDatabase database,
    required DatabaseReferences references,
  })  : _auth = auth,
        _database = database,
        _references = references;

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  @override
  Future<UserCredential> signInWithCredential({
    required OAuthCredential credential,
  }) async {
    return await _auth.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> writeUserInDB({required UserEntity userEntity}) async {
    final userJson = UserMapper.toJson(userEntity);
    await _references.getCurrentUserRef(userId: userEntity.id).set(userJson);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
