class MFSListModel {
  int? id;
  String? code;
  String? name;
  String? logo;
  String? charge;

  MFSListModel({
    this.id,
    this.code,
    this.name,
    this.logo,
    this.charge,
  });

  MFSListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    logo = json['logo'];
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['charge'] = this.charge;
    return data;
  }
}



