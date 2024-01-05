part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationWaiting extends RegistrationState {}

final class RegistrationInProgress extends RegistrationState {}

final class RegistrationSuccess extends RegistrationState {}

final class RegistrationWeakPassword extends RegistrationState {}

final class RegistrationEmailAlreadyInUse extends RegistrationState {}

final class RegistrationInvalidEmail extends RegistrationState {}

final class RegistrationUnexpectedEvent extends RegistrationState {}
