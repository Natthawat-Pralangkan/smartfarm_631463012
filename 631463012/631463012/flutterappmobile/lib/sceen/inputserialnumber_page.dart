import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterappmobile/style/Mystyle.dart';
import 'package:flutterappmobile/sceen/serialnumber_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../style/dialog.dart';

class Inputserialnumber extends StatefulWidget {
  const Inputserialnumber({Key? key}) : super(key: key);
  @override
  _InputserialnumberState createState() => _InputserialnumberState();
}

class _InputserialnumberState extends State<Inputserialnumber> {
  TextEditingController serialnumber = TextEditingController();
  List<SerialnumModel> SerialnumModels = [];
  int index = 0;

  @override
  void initState() {
    getserialnumber();
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
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 35),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            MyStyle().ShowLogo(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'เพิ่มหมายเลขเครื่อง',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'หมายเลขเครื่อง',
                        style: TextStyle(
                            fontSize: 18,
                            color:  Color.fromARGB(255, 10, 124, 239),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 170,
                        child: TextField(
                          controller:
                              serialnumber, //editing controller of thisTextField
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.confirmation_number,
                              color: Color.fromARGB(255, 10, 124, 239),
                            ),
                            labelStyle:
                                TextStyle(color:  Color.fromARGB(255, 10, 124, 239),),
                            labelText: 'กรอกหมายเลขเครื่อง',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color:  Color.fromARGB(255, 10, 124, 239),)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color:  Color.fromARGB(255, 10, 124, 239),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: const Text(" "),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addbt(SerialnumModel()),
                  SizedBox(width: 5),
                  clean(),
                ],
              ),
              Showlist()
            ],
          ),
        ),
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
                horizontalMargin: 15,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      '',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'หมายเลขเครื่อง',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // DataColumn(
                  //   label: Text(
                  //     '',
                  //     style: TextStyle(
                  //         fontStyle: FontStyle.italic,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  DataColumn(
                    label: Text(
                      '',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: SerialnumModels.map(
                  (serialnumModel) => DataRow(cells: [
                    DataCell(
                      Text('หมายเลขเครื่อง'),
                    ),
                    // DataCell(
                    //   Text(
                    //     serialnumModel.idSerialNO.toString().substring(0, 1),
                    //   ),
                    // ),
                    DataCell(
                      Text(
                        (serialnumModel.serialNO.toString().length > 8)
                            ? serialnumModel.serialNO.toString().substring(0, 8)
                            : serialnumModel.serialNO.toString(),
                      ),
                    ),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        gettextserialnumber(
                          serialnumModel.idSerialNO,
                          serialnum: serialnumModel.serialNO,
                        );
                      },
                    )),
                    DataCell(IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        deletetime(serialnumModel);
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

  Widget addbt(SerialnumModel serialnumModel) => Container(
        width: 65.0,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              final sr = serialnumber.text;
              if (sr == null || sr == '') {
                normalDialog(context, 'กรุณากรอกหมายเลขเครื่อง');
              } else {
                print('$idSerialNOa');
                if (idSerialNOa == '') {
                  saveserialnumber();
                  getserialnumber();
                } else {
                  editserialnumber();
                }
              }
            });
          },
          style: ElevatedButton.styleFrom(
            primary: MyStyle().textColor,
            onPrimary: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            idSerialNOa != '' ? 'แก้ไข' : 'เพิ่ม',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
  Widget clean() => Container(
        width: 68.0,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              serialnumber.text = " ";
              idSerialNOa = '';
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'ยกเลิก',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
  add() async {
    await saveserialnumber();
    getserialnumber();
  }

  Future<Null> saveserialnumber() async {
    final serialNO = serialnumber.text;
    String url ='http://localhost/api1/insertSerial.php?isAdd=true&serialNO=$serialNO&idSerialNO=$serialNO';
print('$url');
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        normalDialog(context, 'เพิ่มข้อมูลสำเร็จ');
        setState(() {
          serialnumber.text = '';
        });
      } else if (value.toString() == 'havedata') {
        normalDialog(context, 'มีหมายเลขเครื่องนี้แล้วกรุณาลองใหม่');
        setState(() {
          serialnumber.text = '';
        });
      } else {
        normalDialog(context, 'กรุณาลองใหม่ มีอะไร? ผิดพลาด');
      }
    });
  }

  String? idSerialNOa = '';
  gettextserialnumber(String? idserialnum, {String? serialnum}) async {
    print(idserialnum);
    setState(() {
      idSerialNOa = idserialnum ?? '';
      serialnumber.text = serialnum ?? '';
    });
  }

  Future<Null> deletetime(SerialnumModel serialnumModel) async {
    String? strtitle = 'คุณต้องการลบหมายเลขเครื่อง ' +
        serialnumModel.serialNO.toString() +'ใช่ไหม';
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              // title: const Text('ยืนยันการลบข้อมูลหรือไม่'),
              title: MyStyle().ShowTitle1('คุณต้องการลบหมายเลขเครื่อง ' + serialnumModel.serialNO.toString() +'ใช่ไหม'),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                        onPressed: () async {
                          String url ='http://localhost/api1/delete.php?isAdd=true&idSerialNO=${serialnumModel.idSerialNO}';
                          await Dio().get(url);
                          getserialnumber();
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
                        label: Text('ยืนยัน',
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
  getserialnumber() async {
    SerialnumModels.clear();
    print(SerialnumModels);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //id = preferences.getString('id');
    String? url = 'http://localhost/api1/getSerialNumber.php?isAdd=true';
    Response response = await Dio().get(url);
    var result = json.decode(response.data);
    print('response==>$response');
    if (result.toString() != 'null') {
      for (var map in result) {
        SerialnumModel serialnumModel = SerialnumModel.fromJson(map);
        setState(() {
          SerialnumModels.add(serialnumModel);
          readdata = true;
        });
      }
      print(jsonEncode(SerialnumModels));
    } else {
      setState(() {
        SerialnumModels = [];
        readdata = false;
      });
    }
  }

  Future<Null> editserialnumber() async {
    final serialNo = serialnumber.text;
    String url ='http://localhost/api1/edit.php?isAdd=true&idSerialNO=$idSerialNOa&serialNO=$serialNo';
    await Dio().get(url).then((value) {
      print(url);
      print(value);
      if (value.toString() == 'true') {
        getserialnumber();
        setState(() {
          serialnumber.text = '';
          idSerialNOa = '';
        });
      } else if (value.toString() == 'havedata') {
        normalDialog(context, 'หมายเลขเครื่องี้มีอยู่แล้วกรุณาลองใหม่');
      } else {
        normalDialog(context, 'กรุณาลองใหม่ มีอะไร? ผิดพลาด');
      }
    });
  }
}

