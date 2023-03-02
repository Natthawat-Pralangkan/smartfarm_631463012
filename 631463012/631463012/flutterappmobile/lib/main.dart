import 'package:flutter/material.dart';
import 'package:flutterappmobile/sceen/Show_crop.dart';
import 'package:flutterappmobile/sceen/crop.dart';
import 'package:flutterappmobile/sceen/edit.plant.dart';
import 'package:flutterappmobile/sceen/edit_crop.dart';
import 'package:flutterappmobile/sceen/edit_crop_close.dart';
import 'package:flutterappmobile/sceen/edit_farm.dart';
import 'package:flutterappmobile/sceen/edit_greenhouse.dart';
import 'package:flutterappmobile/sceen/farm.dart';
import 'package:flutterappmobile/sceen/greenhouse.dart';
import 'package:flutterappmobile/sceen/inputserialnumber_page.dart';
import 'package:flutterappmobile/sceen/login.dart';
import 'package:flutterappmobile/sceen/menu.dart';
import 'package:flutterappmobile/sceen/plant.dart';
import 'package:flutterappmobile/sceen/routes.dart';
import 'package:flutterappmobile/sceen/Show_crop_close.dart';
import 'package:flutterappmobile/sceen/Show_farm.dart';
import 'package:flutterappmobile/sceen/Show_plant.dart';
import 'sceen/register.dart';
import 'sceen/Show_greenhouse.dart';



void main() => runApp(const AuthApp());

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        MyRoutes.loginScreen:(context) => LoginScreen(),
        MyRoutes.signUp: (context) => Signup(),
        MyRoutes.Menu: (context) => Menu(),
        MyRoutes.Inputserialnumber: (context) => Inputserialnumber(),
        MyRoutes.Infarm: (context) => Infarm(),
        MyRoutes.Show_farm: (context) => Show_farm(),
        MyRoutes.edit_farm: (context) => edit_farm(),
        MyRoutes.plant: (context) => plant(),
        MyRoutes.Show_plant: (context) => Show_plant(),
        MyRoutes.edit_plant: (context) => edit_plant(),
        MyRoutes.greenhouse: (context) => greenhouse(),
        MyRoutes.edit_greenhouse: (context) => edit_greenhouse(),
        MyRoutes.Show_greenhouse: (context) => Show_greenhouse(),
        MyRoutes.Show_crop: (context) => Show_crop(),
        MyRoutes.crop: (context) => crop(),
        MyRoutes.edit_crop: (context) => edit_crop(),
        MyRoutes.Show_crop_close: (context) => Show_crop_close(),
        MyRoutes.edit_crop_close: (context) => edit_crop_close(),
      },
    );
  }
}