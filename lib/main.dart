import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_agent_chat/provider/integrate_provider.dart';
import 'package:virtual_agent_chat/view/main_chat_page.dart';
import 'package:virtual_agent_chat/widgets/pop_menu.dart';
import 'package:virtual_agent_chat/widgets/side_menu_drawer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConversationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  // create theme
  final ThemeData theme = ThemeData(
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //var _scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      title: 'Virtual Agent Chat App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        //key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            Provider.of<ConversationProvider>(context, listen: true)
                .currentConversationTitle,
            style: const TextStyle(
              fontSize: 20.0, // change font size
              color: Colors.black, // change font color
              fontFamily: 'din-regular', // change font family
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0, // remove box shadow
          toolbarHeight: 50,
          actions: const [
            CustomPopupMenu(),
          ],
        ),
        drawer: const MyDrawer(),
        body: const Center(
          child: ChatPage(),
        ),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {},
                tooltip: 'Create Persona',
                elevation: 12,
                child: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 80,
              )
            ]),
      ),
    );
  }
}
