import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Mensagens"),
            ToggleButtons(
                renderBorder: false,
                isSelected: _selections,
                fillColor: ColorsPaleta().BackGroundGray,
                color: Colors.black,
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                  });
                },
                children: const [
                  Text(
                    "Chat do time",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Chat do evento",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Quadro de notícias",
                    textAlign: TextAlign.center,
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
