// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:chat/page/all_chats_page/all_chats_page.dart' as _i1;
import 'package:chat/page/chat_page/chat_page.dart' as _i2;
import 'package:chat/page/contact_page/contact_page.dart' as _i3;
import 'package:chat/page/create_chat_page/create_chat_page.dart' as _i4;
import 'package:chat/page/profile_page/profile_page.dart' as _i5;

abstract class $ChatRouter extends _i6.AutoRouterModule {
  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AllChatsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllChatsPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChatPage(),
      );
    },
    ContactRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ContactPage(),
      );
    },
    CreateChatRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateChatPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AllChatsPage]
class AllChatsRoute extends _i6.PageRouteInfo<void> {
  const AllChatsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AllChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllChatsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatPage]
class ChatRoute extends _i6.PageRouteInfo<void> {
  const ChatRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ContactPage]
class ContactRoute extends _i6.PageRouteInfo<void> {
  const ContactRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreateChatPage]
class CreateChatRoute extends _i6.PageRouteInfo<void> {
  const CreateChatRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CreateChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateChatRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
