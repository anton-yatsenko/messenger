import 'package:auto_route/annotations.dart';
import 'package:chat/chat.dart';
import 'package:chat/widget/all_chats_page/all_chats_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AllChatsPage extends StatelessWidget {
  const AllChatsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appLocator<AllChatsBloc>(),
      child: const AllChatsView(),
    );
  }
}
