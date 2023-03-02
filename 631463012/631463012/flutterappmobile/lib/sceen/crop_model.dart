class CropModel {
  String? crop_ID, crop_DATE, plant_ID, gh_ID;

  CropModel({this.crop_ID, this.crop_DATE, this.plant_ID, this.gh_ID});
  CropModel.fromJson(Map<String, dynamic> json) {
    crop_ID = json['crop_id'];
    crop_DATE = json['crop_date'];
    plant_ID = json['plant_id'];
    gh_ID = json['gh_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crop_id'] = this.crop_ID;
    data['crop_date'] = this.crop_DATE;
    data['plant_id'] = this.plant_ID;
    data['gh_id'] = this.gh_ID;
    return data;
  }
}
