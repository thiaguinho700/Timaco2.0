import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/Pages/SignInPage/SignInPage.dart';
import 'package:projeto/utils/ColorsPaleta.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hiddenPassword = false;

  Icon eyeOpenPassword = const Icon(
    Icons.visibility,
  );
  Icon eyeClosePassword = const Icon(
    Icons.visibility_off,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          'lib/Image/SoccerImg.svg',
          width: 70.0,
        ),
        const SizedBox(
          width: 15.0,
        ),
        Text(
          "Timaço",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: ColorsPaleta().mainColor,
              fontFamily: "Poppins"),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
        child: Column(
          children: [
            const TextField(
                decoration: InputDecoration(
                    labelText: "E-mail ou Username",
                    labelStyle: TextStyle(fontSize: 20.0))),
            TextFormField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => setState(() {
                            hiddenPassword = !hiddenPassword;
                          }),
                      iconSize: 33.0,
                      icon:
                          hiddenPassword ? eyeClosePassword : eyeOpenPassword),
                  labelText: "Senha",
                  labelStyle: const TextStyle(fontSize: 20.0)),
              obscureText: hiddenPassword,
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                        fontSize: 20.0, color: ColorsPaleta().textMainColor),
                  ),
                )),
            const SizedBox(
              height: 20,
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
                'Login',
                style: TextStyle(
                    color: ColorsPaleta().textMainColorWhite, fontSize: 21),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 4,
                        width: 150,
                        color: ColorsPaleta().lineGreyColor),
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
                        height: 4,
                        width: 150,
                        color: ColorsPaleta().lineGreyColor)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
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
                              style: TextStyle(
                                  fontSize: 19.0, color: Colors.black),
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
                              style: TextStyle(
                                  fontSize: 19.0, color: Colors.black),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    const Text(
                      "Não têm uma conta?",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ));
                          },
                          child: Text(
                            "Crie uma conta",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: ColorsPaleta().textMainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 9.0,
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 40.0,
                          color: ColorsPaleta().textMainColor,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ]));
  }
}
