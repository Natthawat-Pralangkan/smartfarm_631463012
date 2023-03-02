import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterappmobile/style/Mystyle.dart';
import 'package:flutterappmobile/style/dialog.dart';

class Infarm extends StatefulWidget {
  const Infarm({Key? key}) : super(key: key);
  @override
  _farm createState() => _farm();
}

class _farm extends State<Infarm> {
  String? farm_id, farm_name, lat, lng;

  @override
  void initState() {
    var initState = super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Color.fromARGB(255, 237, 54, 124),
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 35),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
//MyStyle().showcrru(),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          input_Userid(),
          input_name(),
          input_lng(),
          input_email(),
          signupbut(),
        ],
      ),
    );
  }

  Widget signupbut() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300.0,
            child: ElevatedButton(
              onPressed: () {
                print('farm_id=$farm_id,farm_name=$farm_name,lat=$lat,lng=$lng');
                if (farm_id == null || farm_id == '') {
                  normalDialog(context, 'กรุณากรอกID');
                  return;
                }
                if (farm_name == null || farm_name == '') {
                  normalDialog(context, 'กรุณากรอกชื่อ');
                  return;
                }
                if (lng == null || lng == '') {
                  normalDialog(context, 'กรุณากรอกเบอร์โทร');
                  return;
                }
                if (lat == null || lat == '') {
                  normalDialog(context, 'กรุณากรอก lat');
                  return;
                }
            
                if (farm_name == null ||
                    lat == null ||
                    farm_id == null ||
                    
                    lng == null ||
                    farm_name == '' ||
                    lat == '' ||
                    farm_id == '' ||
                    lng == '') {
                  normalDialog(context, 'กรุณากรอกข้อมูลให้ครบทุกช่อง');
                } else {
                  CheckUser();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: MyStyle().textColor,
                onPrimary: Colors.blueAccent,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'ลงทะเบียน',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );

  Future<void> CheckUser() async {
    String url ='http://localhost/api1/insert_farm.php?isAdd=true&farm_id=$farm_id&farm_name=$farm_name&lat=$lat&lng=$lng';
    try {
          Response response = await Dio().get(url);
          print(response.toString() == "true");
          if (response.toString() == "false") {
            //regiterShow();
            normalDialog(context,'อีเมล์นี้ $lat มีคนอื่นใช้ไปแล้วกรุณาเปลี่ยนอีเมล์ใหม่');
          } else {
            Navigator.pop(context);
            normalDialog(context,'ลงทะเบียนเรียบร้อยแล้ว');
          }
        } catch (e) {
          print(e);
        }
  }

  Widget input_Userid() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => farm_id = value.trim(),
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'farm_id :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

  Widget input_email() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => lat = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'lat :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

//================= เริ่มสร้าง Field =============
  Widget input_lng() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => lng = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'lng :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

  Widget input_name() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => farm_name = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'farm_name :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );
}
