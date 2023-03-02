import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterappmobile/sceen/crop_close.dart';
import 'package:flutterappmobile/sceen/edit_crop_close.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../style/Mystyle.dart';
import 'crop_close_model.dart';

class Show_crop_close extends StatefulWidget {
  const Show_crop_close({Key? key}) : super(key: key);

  @override
  State<Show_crop_close> createState() => _Show_crop_close();
}

class _Show_crop_close extends State<Show_crop_close> {
  TextEditingController crop = TextEditingController();
  List<CloseCropModel> Model = [];
  void initState() {
    getCloseCrop();
    super.initState();
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
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            MyStyle().ShowLogo(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'ข้อมูลการเก็บเกี่ยว',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          Row(
            children: [
              Column(
                children: [
                  create(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: const Text(" "),
                  ),
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          // MyStyle().ShowLogo3(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: const Text(" "),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: const Text(
              "ข้อมูลการเก็บเกี่ยว",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  color:  Color.fromARGB(255, 10, 124, 239),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Showlist(),
        ],
      ),
    );
  }

  Widget create() => Container(
        width: 65,
        child: ElevatedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => crop_close());
            Navigator.push(context, route);
          },
          style: ElevatedButton.styleFrom(
            primary:  Color.fromARGB(255, 10, 124, 239),
            onPrimary: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'เพิ่ม',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget Showlist() {
    return readdata
        ? Container(
            child: Container(
              margin: EdgeInsets.all(15),
              child: DataTable(
                columnSpacing: 10,
                // horizontalMargin: 15,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'วันที่เก็บเกี่ยว',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'รหัสพืช',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ปริมาณผลผลิต(กก)',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'รายได้(บาท)',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ค่าใช้จ่าย(บาท)',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'แก้ไขข้อมูล',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ลบข้อมูล',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: Model.map(
                  (Model) => DataRow(cells: [
                    DataCell(
                      Text(
                        (Model.docDATE.toString().length > 50)
                            ? Model.docDATE
                                .toString()
                                .substring(0, 50)
                            : Model.docDATE.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.cropID.toString().length > 50)
                            ? Model.cropID.toString().substring(0, 50)
                            : Model.cropID.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.QTY.toString().length > 50)
                            ? Model.QTY.toString().substring(0, 50)
                            : Model.QTY.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.inCOME.toString().length > 50)
                            ? Model.inCOME.toString().substring(0, 50)
                            : Model.inCOME.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.COST.toString().length > 50)
                            ? Model.COST.toString().substring(0, 50)
                            : Model.COST.toString(),
                      ),
                    ),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => edit_crop_close());
                        Navigator.pushNamed(context, "/edit_crop_close",
                            arguments: {'no': Model.NO});
                      },
                    )),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deletetime(Model);
                      },
                    ))
                  ]),
                ).toList(),
              ),
            ),
          )
        : Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'ยังไม่มีเครื่อง',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
  }

  Future<Null> deletetime(CloseCropModel closeCropModel) async {
    String? strtitle = 'คุณต้องการลบเก็บเกี่ยว ' +
        closeCropModel.docDATE.toString() +
        ' นี้ใช่ไหม';
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: MyStyle().ShowTitle1(strtitle),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                        onPressed: () async {
                          String url =
                              'http://localhost/api1/deleteCloseCrop.php?isAdd=true&no=${closeCropModel.NO}';
                          print(closeCropModel.NO);
                          await Dio().get(url);
                          getCloseCrop();
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.blueAccent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                        ),
                        label: Text(
                          'ยืนยัน',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.blueAccent,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      label: Text(
                        'ยกเลิก',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ));
  }

  bool readdata = false;
  getCloseCrop() async {
    Showlist();
    Model.clear();
    print(Model);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? url = 'http://localhost//api1/getCloseCrop.php?isAdd=true';
    Response response = await Dio().get(url);
    print('===>$response');
    var result = json.decode(response.data);
    print(result.toString());
    if (result.toString() != 'null') {
      //print(result.toString());
      for (var map in result) {
        CloseCropModel closeCropModel = CloseCropModel.fromJson(map);
        setState(() {
          Model.add(closeCropModel);
          readdata = true;
        });
      }
      //print(jsonEncode(CropModels));
    } else {
      setState(() {
        Model = [];
        readdata = false;
      });
    }
  }
}
