import 'package:flutter/material.dart';
import 'package:projeto/Pages/MainEventoPage/CriarEvento.dart';
import 'package:projeto/Pages/MainEventoPage/ViewEvento.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class MainEventoPage extends StatefulWidget {
  const MainEventoPage({super.key});

  @override
  State<MainEventoPage> createState() => _MainEventoPageState();
}

class _MainEventoPageState extends State<MainEventoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Nome time",
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w400),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CriarEvento()));
            },
            child: Icon(
              Icons.add,
              size: 50.0,
              color: ColorsPaleta().yellow,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.more_horiz,
                  size: 50.0,
                  color: ColorsPaleta().orange,
                ),
              ],
            )
          ],
        ),
        body: Center(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Eventos",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w400),
                    ),
                    containerDataEvento(context, Colors.black),
                    containerDataEvento(context, ColorsPaleta().yellow),
                    containerDataEvento(context, ColorsPaleta().red)
                  ],
                ),
              ))
        ])));

    //       Padding(
    //         padding: const EdgeInsets.only(top: 40.0),
    //         child: Text(
    //           "Não há nenhum evento no seu time",
    //           style: TextStyle(
    //               fontSize: 20.0, color: ColorsPaleta().mainTextColor),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 30.0),
    //         child: Icon(
    //           Icons.calendar_month_outlined,
    //           size: 70.0,
    //           color: ColorsPaleta().orange,
    //         ),
    //       )
    //     ]),
    //   ),
    // ),
    // );
    // }
  }

  Widget containerDataEvento(BuildContext context, Color ColorContainer) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ViewEvento()));
          },
          child: Container(
            width: (MediaQuery.of(context).size.width - 50),
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(width: 2.5, color: ColorContainer),
              borderRadius: BorderRadiusDirectional.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //       spreadRadius: 0.1,
              //       blurRadius: 0.1,
              //       color: ColorsPaleta().lineGreyColor,
              //       offset: const Offset(0, 2)),
              // ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("19",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500)),
                      Text("Ter",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 120,
                  decoration: BoxDecoration(color: ColorContainer),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Pelada",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Nome do time",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Icon(Icons.people_alt_outlined),
                              Text("11/12", style: TextStyle(fontSize: 16))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 4.6),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Na fila",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w600)),
                          Icon(
                            Icons.arrow_downward,
                            weight: 40,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
