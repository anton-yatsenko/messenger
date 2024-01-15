import 'package:data/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthorisationProvider {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithCredential({
    required OAuthCredential credential,
  });

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  User? getCurrentUser();

  Future<void> writeUserInDB({
    required UserEntity userEntity,
  });

  Future<void> signOut();

  Future<void> sendPasswordResetEmail({required String email});
}
