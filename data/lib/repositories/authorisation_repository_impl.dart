import "package:domain/domain.dart";

import 'package:firebase_auth/firebase_auth.dart';

import "package:domain/error/authorisation_error/email_already_in_use_exception.dart";
import "package:domain/error/authorisation_error/invalid_email_exception.dart";
import "package:domain/error/authorisation_error/weak_password_exception.dart";

import "package:domain/error/authorisation_error/user_disabled_exception.dart";
import "package:domain/repositories/authorisation_repository.dart";
import "package:domain/error/authorisation_error/unexpected_event_error.dart";
import "package:firebase_database/firebase_database.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthorisationRepositoryImpl implements AuthorisationRepository {
  final FirebaseAuth _auth;
  final FirebaseDatabase _database;

  AuthorisationRepositoryImpl(
      {required FirebaseAuth auth, required FirebaseDatabase database})
      : _auth = auth,
        _database = database;

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      await user?.sendEmailVerification();
      final userId = credential.user?.uid;
      if (userId != null) {
        await _writeUserInDB(userId);
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw UnexpectedEventException();
      }
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final userId = userCredential.user?.uid;
      if (userId != null) {
        await _writeUserInDB(userId);
      }
    } on Exception {
      throw UnexpectedEventException();
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential.user?.emailVerified == false ||
          credential.user?.emailVerified == null) {
        await signOut();
        throw EmailNotVerifiedException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'user-disabled') {
        throw UserDisabledException();
      } else if (e.code == 'invalid-credential') {
        throw InvalidCredentialException();
      } else {
        throw UnexpectedEventException();
      }
    }
  }

  @override
  Future<void> updateUserPhoto({required String photoURL}) async {
    final user = _auth.currentUser;
    if (user != null) {
      user.updatePhotoURL(photoURL);
    }
  }

  Future<UserCredential?> _reauthenticate(AuthCredential credential) async {
    final user = _auth.currentUser;
    return await user?.reauthenticateWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else {
        throw UnexpectedEventException();
      }
    }
  }

  Future<void> _writeUserInDB(String userId) async {
    await _database.ref("users/$userId").set({"name": ""});
  }
}
