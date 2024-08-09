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
      child: MaterialApp(
          title: 'Virtual Agent Chat App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //var _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
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
              onPressed: () {
                _showDialog(context);
              },
              tooltip: 'Create Persona',
              elevation: 12,
              child: const Icon(Icons.person),
            ),
            const SizedBox(
              height: 80,
            )
          ]),
    );
  }

  void _showDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = '';
        return AlertDialog(
          title: const Text('Rename Persona'),
          content: TextField(
            // display the current name of the conversation
            decoration: InputDecoration(
              hintText:
                  Provider.of<ConversationProvider>(context, listen: false)
                      .currentConversation
                      .title,
            ),
            onChanged: (value) {
              newName = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                'Rename',
                style: TextStyle(
                  color: Color(0xff55bb8e),
                ),
              ),
              onPressed: () {
                // Call renameConversation method here with the new name
                Provider.of<ConversationProvider>(context, listen: false)
                    .renameConversation(newName);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
