part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

final class RegistrationWithEmailAndPasswordAttempt extends RegistrationEvent {
  final String email;
  final String password;

  RegistrationWithEmailAndPasswordAttempt(
      {required this.email, required this.password});
}

final class RegistrationWithGoogleAttempt extends RegistrationEvent {}
