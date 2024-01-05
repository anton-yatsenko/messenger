import 'package:auth/router/auth_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auth/auth.dart';

import 'route_builder.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: [AuthRouter])
class AppRouter extends _$AppRouter {
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthorisationRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        CustomRoute(
          page: RegistrationSuccessPopupDialog.page,
          customRouteBuilder: RouteBuilder.dismissibleDialog,
        ),
        CustomRoute(
          page: PasswordResetSuccessPopupDialog.page,
          customRouteBuilder: RouteBuilder.dismissibleDialog,
        )
      ];
}
