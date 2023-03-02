import 'dart:convert';
import 'package:flutter/material.dart';


import 'package:fnx_631463012/AddData.dart';
import 'package:fnx_631463012/home.dart';
import 'package:fnx_631463012/showData.dart';
import 'package:fnx_631463012/style/mystyle.dart';

class show extends StatefulWidget {
  const show({Key? key}) : super(key: key);

  @override
  State<show> createState() => _show();
}

class _show extends State<show> {
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
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyStyle().textColor,
                              onPrimary: Color.fromARGB(255, 165, 239, 4),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              MaterialPageRoute route = MaterialPageRoute(
                                  builder: (value) => CustomerData());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              'ข้อมูลนักวิจัย',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 253, 253, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyStyle().textColor,
                              onPrimary: Color.fromARGB(255, 165, 239, 4),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const recordData()));
                            },
                            child: Text(
                              'แสดงรายชื่อนักวิจัย',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 253, 253, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyStyle().textColor,
                              onPrimary: Color.fromARGB(255, 165, 239, 4),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              MaterialPageRoute route = MaterialPageRoute(
                                  builder: (value) => LoginScreen());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              'ออกโปรแกรม',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 253, 253, 255),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
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
