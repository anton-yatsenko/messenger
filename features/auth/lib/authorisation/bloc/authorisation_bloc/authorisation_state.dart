part of 'authorisation_bloc.dart';

@immutable
sealed class AuthorisationState {}

class AuthorisationWaiting extends AuthorisationState {}

class AuthorisationSuccess extends AuthorisationState {}

class AuthorisationInProgress extends AuthorisationState {}

sealed class AuthorisationError extends AuthorisationState {
  final String errorMsg = '';
}

class AuthorisationUserDisabled extends AuthorisationError {
  @override
  String get errorMsg => "auth.auth_page.error_messages.blocked_user_msg".tr();
}

class AuthorisationInvalidCredential extends AuthorisationError {
  @override
  String get errorMsg =>
      "auth.auth_page.error_messages.invalid_email_and_password_comb_msg".tr();
}

class AuthorisationUnexpectedEvent extends AuthorisationError {
  @override
  String get errorMsg =>
      "auth.auth_page.error_messages.unexpected_email_msg".tr();
}

class AuthorisationEmailNotVerified extends AuthorisationError {
  @override
  String get errorMsg =>
      "auth.auth_page.error_messages.email_not_verified_msg".tr();
}
