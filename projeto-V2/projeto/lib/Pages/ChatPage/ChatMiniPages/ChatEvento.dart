import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatEvento extends StatefulWidget {
  const ChatEvento({super.key});

  @override
  State<ChatEvento> createState() => _ChatEventoState();
}

class _ChatEventoState extends State<ChatEvento> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(
          height: 40.0,
        ),
        SvgPicture.asset("lib/Image/chat_box.svg"),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Você não têm nenhuma mensagem :(",
          style: TextStyle(fontSize: 20.0),
        )
      ]),
    );
  }
}
