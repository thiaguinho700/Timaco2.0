import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:projeto/utils/ColorsPaleta.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool hiddenPassword = false;

  Icon eyeOpenPassword = Icon(
    Icons.visibility,
    color: ColorsPaleta().red,
  );
  Icon eyeClosePassword = Icon(
    Icons.visibility_off,
    color: ColorsPaleta().red,
  );

  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Icon(Icons.arrow_back,
                color: ColorsPaleta().yellow, size: 40.0)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("lib/Image/SoccerImgSub.svg", width: 180.0),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorsPaleta().orange)),
                            labelText: "Nome *",
                            labelStyle: TextStyle(
                                fontSize: 20.0, color: ColorsPaleta().red))),
                    TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorsPaleta().orange)),
                            labelText: "E-mail *",
                            labelStyle: TextStyle(
                                fontSize: 20.0, color: ColorsPaleta().red))),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().orange)),
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    hiddenPassword = !hiddenPassword;
                                  }),
                              iconSize: 33.0,
                              icon: hiddenPassword
                                  ? eyeClosePassword
                                  : eyeOpenPassword),
                          labelText: "Senha *",
                          labelStyle: TextStyle(
                              fontSize: 20.0, color: ColorsPaleta().red)),
                      obscureText: hiddenPassword,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().orange)),
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    hiddenPassword = !hiddenPassword;
                                  }),
                              iconSize: 33.0,
                              icon: hiddenPassword
                                  ? eyeClosePassword
                                  : eyeOpenPassword),
                          labelText: "Confirmar senha *",
                          labelStyle: TextStyle(
                              fontSize: 20.0, color: ColorsPaleta().red)),
                      obscureText: hiddenPassword,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 9.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: ColorsPaleta().orange,
                      value: checkBox,
                      onChanged: (value) {
                        setState(() {
                          checkBox = !checkBox;
                        });
                      }),
                   Text(
                    "Eu concordo com a política de ${'\n'} privacidade",
                    style: TextStyle(fontSize: 18.0,color: ColorsPaleta().red),
                    textAlign: TextAlign.start,
                  )
                ],
              )
            ],
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
              'Criar',
              style: TextStyle(
                  color: ColorsPaleta().textMainColorWhite, fontSize: 21),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 4, width: 150, color: ColorsPaleta().yellow),
              const SizedBox(
                width: 5,
              ),
              Text(
                "OU",
                style: TextStyle(color: ColorsPaleta().red, fontSize: 15.0),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(height: 4, width: 150, color: ColorsPaleta().red)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: ColorsPaleta().orange),
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
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
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
                          side: BorderSide(color: ColorsPaleta().orange),
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10)),
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
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
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
