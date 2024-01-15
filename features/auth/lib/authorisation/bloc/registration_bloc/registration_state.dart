part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationWaiting extends RegistrationState {}

final class RegistrationInProgress extends RegistrationState {}

final class RegistrationSuccess extends RegistrationState {}

sealed class RegistrationError extends RegistrationState {
  final errorMsg = '';
}

final class RegistrationWeakPassword extends RegistrationError {
  @override
  String get errorMsg => "auth.reg_page.error_messages.weak_password_msg".tr();
}

final class RegistrationEmailAlreadyInUse extends RegistrationError {
  @override
  String get errorMsg =>
      "auth.reg_page.error_messages.email_already_in_use".tr();
}

final class RegistrationInvalidEmail extends RegistrationError {
  @override
  String get errorMsg =>
      "auth.reg_page.error_messages.invalid_email_error_msg".tr();
}

final class RegistrationUnexpectedEvent extends RegistrationError {
  @override
  String get errorMsg =>
      "auth.reg_page.error_messages.unexpected_event_msg".tr();
}
