import 'package:auth/router/auth_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auth/auth.dart';
import 'package:chat/router/chat_router.dart';
import 'package:chat/router/chat_router.gm.dart';
import 'package:core_ui/src/widgets/router/core_ui_router.dart';
import 'package:core_ui/src/widgets/router/core_ui_router.gm.dart';
import 'package:navigation/app_router/auth_guard.dart';

import 'route_builder.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: [AuthRouter, ChatRouter, CoreUiRouter])
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //auth routes
        AutoRoute(
          page: AuthorisationRoute.page,
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
        ),
        //chat routes

        AutoRoute(
          page: CommonRoute.page,
          initial: true,
          children: [
            AutoRoute(page: CreateChatRoute.page),
            AutoRoute(page: ChatRoute.page),
            AutoRoute(
              page: AllChatsRoute.page,
            ),
            AutoRoute(page: ContactRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
          guards: [AuthGuard()],
        )
      ];
}
