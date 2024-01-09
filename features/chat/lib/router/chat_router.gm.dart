// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:chat/widget/all_chats_page/all_chats_page.dart' as _i1;
import 'package:chat/widget/chat_page/chat_page.dart' as _i2;
import 'package:chat/widget/create_chat_page/create_chat_page.dart' as _i3;

abstract class $ChatRouter extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AllChatsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AllChatsPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChatPage(),
      );
    },
    CreateChatRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CreateChatPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AllChatsPage]
class AllChatsRoute extends _i4.PageRouteInfo<void> {
  const AllChatsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AllChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllChatsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatPage]
class ChatRoute extends _i4.PageRouteInfo<void> {
  const ChatRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreateChatPage]
class CreateChatRoute extends _i4.PageRouteInfo<void> {
  const CreateChatRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CreateChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateChatRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
