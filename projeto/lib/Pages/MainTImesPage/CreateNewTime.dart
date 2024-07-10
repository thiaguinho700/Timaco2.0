import 'dart:io';
import 'package:projeto/utils/ScankBarErrorHandler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:projeto/functionsFlutter/functions_time.dart';

class CreateNewTime extends StatefulWidget {
  const CreateNewTime({super.key});

  @override
  State<CreateNewTime> createState() => _CreateNewTimeState();
}

class _CreateNewTimeState extends State<CreateNewTime> {
  final formKey = GlobalKey<FormState>();

  final _textEditingNomeTime = TextEditingController();

  final _textEditingCidade = TextEditingController();

  String _dropValue = "Futebol";

  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              color: ColorsPaleta().orange,
              size: 30.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                "CRIAR NOVO TIME",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 350,
              height: 490,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                        offset: const Offset(0, 2))
                  ],
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadiusDirectional.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          _selectImage != null
                              ? Stack(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(_selectImage!),
                                          ),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  80.0),
                                          border: Border.all(
                                              width: 2.0,
                                              color: ColorsPaleta().orange)),
                                    ),
                                    Positioned(
                                        bottom: -10,
                                        left: 80,
                                        child: IconButton(
                                            onPressed: selectImageTime,
                                            icon: const Icon(
                                              Icons.photo_camera_rounded,
                                              size: 30,
                                            )))
                                  ],
                                )
                              : Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              80.0),
                                      border: Border.all(
                                          width: 2.0,
                                          color: ColorsPaleta().orange)),
                                  child: Center(
                                      child: IconButton(
                                    onPressed: selectImageTime,
                                    icon: const Icon(
                                      Icons.photo_camera_rounded,
                                      size: 40.0,
                                    ),
                                  )),
                                ),
                        ],
                      ),
                      Column(children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Insira o nome do time!!";
                            }
                            return null;
                          },
                          controller: _textEditingNomeTime,
                          decoration: InputDecoration(
                              labelText: "Nome do time *",
                              hintText: "Insira o nome do time",
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsPaleta().red)),
                              labelStyle: TextStyle(color: ColorsPaleta().red)),
                        ),
                        Center(
                          child: DropdownButton<String>(
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
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Insira o nome da cidade!!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsPaleta().red)),
                              labelText: "Cidade *",
                              labelStyle: TextStyle(color: ColorsPaleta().red)),
                        ),
                      ]),

                      // Row(
                      //   children: [
                      //     Checkbox(
                      //         side:
                      //             BorderSide(color: ColorsPaleta().red, width: 2),
                      //         activeColor: ColorsPaleta().red,
                      //         value: _CheckboxValue,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             _CheckboxValue = !_CheckboxValue;
                      //           });
                      //         }),
                      //     Text(
                      //       "Os participantes estaram \n visíveis.",
                      //       style: TextStyle(
                      //           color: ColorsPaleta().red, fontSize: 18.0),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      fixedSize: const Size(338, 45),
                      backgroundColor: ColorsPaleta().orange),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                   try {
                        createNewTime(
                              _textEditingNomeTime.text.trim(),
                              _dropValue,
                              _textEditingCidade.text.trim(),
                              _selectImage)
                          .then((data) {
                        Navigator.pop(context);
                      });
                   } catch (e) {
                     handleSnackBar(context, e.toString());
                   }
                    }
                  },
                  child: const Text("Criar time",
                      style: TextStyle(color: Colors.white, fontSize: 20.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 190,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(100),
                    color: ColorsPaleta().backGroundGray),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future selectImageTime() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _selectImage = File(returnedImage!.path);
    });
  }
}
