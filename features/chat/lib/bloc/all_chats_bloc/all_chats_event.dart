part of 'all_chats_bloc.dart';

@immutable
abstract class AllChatsEvent {}

class AllChatsRouteToCreateChatPage extends AllChatsEvent {}

class AllChatsSignOut extends AllChatsEvent {}
