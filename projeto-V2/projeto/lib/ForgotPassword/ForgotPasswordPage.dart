import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:projeto/functionsFlutter/Login_SignIn.dart' show forgetPassword;

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  bool isFinishLoad = false;

  bool isEmailValidBool = true;

  void validationEmail(String emailString) {
    setState(() {
      isEmailValidBool = EmailValidator.validate(emailString);
      _formKey.currentState!.validate();
    });
  }

  void _toggleAnimation() {
    setState(() {
      isFinishLoad = !isFinishLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Icon(Icons.arrow_back,
                color: ColorsPaleta().yellow, size: 40.0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SvgPicture.asset("lib/Image/SoccerImgSub.svg",
                      width: 180.0),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Resetar senha",
                        style: TextStyle(
                            fontSize: 28.0,
                            color: ColorsPaleta().mainTextColor,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          "Por favor, insira seu email para resetar sua senha!",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: ColorsPaleta().mainTextColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                              onChanged: (text) => validationEmail(text),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Insira o email!!";
                                } else {
                                  final isEmailValid =
                                      EmailValidator.validate(value);
                                  if (!isEmailValid) {
                                    return "Email inválido!!";
                                  }
                                }
                                return null;
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsPaleta().orange)),
                                  labelText: "E-mail *",
                                  labelStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: ColorsPaleta().mainTextColor))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _toggleAnimation();
                      // forgetPassword(context, _emailController.text.trim());
                      Future.delayed(const Duration(seconds: 3),
                          () => {_toggleAnimation()});
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
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: isFinishLoad
                        ? SpinKitThreeBounce(
                            color: ColorsPaleta().textMainColorWhite,
                            size: 20.0,
                          )
                        : Text(
                            'Mudar senha',
                            style: TextStyle(
                                color: ColorsPaleta().textMainColorWhite,
                                fontSize: 21),
                          ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
