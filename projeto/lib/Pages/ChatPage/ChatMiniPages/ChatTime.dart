import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ChatTime extends StatefulWidget {
  const ChatTime({super.key});

  @override
  State<ChatTime> createState() => _ChatTimeState();
}

class _ChatTimeState extends State<ChatTime> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ChatTime"),
    );
  }
}