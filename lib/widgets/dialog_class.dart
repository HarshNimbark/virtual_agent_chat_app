import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_agent_chat/provider/integrate_provider.dart';

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
            hintText: Provider.of<ConversationProvider>(context, listen: false)
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

void showRenameDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String newName = 'YOUR_API_KEY';
      return AlertDialog(
        title: const Text('API Setting'),
        content: TextField(
          // display the current name of the conversation
          decoration: InputDecoration(
            hintText: Provider.of<ConversationProvider>(context).yourApiKey,
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
              'Save',
              style: TextStyle(
                color: Color(0xff55bb8e),
              ),
            ),
            onPressed: () {
              if (newName == '') {
                Navigator.pop(context);
                return;
              }
              Provider.of<ConversationProvider>(context, listen: false)
                  .yourApiKey = newName;
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
