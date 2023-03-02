class GreehouseModel {
  String? gh_ID, gh_Name;
  GreehouseModel({this.gh_ID, this.gh_Name});
  GreehouseModel.fromJson(Map<String, dynamic> json) {
    gh_ID = json['gh_id'];
    gh_Name = json['gh_name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gh_id'] = this.gh_ID;
    data['gh_name'] = this.gh_Name;
    return data;
  }
}
