class CloseCropModel {
  String? NO,docDATE, cropID, QTY, inCOME, COST;

  CloseCropModel(
      {
      this.NO,
      this.docDATE,
      this.cropID,
      this.QTY,
      this.inCOME,
      this.COST});
  CloseCropModel.fromJson(Map<String, dynamic> json) {
    NO = json['no'];
    docDATE = json['docdate'];
    cropID = json['crop_id'];
    QTY = json['qty'];
    inCOME = json['income'];
    COST = json['cost'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.NO;
    data['docdate'] = this.docDATE;
    data['crop_id'] = this.cropID;
    data['qty'] = this.QTY;
    data['income'] = this.inCOME;
    data['cost'] = this.COST;
    return data;
  }
}
