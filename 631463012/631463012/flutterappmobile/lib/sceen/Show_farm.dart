import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterappmobile/sceen/edit_farm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../style/Mystyle.dart';
import 'farm.dart';
import 'farm_model.dart';
import 'package:flutterappmobile/style/Mystyle.dart';

class Show_farm extends StatefulWidget {
  const Show_farm({Key? key}) : super(key: key);

  @override
  State<Show_farm> createState() => _Show_farmState();
}

class _Show_farmState extends State<Show_farm> {
  TextEditingController farm = TextEditingController();
  TextEditingController farm1 = TextEditingController();
  TextEditingController farm2 = TextEditingController();
  List<FarmModel> Model = [];
  String? list;
  void initState() {
    getfarm();
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
                'ข้อมูลฟาร์ม',
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
            "ข้อมูลโรงเรือน",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,
                color:  Color.fromARGB(255, 10, 124, 239),
                fontWeight: FontWeight.bold),
          ),
        ),
        Showlist()
      ]),
    );
  }

  Widget create() => Container(
        width: 65,
        child: ElevatedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Infarm());
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
                    //width: 65,
                    label: Text(
                      'รหัสฟาร์ม',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ชื่อฟาร์ม',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ละติจูด',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ลองติจูด',
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
                        (Model.farm_ID.toString().length > 50)
                            ? Model.farm_ID.toString().substring(0, 50)
                            : Model.farm_ID.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.farm_Name.toString().length > 50)
                            ? Model.farm_Name.toString().substring(0, 50)
                            : Model.farm_Name.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.Lat.toString().length > 50)
                            ? Model.Lat.toString().substring(0, 50)
                            : Model.Lat.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        (Model.Lng.toString().length > 50)
                            ? Model.Lng.toString().substring(0, 50)
                            : Model.Lng.toString(),
                      ),
                    ),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => edit_farm());
                        Navigator.pushNamed(context, "/edit_farm",
                            arguments: {'farm_id': Model.farm_ID});
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

  Future<Null> deletetime(FarmModel farmModel) async {
    String? strtitle =
        'คุณต้องการลบฟาร์ม ' + farmModel.farm_Name.toString() + ' นี้ใช่ไหม';
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
                              'http://localhost/api1/deleteFarm.php?isAdd=true&farm_id=${farmModel.farm_ID}';
                          print(farmModel.farm_ID);
                          await Dio().get(url);
                          getfarm();
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

  String? farm_IDa = '';
  gettextfarm(String? IDfarm, {String? Namefarm, Latfarm, Lngfarm}) async {
    print(IDfarm);
    setState(() {
      farm_IDa = IDfarm ?? '';
      farm.text = Namefarm ?? '';
      farm1.text = Latfarm ?? '';
      farm2.text = Lngfarm ?? '';
    });
  }

  bool readdata = false;
  getfarm() async {
    Showlist();
    Model.clear();
    print(Model);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? url = 'http://localhost/api1/getFarm.php?isAdd=true';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    //print('response==>$response');
    if (result.toString() != 'null') {
      //print(result.toString());
      for (var map in result) {
        FarmModel farmModel = FarmModel.fromJson(map);
        setState(() {
          Model.add(farmModel);
          readdata = true;
        });
      }
      //print(jsonEncode(FarmModels));
    } else {
      setState(() {
        Model = [];
        readdata = false;
      });
    }
  }
}
