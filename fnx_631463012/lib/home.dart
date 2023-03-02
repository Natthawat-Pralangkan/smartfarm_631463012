import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fnx_631463012/showhome.dart';
import 'package:fnx_631463012/style/mystyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    MyStyle().showcrru(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyStyle().textColor,
                              onPrimary: Color.fromARGB(255, 165, 239, 4),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              MaterialPageRoute route =
                                  MaterialPageRoute(builder: (value) => show());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              'เมนูหลัก',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 253, 253, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: const Text(" "),
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
}
