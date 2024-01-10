import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

import '../../router/chat_router.gm.dart';

part 'all_chats_event.dart';

part 'all_chats_state.dart';

class AllChatsBloc extends Bloc<AllChatsEvent, AllChatsState> {
  final AppRouter _appRouter;

  AllChatsBloc({required AppRouter appRouter})
      : _appRouter = appRouter,
        super(AllChatsInitial()) {
    on<AllChatsRouteToCreateChatPage>(_onAllChatsRouteToCreateChatPage);
  }

  _onAllChatsRouteToCreateChatPage(event, emit) {
    if (event is AllChatsRouteToCreateChatPage) {
      _appRouter.push(const CreateChatRoute());
    }
  }
}
