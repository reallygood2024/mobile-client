import 'package:flutter/widgets.dart';
import 'package:mobile_client/State/Main/chat_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});
  final String title;
  @override
  State<ChatPage> createState() =>ChatState();
}