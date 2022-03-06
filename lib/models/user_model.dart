class UserModel {
  String username;
  String password;
  String dob;
  String role = "";
  int chest = 0;
  int waist = 0;
  int hip = 0;

  UserModel(
      {required this.username, required this.password, required this.dob});

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
}
