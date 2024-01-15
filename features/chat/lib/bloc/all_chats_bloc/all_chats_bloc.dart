import 'dart:async';

import 'package:auth/router/auth_router.gm.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';
import 'package:domain/usecases/export_usecases.dart';

import '../../router/chat_router.gm.dart';

part 'all_chats_event.dart';

part 'all_chats_state.dart';

class AllChatsBloc extends Bloc<AllChatsEvent, AllChatsState> {
  final AppRouter _appRouter;
  final SignOutUseCase _signOutUseCase;

  AllChatsBloc({
    required AppRouter appRouter,
    required SignOutUseCase signOutUseCase,
  })  : _appRouter = appRouter,
        _signOutUseCase = signOutUseCase,
        super(AllChatsInitial()) {
    on<AllChatsRouteToCreateChatPage>(_onAllChatsRouteToCreateChatPage);
    on<AllChatsSignOut>(_onAllChatsSignOut);
  }

  _onAllChatsRouteToCreateChatPage(event, emit) {
    if (event is AllChatsRouteToCreateChatPage) {
      _appRouter.push(const CreateChatRoute());
    }
  }

  _onAllChatsSignOut(event, emit) async {
    if (event is AllChatsSignOut) {
      _signOutUseCase.execute(null);
      _appRouter.replaceAll([const AuthorisationRoute()]);
    }
  }
}
