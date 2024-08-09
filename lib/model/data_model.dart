// model class for the chat
class Conversation {
  final List<Message> messages;
  String title;

  Conversation({required this.messages, required this.title});
}


class Sender {
  final String name;
  final String avatarAssetPath;
  final String id;

  Sender({required this.name, required this.avatarAssetPath, String? id})
      : id = id ?? name;
}


class Message {
  final String content;
  final DateTime timestamp;
  final String senderId;

  Message({required this.content, required this.senderId, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();
}