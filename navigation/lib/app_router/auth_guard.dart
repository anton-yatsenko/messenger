import 'package:auth/router/auth_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/src/widgets/router/core_ui_router.gm.dart';
import 'package:core/core.dart';
import 'package:chat/router/chat_router.gm.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) {
    if (FirebaseAuth.instance.currentUser != null) {
      resolver.next(true);
    } else {
      resolver.redirect(const AuthorisationRoute());
    }
  }
}
