// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fnx_631463012/style/mystyle.dart';

import 'package:http/http.dart' as http;

class CustomerData extends StatefulWidget {
  const CustomerData({Key? key}) : super(key: key);

  @override
  State<CustomerData> createState() => _CustomerDataState();
}

class _CustomerDataState extends State<CustomerData> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController prefecture = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> inserrecord() async {
    if (id.text != "" ||
        name.text != "" ||
        surname.text != "" ||
        address.text != "" ||
        district.text != "" ||
        prefecture.text != "" ||
        province.text != "" ||
        phone.text != "" ||
        email.text != "") {
      try {
        String url = "http://localhost/api_631463012/insert_data.php";
        var res = await http.post(Uri.parse(url), body: {
          "id": id.text,
          "name": name.text,
          "surname": surname.text,
          "address": address.text,
          "district": district.text,
          "prefecture": prefecture.text,
          "province": province.text,
          "phone": phone.text,
          "email": email.text
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          // ignore: avoid_print
          print("Record Inserted");
          id.text = "";
          name.text = "";
          surname.text = "";
          address.text = "";
          district.text = "";
          prefecture.text = "";
          province.text = "";
          phone.text = "";
          email.text = "";
        } else {
          // ignore: avoid_print
          print("some issue");
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {
      // ignore: avoid_print
      print("Please fill all fileds.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 2, 77),
        title: const Text('ข้อมูลนักวิจัย'),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: id,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'รหัส :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'ชื่อ :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: surname,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'นามสกุล :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: address,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'ที่อยู่ :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: district,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'ตำบล :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: prefecture,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'อำเภอ :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: province,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'จังหวัด :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: phone,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'เบอร์ติดต่อ :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: MyStyle().textColor),
              labelText: 'อีเมล์ :',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyStyle().textColorfocus)),
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 3, 2, 77),
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              inserrecord();
            },
            style: ElevatedButton.styleFrom(
              primary: MyStyle().textColor,
              onPrimary: Colors.blueAccent,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'บันทึกข้อมูล',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
