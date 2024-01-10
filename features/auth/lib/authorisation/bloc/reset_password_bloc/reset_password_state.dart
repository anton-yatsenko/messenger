part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {
  const ResetPasswordState();
}

final class ResetPasswordWaiting extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {}

final class ResetPasswordInProgress extends ResetPasswordState {}

final class ResetPasswordInvalidEmail extends ResetPasswordState {}

final class ResetPasswordUserNotFound extends ResetPasswordState {}

final class ResetPasswordUnexpectedEvent extends ResetPasswordState {}
