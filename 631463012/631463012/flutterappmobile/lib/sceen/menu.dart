import 'package:flutter/material.dart';
import 'package:flutterappmobile/sceen/Show_crop.dart';
import 'package:flutterappmobile/sceen/inputserialnumber_page.dart';
import 'package:flutterappmobile/sceen/Show_crop_close.dart';
import 'package:flutterappmobile/sceen/Show_farm.dart';
import 'package:flutterappmobile/sceen/Show_greenhouse.dart';
import 'package:flutterappmobile/sceen/Show_plant.dart';
import '../style/Mystyle.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  void initState() {
    //getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 10, 124, 239),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white, size: 35),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              MyStyle().ShowLogo(),
              Container(
                child: const Text(
                  'เมนูหลัก',
                  style: TextStyle(color: Colors.white, fontSize: 23.0),
                ),
              ),
            ],
          ),
        ),
        //drawer: showDrawer(),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 20,
                  right: 250,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor:  Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Menu());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "จัดการข้อมูลผู้ดูแลระบบ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor:  Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (value) => Inputserialnumber());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "เพิ่มหมายเลขเครื่อง",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Show_farm());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "ฟาร์ม",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor:  Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Show_plant());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "พืช",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Show_greenhouse());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "โรงเรือน",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor:  Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Show_crop());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "รอบการปลูก",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Color.fromARGB(255, 10, 124, 239),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Show_crop_close());
                  Navigator.push(context, route);
                },
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              "ผลผลิต",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*3*/
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
