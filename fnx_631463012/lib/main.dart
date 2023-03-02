import 'package:flutter/material.dart';


import 'package:fnx_631463012/home.dart';
import 'package:fnx_631463012/routes.dart';
import 'package:fnx_631463012/style/mystyle.dart';

void main() => runApp(const AuthApp());

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: 'loginScreen',
      routes: {
        MyRoutes.loginScreen: (context) => LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            MyStyle().showcrru(),
            Container(
              width: 250,
              margin: const EdgeInsets.all(10),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text("เมนูหลัก"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
