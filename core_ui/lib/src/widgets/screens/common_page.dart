import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat/router/chat_router.gm.dart';

@RoutePage()
class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        AllChatsRoute(),
        ContactRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contacts), label: "Contacts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]);
      },
    );
  }
}
