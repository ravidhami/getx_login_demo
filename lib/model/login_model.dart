import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.token,
    this.tokenType,
    this.user,
  });

  bool? status;
  String? token;
  String? tokenType;
  User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] == null ? null : json["status"],
        token: json["token"] == null ? null : json["token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "token": token == null ? null : token,
        "token_type": tokenType == null ? null : tokenType,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.birthDate,
    this.gender,
    this.password,
  });

  int? id;
  String? name;
  String? email;
  dynamic? emailVerifiedAt;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? birthDate;
  dynamic? gender;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        birthDate: json["birth_date"],
        gender: json["gender"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "image": image == null ? null : image,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "birth_date": birthDate,
        "gender": gender,
        "password": password == null ? null : password,
      };
}
