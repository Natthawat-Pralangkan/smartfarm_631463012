import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterappmobile/sceen/edit.plant.dart';
import 'package:flutterappmobile/sceen/plant.dart';
import 'package:flutterappmobile/sceen/plant_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../style/Mystyle.dart';

class Show_plant extends StatefulWidget {
  const Show_plant({Key? key}) : super(key: key);
  @override
  _Show_plantState createState() => _Show_plantState();
}

class _Show_plantState extends State<Show_plant> {
  List<PlantModel> PlantModels = [];
  int index = 0;
  @override
  void initState() {
    getplant();
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
                'ข้อมูลพืช',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          Row(
            children: [create()],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          // MyStyle().ShowLogo3(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: const Text(
              "ข้อมูลพืช",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  color:  Color.fromARGB(255, 10, 124, 239),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Showlist()
        ],
      ),
    );
  }

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
                      'รหัสพืช',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ชื่อพืช',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'อายุเก็บเกี่ยว/วัน',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ค่า PH ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'อุณหภูมิที่เหมาะสม(%)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ความชื้นสัมพัทธ์(%)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ความชื้นในดิน(%)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'แก้ไขข้อมูล',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ลบข้อมูล',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: PlantModels.map(
                  (PlantModels) => DataRow(cells: [
                    DataCell(
                      Text(
                        (PlantModels.plant_ID.toString().length > 50)
                            ? PlantModels.plant_ID.toString().substring(0, 50)
                            : PlantModels.plant_ID.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (PlantModels.plant_Name.toString().length > 50)
                            ? PlantModels.plant_Name.toString().substring(0, 50)
                            : PlantModels.plant_Name.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (PlantModels.Age.toString().length > 50)
                            ? PlantModels.Age.toString().substring(0, 50)
                            : PlantModels.Age.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (PlantModels.PH.toString().length > 50)
                            ? PlantModels.PH.toString().substring(0, 50)
                            : PlantModels.PH.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (PlantModels.Temp.toString().length > 50)
                            ? PlantModels.Temp.toString().substring(0, 50)
                            : PlantModels.Temp.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (PlantModels.Humid.toString().length > 50)
                            ? PlantModels.Humid.toString().substring(0, 50)
                            : PlantModels.Humid.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (PlantModels.Soild_moisture.toString().length > 50)
                            ? PlantModels.Soild_moisture.toString()
                                .substring(0, 50)
                            : PlantModels.Soild_moisture.toString(),
                      ),
                    ),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => edit_plant());
                        Navigator.pushNamed(context, "/edit_plant",
                            arguments: {'plant_id': PlantModels.plant_ID});
                      },
                    )),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deletetime(PlantModels);
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
                'ยังไม่พืช',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
  }

  Future<Null> deletetime(PlantModel plantModel) async {
    String? strtitle =
        'คุณต้องการลบหพืช ' + plantModel.plant_Name.toString() + ' นี้ใช่ไหม';
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              // title: const Text('ยืนยันการลบข้อมูลหรือไม่'),
              title: MyStyle().ShowTitle1(strtitle),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                        onPressed: () async {
                          String url =
                              'http://localhost/api1/deletePlant.php?isAdd=true&plant_id=${plantModel.plant_ID}';
                          print(plantModel.plant_ID);
                          await Dio().get(url);
                          getplant();
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
  getplant() async {
    PlantModels.clear();
    print(PlantModels);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? url = 'http://localhost/api1/getPlant.php?isAdd=true';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    print('response==>$response');
    if (result.toString() != 'null') {
      print(result.toString());
      for (var map in result) {
        PlantModel plantModel = PlantModel.fromJson(map);
        setState(() {
          PlantModels.add(plantModel);
          readdata = true;
        });
      }
      print(jsonEncode(PlantModels));
    } else {
      setState(() {
        PlantModels = [];
        readdata = false;
      });
    }
  }

  Widget create() => Container(
        width: 65,
        child: ElevatedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => plant());
            Navigator.push(context, route);
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 10, 124, 239),
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
}
