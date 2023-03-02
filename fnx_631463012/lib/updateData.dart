import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fnx_631463012/showData.dart';
import 'package:fnx_631463012/style/mystyle.dart';

import 'package:http/http.dart' as http;

class updateData extends StatefulWidget {
  String id;
  String name;
  String surname;
  String address;
  String district;
  String prefecture;
  String province;
  String phone;
  String email;
  // ignore: use_key_in_widget_constructors
  updateData(this.id, this.name, this.surname, this.address, this.district,
      this.prefecture, this.province, this.phone, this.email);
  @override
  State<updateData> createState() => _updateDataState();
}

class _updateDataState extends State<updateData> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController prefecture = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> updaterecord() async {
    try {
      String url = "http://localhost/api_631463012/update_data.php";
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
        print("Record Update");
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => const recordData());
        Navigator.push(context, route);
      } else {
        // ignore: avoid_print
        print("error");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    id.text = widget.id;
    name.text = widget.name;
    surname.text = widget.surname;
    address.text = widget.address;
    district.text = widget.district;
    prefecture.text = widget.prefecture;
    province.text = widget.province;
    phone.text = widget.phone;
    email.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขข้อมูลผู้ติดต่อ'),
        backgroundColor: Color.fromARGB(255, 3, 2, 77),
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
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              updaterecord();
            },
            style: ElevatedButton.styleFrom(
              primary: MyStyle().textColor,
              onPrimary: Colors.blueAccent,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              'ยืนยัน',
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
