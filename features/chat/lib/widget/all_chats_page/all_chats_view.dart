import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatsView extends StatelessWidget {
  const AllChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final allChatsBloc = BlocProvider.of<AllChatsBloc>(context);
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            allChatsBloc.add(AllChatsRouteToCreateChatPage());
          },
          child: const Text("go"),
        ),
      ),
    );
  }
}
