import 'dart:async';
import '../../router/chat_router.gm.dart';
import 'package:navigation/navigation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_page_event.dart';

part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  final AppRouter _appRouter;

  ChatPageBloc({required AppRouter appRouter})
      : _appRouter = appRouter,
        super(ChatPageInitial()) {
    on<ChatPageRouteToCreateChatPage>(_onChatPageRouteToCreateChatPage);
  }

  _onChatPageRouteToCreateChatPage(event, emit) {
    //TODO: implement event handler
    throw UnimplementedError();
  }
}
