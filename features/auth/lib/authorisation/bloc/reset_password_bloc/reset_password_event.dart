part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {
  const ResetPasswordEvent();
}

final class ResetPasswordAttempt extends ResetPasswordEvent {
  final String email;

  const ResetPasswordAttempt({required this.email});
}

final class ResetPasswordWait extends ResetPasswordEvent {}
