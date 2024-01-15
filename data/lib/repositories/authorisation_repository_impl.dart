import "package:core/constants/api_constants.dart";
import "package:data/entities/user_entity.dart";
import "package:domain/domain.dart";

import 'package:firebase_auth/firebase_auth.dart';

import "package:domain/error/authorisation_error/email_already_in_use_exception.dart";
import "package:domain/error/authorisation_error/invalid_email_exception.dart";
import "package:domain/error/authorisation_error/weak_password_exception.dart";

import "package:domain/error/authorisation_error/user_disabled_exception.dart";
import "package:domain/repositories/authorisation_repository.dart";
import "package:domain/error/authorisation_error/unexpected_event_exception.dart";
import "package:firebase_database/firebase_database.dart";
import "package:google_sign_in/google_sign_in.dart";

import "../providers/interface/authorisation_provider.dart";

class AuthorisationRepositoryImpl implements AuthorisationRepository {
  final AuthorisationProvider _authorisationProvider;

  AuthorisationRepositoryImpl({
    required AuthorisationProvider authorisationProvider,
  }) : _authorisationProvider = authorisationProvider;

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _authorisationProvider
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      await user?.sendEmailVerification();
      final userId = userCredential.user?.uid;
      final userEmail = userCredential.user?.email;
      if (userId != null && userEmail != null) {
        final user = UserEntity(id: userId, email: userEmail);
        await _authorisationProvider.writeUserInDB(
          userEntity: user,
        );
      }
      return userCredential;
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
      final userCredential = await _authorisationProvider.signInWithCredential(
          credential: credential);
      final userId = userCredential.user?.uid;
      final email = userCredential.user?.email;
      if (userId != null && email != null) {
        final user = UserEntity(id: userId, email: email);
        await _authorisationProvider.writeUserInDB(
          userEntity: user,
        );
      }
    } on Exception {
      throw UnexpectedEventException();
    }
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _authorisationProvider
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user?.emailVerified == false ||
          credential.user?.emailVerified == null) {
        await _authorisationProvider.signOut();
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
  Future<void> resetPassword({required String email}) async {
    try {
      await _authorisationProvider.sendPasswordResetEmail(email: email);
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
}
