import 'package:flutter/material.dart';
import 'package:projeto/Pages/ChatPage/MainChatPage.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class ChatTime extends StatefulWidget {
  const ChatTime({super.key});

  @override
  State<ChatTime> createState() => _ChatTimeState();
}

class _ChatTimeState extends State<ChatTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainChatPage()));
          },
          child: Container(
              width: 330,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: ColorsPaleta().orange,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(0, 3))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(26.0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.9, color: Colors.grey),
                        color: Colors.white,
                        shape: BoxShape.circle),
                    child: const Text(
                      "Nome",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.0),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Mande uma mensagem!",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      )
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }
}
