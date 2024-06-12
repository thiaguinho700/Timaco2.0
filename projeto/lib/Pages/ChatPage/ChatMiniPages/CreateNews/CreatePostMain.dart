import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/CreateNews/CreateEnquete.dart';
import 'package:projeto/Pages/ChatPage/ChatMiniPages/CreateNews/CreateNewPage.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class CreatePostMain extends StatefulWidget {
  const CreatePostMain({super.key});

  @override
  State<CreatePostMain> createState() => _CreatePostMainState();
}

class _CreatePostMainState extends State<CreatePostMain> {
  int indexPageMini = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150.0,
          automaticallyImplyLeading: false,
          title: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom:20.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Criar nova notícia",
                      style: TextStyle(
                        color: ColorsPaleta().mainTextColor,
                        fontSize: 28.0,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
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
                    ),
                  ],
                ),
              ),
               CupertinoSlidingSegmentedControl(
                    children: {
                      0: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Post",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: indexPageMini == 0
                                    ? Colors.white
                                    : Colors.black),
                          )),
                      1: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Enquete",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: indexPageMini == 1
                                    ? Colors.white
                                    : Colors.black),
                          )),
                    },
                    backgroundColor: Colors.white,
                    thumbColor: ColorsPaleta().orange,
                    groupValue: indexPageMini,
                    onValueChanged: (int? value) {
                      setState(() {
                        indexPageMini = value!;
                      });
                    }),
              
            ]),
          ),
        ),
        body: PagesCreateNew.elementAt(indexPageMini));
  }
}

final List<Widget> PagesCreateNew = <Widget>[
  const CreateEnquete(),
  const CreateNews()
];
