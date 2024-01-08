import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthorisationRepository {
  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithGoogle();

  Future<void> signOut();

  Future<void> updateUserPhoto({
    required String photoURL,
  });

  Future<void> resetPassword({required String email});
}
