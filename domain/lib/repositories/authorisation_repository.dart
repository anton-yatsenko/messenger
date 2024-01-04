import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthorisationRepository {
  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithGoogle();

  Future<void> signOut();

  Future<void> deleteUser();

  Future<void> updateUserPhoto({
    required String photoURL,
  });
}
