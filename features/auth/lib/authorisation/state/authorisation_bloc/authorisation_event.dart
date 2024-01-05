part of 'authorisation_bloc.dart';

@immutable
sealed class AuthorisationEvent {
  const AuthorisationEvent();
}

final class AuthorisationAttempt extends AuthorisationEvent {
  final String email;
  final String password;

  const AuthorisationAttempt({required this.email, required this.password});
}

final class AuthorisationRouteToSignInPage extends AuthorisationEvent {}

final class AuthorisationSignInWithGoogle extends AuthorisationEvent {}

final class AuthorisationWait extends AuthorisationEvent {}

final class AuthorisationRouteToForgotPasswordPage extends AuthorisationEvent {}
