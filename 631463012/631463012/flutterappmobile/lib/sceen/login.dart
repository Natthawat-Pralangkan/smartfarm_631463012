import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterappmobile/sceen/menu.dart';
import 'package:flutterappmobile/sceen/routes.dart';
import 'package:flutterappmobile/style/dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? password, email;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                '../image/1.png',
                fit: BoxFit.cover,
                height: 200,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => email = value.trim(),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'เข้าสู่ระบบ user/email',
                        labelText: 'Email or Username',
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) => password = value.trim(),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'รหัสผ่าน',
                        labelText: 'Password',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Text(" "),
                    ),
                    TextButton.icon(
                      onPressed: (() {
                        print('email=$email,password=$password');
                        if (email == null ||
                            password == null ||
                            email == "" ||
                            password == "") {
                          normalDialog(context, 'กรุณาป้อนข้อมูลให้ครบถ้วน');
                        } else {
                          checkAuthen();
                        }
                        Navigator.pushNamed(context, MyRoutes.homeScreen);
                      }),
                      icon: const Icon(Icons.login),
                      label: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 35,
                        child: const Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: (() {
                            Navigator.pushNamed(
                              context,
                              MyRoutes.signUp,
                            );
                          }),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkAuthen() async {
    //print('OK AUTHEN');
    String url =
        'http://localhost/api1/login.php?isAdd=true&email=$email&password=$password';
    try {
      //print('OK TRY');
      Response response = await Dio().get(url);
      //print(response.data);
      //print('OK RESPONSE DATA');
      var result = jsonDecode(response.data);
      //print('OK RESULT');
      print(result);
      if (result == null || result.length <= 0) {
        normalDialog(
            context, 'อีเมลหรือรหัสผ่าน ไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง');
      } else {
        print('Email and Password Ok');
        MaterialPageRoute route = MaterialPageRoute(builder: (value) => Menu());
        Navigator.push(context, route);
        // for (var map in result) {
        //   EmailModel emailModel = EmailModel.fromJson(map);
        //   if (password == emailModel.password) {
        //   routeTuService(MyHomePage(), emailModel);
        //   } else {
        //     normalDialog(context, 'รหัสผ่านผิดกรุณาป้อน รหัสผ่าน ให้ถูกต้อง');
        //   }
        // }
      }
    } catch (e) {
      print(e);
    }
  }
}
