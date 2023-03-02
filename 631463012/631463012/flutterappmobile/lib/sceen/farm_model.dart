class FarmModel {
  String? farm_ID, farm_Name, Lat, Lng;
  FarmModel({
    this.farm_ID,
    this.farm_Name,
    this.Lat,
    this.Lng,
  });
  FarmModel.fromJson(Map<String, dynamic> json) {
    farm_ID = json['farm_id'];
    farm_Name = json['farm_name'];
    Lat = json['lat'];
    Lng = json['lng'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farm_id'] = this.farm_ID;
    data['farm_name'] = this.farm_Name;
    data['lat'] = this.Lat;
    data['lng'] = this.Lng;
    return data;
  }
}
