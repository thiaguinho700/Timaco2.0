import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class ViewEvento extends StatefulWidget {
  const ViewEvento({super.key});

  @override
  State<ViewEvento> createState() => _ViewEventoState();
}

class _ViewEventoState extends State<ViewEvento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nome time",
          style: TextStyle(fontSize: 24.0, color: ColorsPaleta().mainTextColor),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsPaleta().yellow,
              size: 35,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "Pelada",
                    style: TextStyle(
                        fontSize: 23.0, color: ColorsPaleta().mainTextColor),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0.1,
                              blurRadius: 0.1,
                              offset: const Offset(0, 1))
                        ],
                        color: ColorsPaleta().backGroundGray,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                end: 110.0, start: 20.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50))),
                              child: const Icon(
                                  Icons.mode_edit_outline_outlined,
                                  size: 40.0),
                            ),
                          ),
                           Text(
                            "Na fila",
                            style: TextStyle(
                                color: ColorsPaleta().mainTextViewEventoFila,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0.1,
                              blurRadius: 0.1,
                              offset: const Offset(0, 1))
                        ],
                        color: ColorsPaleta().backGroundGray,
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(30))),
                    width: MediaQuery.of(context).size.width - 50,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 20),
                              child: Text(
                                "Data",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: ColorsPaleta().lineGreyColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Text(
                              "19/01/2024",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Container(
                          width: 0.9,
                          height: 80,
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                        const Text(
                          "17:20",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 30.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 300,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade600,
                                  spreadRadius: 0.1,
                                  blurRadius: 0.1,
                                  offset: const Offset(0, 1))
                            ],
                            color: ColorsPaleta().backGroundGray,
                            borderRadius: const BorderRadiusDirectional.all(
                                Radius.circular(30))),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 10, start: 22.0),
                                  child: Text(
                                    "Informações",
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 14),
                                child: ListView(
                                  children: const <Widget>[
                                    ListTile(
                                      leading: Icon(
                                        Icons.people_alt_outlined,
                                        color: Colors.red,
                                        size: 30.0,
                                      ),
                                      title: Text("Max. 12 jogadores",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.people_alt_outlined,
                                        size: 30.0,
                                      ),
                                      title: Text(
                                        "12 jogadores no momento",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              top: 20.0)),
                                    ),
                                    ListTile(
                                        leading: Icon(
                                          Icons.pin_drop_outlined,
                                          color: Colors.black,
                                          size: 30.0,
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Restaurance U. Jetena",
                                              style: TextStyle(
                                                fontSize: 19.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text("Suchovbenska 32")
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 0.1,
                                blurRadius: 0.1,
                                offset: const Offset(0, 1))
                          ],
                          color: ColorsPaleta().backGroundGray,
                          borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(30))),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.all(10),

                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Convites (12/24)",
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height:
                                          50, // Adjust height to match the Stack height
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Positioned(
                                            left: 30,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Positioned(
                                            left: 60,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "12 aceitos",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height:
                                          50, // Adjust height to match the Stack height
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Positioned(
                                            left: 30,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Positioned(
                                            left: 60,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "10 não decidiram",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: ColorsPaleta().yellow),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height:
                                          50, // Adjust height to match the Stack height
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Positioned(
                                            left: 30,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Positioned(
                                            left: 60,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.8),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "2 na fila",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
