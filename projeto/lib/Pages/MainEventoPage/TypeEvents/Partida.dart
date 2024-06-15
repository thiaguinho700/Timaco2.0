import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class Partida extends StatefulWidget {
  const Partida({super.key});

  @override
  State<Partida> createState() => _PartidaState();
}

class _PartidaState extends State<Partida> {
  String _dropValue = "Futebol";

  int indexPageMini = 0;

  bool heightContainer = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: heightContainer ? 550 : 370,
              decoration: BoxDecoration(
                  color: ColorsPaleta().backGroundGray,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.3,
                        blurRadius: 0.3,
                        color: ColorsPaleta().lineGreyColor,
                        offset: const Offset(0, 2)),
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(children: [
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
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsPaleta().red)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsPaleta().red)),
                        hintText: "Oponente",
                        hintStyle: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CupertinoSlidingSegmentedControl(
                        children: {
                          0: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Time da casa",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: indexPageMini == 0
                                        ? Colors.white
                                        : Colors.black),
                              )),
                          1: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Londe de casa",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: indexPageMini == 1
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        },
                        backgroundColor: Colors.white,
                        thumbColor: ColorsPaleta().mainTextColor,
                        groupValue: indexPageMini,
                        onValueChanged: (int? newValue) {
                          setState(() {
                            indexPageMini = newValue!;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsPaleta().red)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsPaleta().red)),
                        hintText: "Dia e hora",
                        hintStyle: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              heightContainer = !heightContainer;
                            });
                          },
                          child: const Text(
                            "Opções avançadas",
                            style: TextStyle(fontSize: 19.0),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(heightContainer
                          ? Icons.arrow_upward
                          : Icons.arrow_downward)
                    ],
                  ),
                  Container(
                    child: heightContainer
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsPaleta().red)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsPaleta().red)),
                                    hintText: "Notas",
                                    hintStyle: const TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsPaleta().red)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsPaleta().red)),
                                    hintText: "Lugar",
                                    hintStyle: const TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsPaleta().red)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorsPaleta().red)),
                                    hintText: "Capacidade",
                                    hintStyle: const TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  )
                ]),
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
                child: const Text("Criar",
                    style: TextStyle(color: Colors.white, fontSize: 19.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
