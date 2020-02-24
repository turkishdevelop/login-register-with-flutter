/*Kullanıcı Modellerinin oluşturulduğu bölüm*/
import 'dart:io';

class User {
  int id;
  String username;
  String password;
  String email;
  String gender;
  String name;
  String profilePicutre;
  String profilePictureFileName;

  User(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.gender,
      this.name,
      this.profilePicutre,
      this.profilePictureFileName});

  /*JSON olarak verilerin alınması*/
  factory User.fromJson(Map<String, dynamic> json) => new User(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        password: json["password"] == null ? null : json["password"],
        gender: json["gender"] == null ? null : json["gender"],
        profilePicutre:
            json["profilePicture"] == null ? null : json["profilePicture"],
        profilePictureFileName: json["profilePictureFileName"] == null
            ? null
            : json["profilePictureFileName"],
      );

  /*Register işlemi için toJson işlemi*/
  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "password": password == null ? null : password,
        "gender": gender == null ? null : gender,
        "profilePicture": profilePicutre == null ? null : profilePicutre,
        "profilePictureFileName": profilePictureFileName == null ? null : profilePictureFileName,
      };

  Map<String, dynamic> toLogin() => {
        "username": username == null ? null : username,
        "password": password == null ? null : password,
      };
}
