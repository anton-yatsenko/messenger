import 'package:auto_route/annotations.dart';
import 'package:chat/chat.dart';
import 'package:chat/page/create_chat_page/create_chat_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/create_chat_bloc/create_chat_bloc.dart';

@RoutePage()
class CreateChatPage extends StatelessWidget {
  const CreateChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<CreateChatBloc>(),
      child: const CreateChatView(),
    );
  }
}
