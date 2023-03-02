// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fnx_631463012/updateData.dart';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class recordData extends StatefulWidget {
  const recordData({Key? key}) : super(key: key);

  @override
  State<recordData> createState() => _recordDataState();
}

// ignore: camel_case_types
class _recordDataState extends State<recordData> {
  List userData = [];

  Future<void> delrecord(String id) async {
    try {
      String url = "http://localhost/api_631463012/delete.php";
      var res = await http.post(Uri.parse(url), body: {"id": id});
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        // ignore: avoid_print
        print("Record Delete");
        getrecord();
      } else {
        // ignore: avoid_print
        print("some issue");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> getrecord() async {
    String url = "http://localhost/api_631463012/view_data.php";
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        userData = jsonDecode(response.body);
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 2, 77),
        title: const Text("แสดงข้อมูลรายชื่อนักวิจัย"),
      ),
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  mainAxisAlignment:
                  MainAxisAlignment.center;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => updateData(
                                userData[index]["id"],
                                userData[index]["name"],
                                userData[index]["surname"],
                                userData[index]["address"],
                                userData[index]["district"],
                                userData[index]["prefecture"],
                                userData[index]["province"],
                                userData[index]["phone"],
                                userData[index]["email"],
                              )));
                },
                leading: const Icon(
                  CupertinoIcons.person,
                  color: Colors.blue,
                ),
                title: Text("ชื่อนักวิจัย" +
                    " " +
                    userData[index]["name"] +
                    " " +
                    userData[index]["surname"]),
                subtitle:
                    Text("เบอร์โทรศัพท์" + " " + userData[index]["phone"]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Color.fromARGB(255, 242, 4, 4),
                  onPressed: () {
                    delrecord(userData[index]["id"]);
                  },
                ),
              ),
            );
          }),
    );
  }
}
