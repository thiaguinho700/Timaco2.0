import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class Evento extends StatefulWidget {
  const Evento({super.key});

  @override
  State<Evento> createState() => _EventoState();
}

class _EventoState extends State<Evento> {
  String _dropValue = "Futebol";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 320,
              decoration: BoxDecoration(
                  color: ColorsPaleta().BackGroundGray,
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
                                    bottom:
                                        BorderSide(color: ColorsPaleta().red)))),
                        style: const TextStyle(fontSize: 19, color: Colors.black),
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
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsPaleta().red)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsPaleta().red)),
                        hintText: "Nome do evento",
                        hintStyle: const TextStyle(fontSize: 18.0),
                      ),
                    ),
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
