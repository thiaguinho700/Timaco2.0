import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/Pages/ForgotPassword/ForgotPasswordPage.dart';
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:projeto/Pages/SignInPage/SignInPage.dart';
import 'package:projeto/functionsFlutter/Login_SignIn.dart' show signInUser;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Icon eyeOpenPassword =
      Icon(Icons.visibility, color: ColorsPaleta().mainTextColor);
  Icon eyeClosePassword =
      Icon(Icons.visibility_off, color: ColorsPaleta().mainTextColor);

  bool hiddenPassword = true;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isFinishLoad = false;

  bool isEmailValidBool = false;

  bool isPasswordBool = false;

  void _toggleAnimation() {
    setState(() {
      isFinishLoad = !isFinishLoad;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void validationEmail(String emailString) {
    setState(() {
      isEmailValidBool = EmailValidator.validate(emailString);
      _formKey.currentState!.validate();
    });
  }

  void validationPassword(String passwordString) {
    if (passwordString.length < 6) {
      setState(() {
        isPasswordBool = false;
        _formKey.currentState!.validate();
      });
    } else if (passwordString.length >= 6) {
      setState(() {
        isPasswordBool = true;
        _formKey.currentState!.validate();
      });
    }
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      onChanged: (text) => validationEmail(text),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o email!!";
                        } else if (!isEmailValidBool) {
                          return "Email inválido!!";
                        }
                        return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsPaleta().orange)),
                          fillColor: ColorsPaleta().orange,
                          label: const Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 5.0),
                            child: Text(
                              "E-mail",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: ColorsPaleta().mainTextColor))),
                  TextFormField(
                    onChanged: (text) => validationPassword(text),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira sua senha!!";
                      } else if (!isPasswordBool) {
                        return "Sua senha precisa ter mais de 6 digitos!!";
                      }
                      return null;
                    },
                    controller: _passwordController,
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
                      label: const Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 5.0),
                        child: Text(
                          "Senha",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 20.0, color: ColorsPaleta().mainTextColor),
                    ),
                    obscureText: hiddenPassword,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage()));
                        },
                        child: Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: ColorsPaleta().mainTextColor,
                              decoration: TextDecoration.underline),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _toggleAnimation();
                          Future.delayed(
                              const Duration(seconds: 3),
                              () => {
                                    signInUser(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        const BottomNavBar(),
                                        context),
                                    _toggleAnimation()
                                  });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width - 60, 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          backgroundColor: ColorsPaleta().orange),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1200),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: isFinishLoad
                            ? SpinKitThreeBounce(
                                color: ColorsPaleta().textMainColorWhite,
                                size: 20.0,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: ColorsPaleta().textMainColorWhite,
                                    fontSize: 21),
                              ),
                      )),
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
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
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
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
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
                                        builder: (context) =>
                                            const SignInPage(),
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
          ),
        ]));
  }
}
