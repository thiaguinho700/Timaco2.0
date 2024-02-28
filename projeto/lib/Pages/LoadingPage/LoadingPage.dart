import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('lib/Image/SoccerImg.svg'),
          Text(
            "Timaço",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: ColorsPaleta().mainColor,
                fontFamily: "Poppins"),
          ),
          const SizedBox(height: 30),
          Text(
            'Em busca do seu ${'\n'} melhor lance!',
            style: TextStyle(
                color: ColorsPaleta().mainColor,
                fontSize: 35,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
