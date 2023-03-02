class PlantModel {
  String? plant_ID, plant_Name, Age, PH, Temp, Humid, Soild_moisture;
  PlantModel(
      {this.plant_ID,
      this.plant_Name,
      this.Age,
      this.PH,
      this.Temp,
      this.Humid,
      this.Soild_moisture});
  PlantModel.fromJson(Map<String, dynamic> json) {
    plant_ID = json['plant_id'];
    plant_Name = json['plant_name'];
    Age = json['age'];
    PH = json['ph'];
    Temp = json['temp'];
    Humid = json['humid'];
    Soild_moisture = json['soild_moisture'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plant_id'] = this.plant_ID;
    data['plant_name'] = this.plant_Name;
    data['age'] = this.Age;
    data['ph'] = this.PH;
    data['temp'] = this.Temp;
    data['humid'] = this.Humid;
    data['soild_moisture'] = this.Soild_moisture;
    return data;
  }
}
