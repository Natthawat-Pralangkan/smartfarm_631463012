import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterappmobile/style/Mystyle.dart';
import 'package:flutterappmobile/style/dialog.dart';

class plant extends StatefulWidget {
  const plant({Key? key}) : super(key: key);
  @override
  _plant createState() => _plant();
}

class _plant extends State<plant> {
  String? plant_id, plant_name, age,int , ph, temp, humid, soild_moisture;

  @override
  void initState() {
    var initState = super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Color.fromARGB(255, 10, 124, 239),
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
          input_id(),
          input_name(),
          input_age(),
          input_ph(),
          input_temp(),
          input_humid(),
          input_soild_moisture(),
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
                print('plant_id=$plant_id,plant_name=$plant_name,age=$age,ph=$ph,temp=$temp,humid=$humid,soild_moisture=$soild_moisture');
                if (plant_id == null || plant_id == '') {
                  normalDialog(context, 'กรุณากรอกรหัสพืช');
                  return;
                }
                if (plant_name == null || plant_name == '') {
                  normalDialog(context, 'กรุณากรอกชื่อพืช');
                  return;
                }
                if (age == null || age == '') {
                  normalDialog(context, 'กรุณากรอกอายุเก็บเกี่ยว');
                  return;
                }
              if (ph == null || ph == '') {
                  normalDialog(context, 'กรุณากรอก pH [ ]-[ ]');
                  return;
                }
                if (temp == null || temp == '') {
                  normalDialog(context, 'กรุณากรอกอุณภูมิที่เมาะสม');
                  return;
                }
                if (humid == null || humid == '') {
                  normalDialog(context, 'กรุณากรอกความชื้นสัมพัทธ์');
                  return;
                }
                if (soild_moisture == null || soild_moisture == '') {
                  normalDialog(context, 'กรุณากรอกความชื้นในดิน');
                  return;
                }

                if (plant_id == null ||
                    plant_name == null ||
                    age == null ||
                    ph == null ||
                    temp == null ||
                    humid == null ||
                    soild_moisture == null ||
                    
                    plant_name == '' ||
                    plant_id== '' ||
                    age == '' ||
                    ph == '' ||
                    temp == '' ||
                    humid == ''||
                    soild_moisture == '') {
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
    String url ='http://localhost/api1/insert_plant.php?isAdd=true&plant_id=$plant_id&plant_name=$plant_name&age=$age&ph=$ph&temp=$temp&humid=$humid&soild_moisture=$soild_moisture&farm_id';
    try {
          Response response = await Dio().get(url);
          print(response.toString() == "true");
          if (response.toString() == "false") {
            //regiterShow();
            normalDialog(context,'มีไอดีนี้แล้ว $plant_id ');
          } else {
            Navigator.pop(context);
            normalDialog(context,'ลงทะเบียนเรียบร้อยแล้ว');
          }
        } catch (e) {
          print(e);
        }
  }

  Widget input_id() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => plant_id = value.trim(),
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'รหัสพืช :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

  Widget input_age() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => age = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'อายุพืช :',
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
  Widget input_ph() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => ph = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'ค่า ph :',
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
          onChanged: (value) => plant_name = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'ชื่อพืช :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

        Widget input_temp() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => temp = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'อุณหภูมิ :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

        Widget input_humid() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => humid = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'ความชื้นสัมพัทธ์ :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

        Widget input_soild_moisture() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => soild_moisture = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'ความชื้นในดิน :',
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
