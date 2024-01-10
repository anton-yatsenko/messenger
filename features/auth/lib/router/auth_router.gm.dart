// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/authorisation/page/auth_page/authorisation_page.dart'
    as _i1;
import 'package:auth/authorisation/page/password_reset_success_popup_dialog.dart'
    as _i3;
import 'package:auth/authorisation/page/registration_page/registration_page.dart'
    as _i4;
import 'package:auth/authorisation/page/registration_success_popup_dialog.dart'
    as _i5;
import 'package:auth/authorisation/page/reset_password_page/reset_password_page.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i6;

abstract class $AuthRouter extends _i6.AutoRouterModule {
  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthorisationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthorisationPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    PasswordResetSuccessPopupDialog.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PasswordResetSuccessPopupDialog(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegistrationPage(),
      );
    },
    RegistrationSuccessPopupDialog.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegistrationSuccessPopupDialog(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthorisationPage]
class AuthorisationRoute extends _i6.PageRouteInfo<void> {
  const AuthorisationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthorisationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorisationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i6.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PasswordResetSuccessPopupDialog]
class PasswordResetSuccessPopupDialog extends _i6.PageRouteInfo<void> {
  const PasswordResetSuccessPopupDialog({List<_i6.PageRouteInfo>? children})
      : super(
          PasswordResetSuccessPopupDialog.name,
          initialChildren: children,
        );

  static const String name = 'PasswordResetSuccessPopupDialog';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationRoute extends _i6.PageRouteInfo<void> {
  const RegistrationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegistrationSuccessPopupDialog]
class RegistrationSuccessPopupDialog extends _i6.PageRouteInfo<void> {
  const RegistrationSuccessPopupDialog({List<_i6.PageRouteInfo>? children})
      : super(
          RegistrationSuccessPopupDialog.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationSuccessPopupDialog';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
