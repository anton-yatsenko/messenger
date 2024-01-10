part of 'authorisation_bloc.dart';

@immutable
sealed class AuthorisationState {}

class AuthorisationWaiting extends AuthorisationState {}

class AuthorisationSuccess extends AuthorisationState {}

class AuthorisationInProgress extends AuthorisationState {}

class AuthorisationWrongPassword extends AuthorisationState {}

class AuthorisationInvalidEmail extends AuthorisationState {}

class AuthorisationUserDisabled extends AuthorisationState {}

class AuthorisationUserNotFound extends AuthorisationState {}

class AuthorisationInvalidCredential extends AuthorisationState {}

class AuthorisationUnexpectedEvent extends AuthorisationState {}

class AuthorisationEmailNotVerified extends AuthorisationState {}
