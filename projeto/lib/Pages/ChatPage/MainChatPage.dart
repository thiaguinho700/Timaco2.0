import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class MainChatPage extends StatefulWidget {
  const MainChatPage({super.key});

  @override
  State<MainChatPage> createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: ColorsPaleta().yellow,
          size: 35,
        ),
      )),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    SvgPicture.asset("lib/Image/iconMessage.svg"),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Nenhuma mensagem ainda...",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsPaleta().mainTextColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  border: Border.all(width: 1, color: ColorsPaleta().orange)),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    enabledBorder: InputBorder.none,
                    hintText: "Digite uma mensagem..",
                    hintStyle: const TextStyle(fontSize: 18.0),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: ColorsPaleta().orange,
                              borderRadius:
                                  BorderRadiusDirectional.circular(50)),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
