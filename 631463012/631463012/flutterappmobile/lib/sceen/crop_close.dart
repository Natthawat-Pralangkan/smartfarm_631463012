import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterappmobile/style/Mystyle.dart';
import 'package:flutterappmobile/style/dialog.dart';

class crop_close extends StatefulWidget {
  const crop_close({Key? key}) : super(key: key);
  @override
  _crop_close createState() => _crop_close();
}

class _crop_close extends State<crop_close> {
  String? crop_id, qty, income, cost, docdate;

  @override
  void initState() {
    var initState = super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 10, 124, 239),
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
          input_crop_id(),
          input_docdate(),
          input_income(),
          input_cost(),
          input_qty(),
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
                print('crop_id=$crop_id');
                if (docdate == null || docdate == '') {
                  normalDialog(context, 'กรุณากรอกวันที่ปลูก');
                  return;
                }

                if (crop_id == null || crop_id == '') {
                  normalDialog(context, 'กรุณากรอกรหัสพืช');
                  return;
                }
                if (income == null || income == '') {
                  normalDialog(context, 'กรุณากรอกวันที่ปลูก');
                  return;
                }

                if (cost == null || cost == '') {
                  normalDialog(context, 'กรุณากรอกรหัสพืช');
                  return;
                }

                if (qty == null || qty == '') {
                  normalDialog(context, 'กรุณากรอกรหัสโรงเรือน');
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
    String url =
        'http://localhost//api1/insert_crop_close.php?isAdd=true&crop_id=$crop_id&docdate=$docdate&qty=$qty&income=$income&cost=$cost';
    try {
      Response response = await Dio().get(url);
      print(response.toString() == "true");
      if (response.toString() == "false") {
        //regiterShow();
        normalDialog(context, 'มีไอดีนี้แล้ว $crop_id ');
      } else {
        Navigator.pop(context);
        normalDialog(context, 'ลงทะเบียนเรียบร้อยแล้ว');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget input_crop_id() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => crop_id = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'รหัสรอบการปลูก :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

  Widget input_qty() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => qty = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'ปริมาณผลผลิต :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );

  Widget input_docdate() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => docdate = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'วันที่เก็บเกี่ยว :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );
  Widget input_cost() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => cost = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'ค่าใช้จ่าย :',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyStyle().textColorfocus)),
          ),
        ),
      );
  Widget input_income() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => income = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().textColor,
            ),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'รายได้ :',
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
