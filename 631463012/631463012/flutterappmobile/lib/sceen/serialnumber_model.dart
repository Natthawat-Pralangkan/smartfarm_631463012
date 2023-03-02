class SerialnumModel {
  String? idSerialNO;
  String? serialNO;
  SerialnumModel({this.idSerialNO, this.serialNO});
  SerialnumModel.fromJson(Map<String, dynamic> json) {
    idSerialNO = json['idSerialNO'];
    serialNO = json['serialNO'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idSerialNO'] = this.idSerialNO;
    data['serialNO'] = this.serialNO;
    return data;
  }
}

