import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class MainTimePage extends StatefulWidget {
  const MainTimePage({super.key});

  @override
  State<MainTimePage> createState() => _MainTimePageState();
}

class _MainTimePageState extends State<MainTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.more_horiz,
            size: 55.0,
            color: ColorsPaleta().mainColor,
          ),
          const SizedBox(
            width: 9.0,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Todos os times",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Você ainda não está em nenhum time. ${'\n'} Crie o seu primerio time.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsPaleta().lineGreyColor, fontSize: 20.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                "⚽",
                style: TextStyle(fontSize: 60.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 85.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(358, 50),
                      backgroundColor: ColorsPaleta().mainColor),
                  onPressed: () {},
                  child: const Text(
                    "Novo time",
                    style: TextStyle(color: Colors.white, fontSize: 19.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
