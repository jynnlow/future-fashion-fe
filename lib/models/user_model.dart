import 'dart:ffi';

class UserModel {
  String username;
  String password;
  String dob;
  String role;
  num chest;
  num waist;
  num hip;

  UserModel({
    required this.username,
    required this.password,
    this.dob = "",
    this.role = "",
    this.chest = 0,
    this.waist = 0,
    this.hip = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = new Map<String, dynamic>();
    jsonData["username"] = this.username;
    jsonData["password"] = this.password;
    jsonData["dob"] = this.dob;
    jsonData["role"] = this.role;
    jsonData["chest"] = this.chest;
    jsonData["waist"] = this.waist;
    jsonData["hip"] = this.hip;
    return jsonData;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      password: json["password"],
      dob: json["dob"],
      role: json["role"],
      chest: json["chest"],
      waist: json["waist"],
      hip: json["hip"],
    );
  }
}
