class TeamRegisterModel {
  TeamRegisterModel(
      {this.bussiness_id,
      this.name,
      this.mobile,
      this.email,
      this.designation});

  int? bussiness_id;
  String? name;
  String? mobile;
  String? email;
  String? designation;

  factory TeamRegisterModel.fromJson(Map<String, dynamic> json) =>
      TeamRegisterModel(
          bussiness_id: json["bussiness_id"],
          name: json["name"],
          mobile: json["mobile"],
          email: json["email"],
          designation: json["designation"]);

  Map<String, dynamic> toJson() => {
        "bussiness_id": bussiness_id,
        "name": name,
        "mobile": mobile,
        "email": email,
        "designation": designation
      };
}

class TeamLoginModel {
  TeamLoginModel({
    this.bussiness_id,
    this.mobile,
    this.password,
  });

  int? bussiness_id;
  String? mobile;
  String? password;

  factory TeamLoginModel.fromJson(Map<String, dynamic> json) => TeamLoginModel(
        bussiness_id: json["bussiness_id"],
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() =>
      {"bussiness_id": bussiness_id, "mobile": mobile, "password": password};
}
