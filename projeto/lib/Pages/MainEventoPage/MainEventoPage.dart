import 'package:flutter/material.dart';
import 'package:projeto/utils/BottomNavBar.dart';
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
          style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
        ),
        leading: Icon(
          Icons.add,
          size: 55.0,
          color: ColorsPaleta().mainColor,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.more_horiz,
                size: 55.0,
                color: ColorsPaleta().mainColor,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(children: [
            const Text(
              "Eventos",
              style: TextStyle(fontSize: 25.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Não há nenhum evento no seu time",
                style: TextStyle(
                    fontSize: 20.0, color: ColorsPaleta().lineGreyColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Icon(
                Icons.calendar_month_outlined,
                size: 70.0,
                color: ColorsPaleta().mainColor,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
