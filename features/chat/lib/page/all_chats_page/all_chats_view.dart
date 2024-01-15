import 'package:auto_route/auto_route.dart';
import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/all_chats_bloc/all_chats_bloc.dart';

class AllChatsView extends StatelessWidget {
  const AllChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final allChatsBloc = BlocProvider.of<AllChatsBloc>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
          ),
          Center(
            child: FilledButton(
              onPressed: () {
                allChatsBloc.add(AllChatsRouteToCreateChatPage());
              },
              child: const Text("go"),
            ),
          ),
          FilledButton(
            onPressed: () => allChatsBloc.add(AllChatsSignOut()),
            child: Text("Sign out"),
          ),
        ],
      ),
    );
  }
}
