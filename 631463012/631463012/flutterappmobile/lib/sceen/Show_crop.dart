import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterappmobile/sceen/edit_crop.dart';
import 'crop.dart';
import 'package:flutterappmobile/style/Mystyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'crop_model.dart';

class Show_crop extends StatefulWidget {
  const Show_crop({Key? key}) : super(key: key);

  @override
  State<Show_crop> createState() => _Show_cropState();
}

class _Show_cropState extends State<Show_crop> {
  List<CropModel> Model = [];
  void initState() {
    getcrop();
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
                  'ข้อมูลการเพาะปลูก',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
        body: ListView(padding: EdgeInsets.all(30.0), children: <Widget>[
          Row(
            children: [create()],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          // MyStyle().ShowLogo3(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: const Text(
              "ข้อมูลรอบการปลูก",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  color:  Color.fromARGB(255, 10, 124, 239),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Showlist()
        ]));
  }

  Widget create() => Container(
        width: 65,
        child: ElevatedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => crop());
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
    print('======>$readdata');
    return readdata
        ? Container(
            child: Container(
              margin: EdgeInsets.all(15),
              child: DataTable(
                columnSpacing: 10,
                // horizontalMargin: 15,
                columns: const <DataColumn>[
                  DataColumn(
                    //width: 65,
                    label: Text(
                      'เลขที่รอบการปลูก',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'วันที่ปลูก',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'เลขที่พืช',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'เลขที่โรงเรือน',
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
                        (Model.crop_ID.toString().length > 50)
                            ? Model.crop_ID.toString().substring(0, 50)
                            : Model.crop_ID.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.crop_DATE.toString().length > 50)
                            ? Model.crop_DATE.toString().substring(0, 50)
                            : Model.crop_DATE.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.plant_ID.toString().length > 50)
                            ? Model.plant_ID.toString().substring(0, 50)
                            : Model.plant_ID.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.gh_ID.toString().length > 50)
                            ? Model.gh_ID.toString().substring(0, 50)
                            : Model.gh_ID.toString(),
                      ),
                    ),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (value) => edit_crop());
                        Navigator.pushNamed(context, "/edit_crop",
                            arguments: {'crop_id': Model.crop_ID});
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
                'ยังไม่เพาะปลูก',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
  }

  Future<Null> deletetime(CropModel cropModel) async {
    String? strtitle = 'คุณต้องการลบข้อมูลการเพาะปลูก ' +
        cropModel.crop_ID.toString() +
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
                              'http://localhost/api1/deleteCrop.php?isAdd=true&crop_id=${cropModel.crop_ID}';
                          print(cropModel.crop_ID);
                          await Dio().get(url);
                          getcrop();
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
  getcrop() async {
    Showlist();
    Model.clear();
    print(Model);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? url = 'http://localhost/api1/getCrop.php?isAdd=true';
    Response response = await Dio().get(url);
    print('===>$response');
    var result = json.decode(response.data);
    print(result.toString());
    if (result.toString() != 'null') {
      //print(result.toString());
      for (var map in result) {
        CropModel cropModel = CropModel.fromJson(map);
        setState(() {
          Model.add(cropModel);
          readdata = true;
        });
      }
      //print(jsonEncode(Model));
    } else {
      setState(() {
        Model = [];
        readdata = false;
      });
    }
  }
}
