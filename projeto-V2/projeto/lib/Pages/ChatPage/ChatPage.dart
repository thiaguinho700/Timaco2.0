import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projeto/Pages/ChatPage/ChatMiniPages/ChatEvento.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/ChatTime.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/CreateNews/CreateNewPage.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/CreateNews/CreatePostMain.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/QuadroNews.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int indexPageMini = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: indexPageMini == 0 || indexPageMini == 1
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: indexPageMini == 2
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CreatePostMain()));
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 50.0,
                                  color: ColorsPaleta().yellow,
                                ),
                              )
                            : null,
                      ),
                      Container(
                        child: indexPageMini == 2
                            ? const SizedBox(width: 47.0)
                            : null,
                      ),
                      const Text(
                        "Mensagens",
                        style: TextStyle(fontSize: 32.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CupertinoSlidingSegmentedControl(
                        children: {
                          0: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Chat do \n time",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    color: indexPageMini == 0
                                        ? Colors.white
                                        : Colors.black),
                              )),
                          1: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Chat do \n evento",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                  color: indexPageMini == 1
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          2: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Quadro de\n notícias",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                  color: indexPageMini == 2
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        },
                        backgroundColor: Colors.white,
                        thumbColor: ColorsPaleta().orange,
                        groupValue: indexPageMini,
                        onValueChanged: (int? newValue) {
                          setState(() {
                            indexPageMini = newValue!;
                          });
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Center(
          child: _ChatPageMini.elementAt(indexPageMini),
        ));
  }

  final List<Widget> _ChatPageMini = <Widget>[
    const ChatTime(),
    const ChatEvento(),
    const QuadroNews()
  ];
}
