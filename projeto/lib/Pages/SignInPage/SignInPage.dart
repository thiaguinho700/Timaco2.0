import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool hiddenPassword = false;
  bool hiddenPasswordAgain = false;

  Icon eyeOpenPassword = const Icon(
    Icons.visibility_off_outlined,
  );
  Icon eyeClosePassword = const Icon(
    Icons.visibility_off,
  );

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: ColorsPaleta().textMainColor, size: 40.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("lib/Image/SoccerImg.svg", width: 75.0),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                "Timaço",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: ColorsPaleta().mainColor,
                    fontFamily: "Poppins"),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                child: Column(
                  children: [
                    const TextField(
                        decoration: InputDecoration(
                            labelText: "Nome",
                            labelStyle: TextStyle(fontSize: 20.0))),
                    const TextField(
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(fontSize: 20.0))),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    hiddenPassword = !hiddenPassword;
                                  }),
                              iconSize: 33.0,
                              icon: hiddenPassword
                                  ? eyeClosePassword
                                  : eyeOpenPassword),
                          labelText: "Senha",
                          labelStyle: const TextStyle(fontSize: 20.0)),
                      obscureText: hiddenPassword,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    hiddenPasswordAgain = !hiddenPasswordAgain;
                                  }),
                              iconSize: 33.0,
                              icon: hiddenPasswordAgain
                                  ? eyeClosePassword
                                  : eyeOpenPassword),
                          labelText: "Confirmar senha",
                          labelStyle: const TextStyle(fontSize: 20.0)),
                      obscureText: hiddenPasswordAgain,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 9.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: checkBox,
                      onChanged: (value) {
                        setState(() {
                          checkBox = !checkBox;
                        });
                      }),
                  const Text(
                    "Eu concordo com a política de ${'\n'} privacidade",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.start,
                  )
                ],
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 145.0, vertical: 10.0),
                backgroundColor: ColorsPaleta().textMainColor),
            child: Text(
              'Criar',
              style: TextStyle(
                  color: ColorsPaleta().textMainColorWhite, fontSize: 21),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 4, width: 150, color: ColorsPaleta().lineGreyColor),
              const SizedBox(
                width: 5,
              ),
              Text(
                "OU",
                style: TextStyle(color: Colors.grey[700], fontSize: 15.0),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                  height: 4, width: 150, color: ColorsPaleta().lineGreyColor)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "lib/Image/googleIcon.svg",
                        width: 35.0,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        "Google",
                        style: TextStyle(fontSize: 19.0, color: Colors.black),
                      )
                    ],
                  )),
              const SizedBox(
                width: 5.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 10)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "lib/Image/facebookIcon.svg",
                        width: 35.0,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        "Facebook",
                        style: TextStyle(fontSize: 19.0, color: Colors.black),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
