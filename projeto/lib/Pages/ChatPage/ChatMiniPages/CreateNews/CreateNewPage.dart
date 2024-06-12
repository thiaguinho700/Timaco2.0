import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class CreateNews extends StatefulWidget {
  const CreateNews({super.key});

  @override
  State<CreateNews> createState() => _CreateNewsState();
}

class _CreateNewsState extends State<CreateNews> {
  String _dropValue = "Futebol";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Container(
            width: 360,
            height: 460,
            decoration: BoxDecoration(
                color: ColorsPaleta().BackGroundGray,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 0.1,
                      blurRadius: 0.1,
                      offset: const Offset(0, 2))
                ],
                borderRadius: BorderRadiusDirectional.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: DropdownButton<String>(
                        underline: Container(
                            width: 3,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: ColorsPaleta().red)))),
                        style:
                            const TextStyle(fontSize: 19, color: Colors.black),
                        value: _dropValue,
                        onChanged: (String? selectedValue) {
                          setState(() {
                            _dropValue = selectedValue!;
                          });
                        },
                        isExpanded: true,
                        iconEnabledColor: ColorsPaleta().orange,
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Futebol",
                            child: Text("Futebol"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Basquete",
                            child: Text("Basquete"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Vôlei",
                            child: Text("Vôlei"),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Pergunta",
                          hintStyle: const TextStyle(fontSize: 19),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Nota",
                          hintStyle: const TextStyle(fontSize: 19),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Pergunta 1",
                          hintStyle: const TextStyle(fontSize: 19),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Pergunta 2",
                          hintStyle: const TextStyle(fontSize: 19),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().red))),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        "Adicionar uma pergunta",
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(15)),
                  elevation: 6,
                  shadowColor: Colors.black,
                  fixedSize: const Size(338, 45),
                  backgroundColor: ColorsPaleta().orange),
              child: const Text("Postar",
                  style: TextStyle(color: Colors.white, fontSize: 19.0)),
            ),
          ),
        ],
      ),
    ));
  }
}
