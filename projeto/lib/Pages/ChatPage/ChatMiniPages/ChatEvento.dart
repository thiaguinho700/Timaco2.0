import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ChatEvento extends StatefulWidget {
  const ChatEvento({super.key});

  @override
  State<ChatEvento> createState() => _ChatEventoState();
}

class _ChatEventoState extends State<ChatEvento> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("ChatEvento"),
    );
  }
}