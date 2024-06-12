import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class CreateEnquete extends StatefulWidget {
  const CreateEnquete({super.key});

  @override
  State<CreateEnquete> createState() => _CreateEnqueteState();
}

class _CreateEnqueteState extends State<CreateEnquete> {
  bool hiddenPassword = false;

  Icon eyeOpenPassword = Icon(
    Icons.visibility,
    color: ColorsPaleta().red,
  );
  Icon eyeClosePassword = Icon(
    Icons.visibility_off,
    color: ColorsPaleta().red,
  );

  String _dropValue = "Futebol";

  final bool _CheckboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: 360,
            height: 400,
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
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
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Nome",
                          hintStyle: const TextStyle(fontSize: 19),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Sobre a notícia",
                          hintStyle: const TextStyle(fontSize: 19),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().red))),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.file_present_sharp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                  border: Border.all(
                                      color: Colors.black, width: 1))),
                        ],
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
        ]),
      ),
    );
  }
}
