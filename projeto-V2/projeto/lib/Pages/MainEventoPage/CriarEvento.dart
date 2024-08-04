import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/CreateNews/CreatePostMain.dart';
import 'package:projeto/Pages/MainEventoPage/TypeEvents/Evento.dart';
import 'package:projeto/Pages/MainEventoPage/TypeEvents/Partida.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class CriarEvento extends StatefulWidget {
  const CriarEvento({super.key});

  @override
  State<CriarEvento> createState() => _CriarEventoState();
}

class _CriarEventoState extends State<CriarEvento> {
  int indexPageMini = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          toolbarHeight: 150.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Nome time",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 96,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear,
                      color: ColorsPaleta().orange,
                      size: 40.0,
                    ),
                  )
                ],
              ),
              Text(
                "Criar novo time",
                style: TextStyle(
                    fontSize: 30.0,
                    color: ColorsPaleta().mainTextColor,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CupertinoSlidingSegmentedControl(
                    children: {
                      0: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Evento",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.w600,
                                color: indexPageMini == 0
                                    ? Colors.white
                                    : Colors.black),
                          )),
                      1: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Partida",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w600,
                              color: indexPageMini == 1
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
          )),
      body: pagesCreateEvent.elementAt(indexPageMini),
    );
  }
}

List<Widget> pagesCreateEvent = <Widget>[const Evento(), const Partida()];
