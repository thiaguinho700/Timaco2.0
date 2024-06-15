import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class QuadroNews extends StatefulWidget {
  const QuadroNews({super.key});

  @override
  State<QuadroNews> createState() => _QuadroNewsState();
}

class _QuadroNewsState extends State<QuadroNews> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        //   const SizedBox(
        //     height: 40.0,
        //   ),
        //   SvgPicture.asset("lib/Image/chat_box.svg"),
        //   const SizedBox(
        //     height: 15.0,
        //   ),
        //   const Text(
        //     "Não há nenhuma notícia.",
        //     style: TextStyle(fontSize: 20.0),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(top: 50.0),
        //     child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           elevation: 6,
        //             shadowColor: Colors.black,
        //             shape: const StadiumBorder(),
        //             fixedSize: const Size(330, 45),
        //             backgroundColor: ColorsPaleta().orange),
        //         onPressed: () {},
        //         child: const Text(
        //           "Criar uma notícia",
        //           style: TextStyle(color: Colors.white, fontSize: 20.0),
        //         )),
        //   )
        Padding(
          padding: const EdgeInsets.only(top:40.0),
          child: Container(
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
            width: 350,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(50),
                            border: Border.all(width: 1, color: ColorsPaleta().lineGreyColor)),
                        child: const Center(
                            child: Text(
                          "Nome",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mensagem ° Nome time" , style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),),
                          Text("10:04, 09:01.24", style: TextStyle(),)
                        ],
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: ColorsPaleta().orange,
                        size: 40.0,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mensagem...",
                      style: TextStyle(fontSize: 19.0),
                    ),
                    Container(
                        width: 320,
                        height: 1,
                        decoration: const BoxDecoration(color: Colors.black)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 20.0),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(50),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: const Center(
                            child: Text(
                          "Thiago",
                          style: TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.w500),
                        )),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Thiago",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17.0),
                          ),
                          const SizedBox(
                            width: 150,
                          ),
                          Text(
                            "ADM",
                            style: TextStyle(color: ColorsPaleta().lineGreyColor, fontSize: 19.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),              
              ],            
            ),
          ),
        )
      ],
    ));
  }
}
