import 'package:flutter/material.dart';
import 'package:projeto/functionsFlutter/Login_SignIn.dart'
    show signInUserGoogleAccount;
import 'package:projeto/utils/BottomNavBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:projeto/Pages/LoginPage/LoginPage.dart';
import 'package:projeto/utils/ScankBarErrorHandler.dart';
import 'package:projeto/functionsFlutter/Login_SignIn.dart'
    show createUserWithEmailPass;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool hiddenPassword = true;

  bool checkBox = false;

  bool isEmailValidBool = true;

  bool isFinishLoad = false;

  final _formKey = GlobalKey<FormState>();

  var isPasswordEqual = true;

  final _nameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController();

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
        isPasswordEqual = false;
        _formKey.currentState!.validate();
      });
    } else if (passwordString.length >= 6) {
      setState(() {
        isPasswordEqual = true;
        _formKey.currentState!.validate();
      });
    }
  }

  void _toggleAnimation() {
    setState(() {
      isFinishLoad = !isFinishLoad;
    });
  }

  Icon eyeOpenPassword = Icon(
    Icons.visibility,
    color: ColorsPaleta().mainTextColor,
  );
  Icon eyeClosePassword = Icon(
    Icons.visibility_off,
    color: ColorsPaleta().mainTextColor,
  );

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Insira o nome!!";
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsPaleta().orange)),
                              labelText: "Nome e Sobrenome *",
                              labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: ColorsPaleta().mainTextColor))),
                      TextFormField(
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
                                  borderSide:
                                      BorderSide(color: ColorsPaleta().orange)),
                              labelText: "E-mail *",
                              labelStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: ColorsPaleta().mainTextColor))),
                      TextFormField(
                        onChanged: (text) => validationPassword(text),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Insira sua senha!!";
                          } else if (!isPasswordEqual) {
                            return "Senha diferentes!!";
                          }
                          return null;
                        },
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
                                fontSize: 20.0,
                                color: ColorsPaleta().mainTextColor)),
                        obscureText: hiddenPassword,
                        controller: _passwordController,
                      ),
                      TextFormField(
                        onChanged: (text) => validationPassword(text),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirme sua senha!!";
                          } else if (!isPasswordEqual) {
                            return "Senha diferentes!!";
                          }
                          return null;
                        },
                        controller: _confirmPasswordController,
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
                                fontSize: 20.0,
                                color: ColorsPaleta().mainTextColor)),
                        obscureText: hiddenPassword,
                      ),
                    ],
                  ),
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
                    "Eu concordo com as políticas de\nprivacidade",
                    style: TextStyle(fontSize: 18.0, color: ColorsPaleta().red),
                    textAlign: TextAlign.start,
                  )
                ],
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_passwordController.text.trim() ==
                      _confirmPasswordController.text.trim()) {
                    if (checkBox) {
                      _toggleAnimation();
                      Future.delayed(
                          const Duration(seconds: 3),
                          () => {
                                createUserWithEmailPass(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                    _nameController.text.trim(),
                                    isEmailValidBool,
                                    context,
                                    const BottomNavBar()),
                                _toggleAnimation()
                              });
                    } else {
                      handleSnackBar(context,
                          "Aceite os termos de uso e privacidade!!\nPor favor, tente novamente.");
                    }
                  } else {
                    setState(() {
                      isPasswordEqual = false;
                    });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 60, 20),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  backgroundColor: ColorsPaleta().orange),
              child: isFinishLoad
                  ? SpinKitThreeBounce(
                      color: ColorsPaleta().textMainColorWhite,
                      size: 20.0,
                    )
                  : Text(
                      'Criar',
                      style: TextStyle(
                          color: ColorsPaleta().textMainColorWhite,
                          fontSize: 21),
                    )),
        ],
      ),
    );
  }
}
