import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/Pages/SignInPage/SignInPage.dart';
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hiddenPassword = false;

  Icon eyeOpenPassword = Icon(
    Icons.visibility,
    color: ColorsPaleta().red,
  );
  Icon eyeClosePassword = Icon(
    Icons.visibility_off,
    color: ColorsPaleta().red,
  );
  //#####################
  // FORM COMPONENT
  //#####################

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            "lib/Image/SoccerImgSub.svg",
            width: 180.0,
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
            child: Column(
              children: [
                TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorsPaleta().orange)),
                        fillColor: ColorsPaleta().orange,
                        labelText: "E-mail ou Username",
                        labelStyle: TextStyle(
                            fontSize: 20.0, color: ColorsPaleta().red))),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsPaleta().orange)),
                    suffixIcon: IconButton(
                        onPressed: () => setState(() {
                              hiddenPassword = !hiddenPassword;
                            }),
                        iconSize: 33.0,
                        icon: hiddenPassword
                            ? eyeClosePassword
                            : eyeOpenPassword),
                    labelText: "Senha",
                    labelStyle:
                        TextStyle(fontSize: 20.0, color: ColorsPaleta().red),
                  ),
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
                            fontSize: 20.0, color: ColorsPaleta().red),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavBar()));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 145.0, vertical: 10.0),
                      backgroundColor: ColorsPaleta().orange),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: ColorsPaleta().textMainColorWhite, fontSize: 17),
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
                            color: ColorsPaleta().yellow),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "OU",
                          style: TextStyle(color: ColorsPaleta().red),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                            height: 4, width: 150, color: ColorsPaleta().red)
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: ColorsPaleta().orange),
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
                                      fontSize: 14.0, color: Colors.black),
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
                                    side: BorderSide(
                                        color: ColorsPaleta().orange),
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
                                      fontSize: 14.0, color: Colors.black),
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
                        Text(
                          "Não têm uma conta?",
                          style: TextStyle(
                              fontSize: 20.0, color: ColorsPaleta().orange),
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
                                    color: ColorsPaleta().red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 9.0,
                            ),
                            Icon(
                              Icons.arrow_right,
                              size: 40.0,
                              color: ColorsPaleta().red,
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
