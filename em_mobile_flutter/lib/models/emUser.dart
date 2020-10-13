import 'dart:convert';

EMUser emUserFromJson(String str) => EMUser.fromJson(json.decode(str));

String emUserToJson(EMUser data) => json.encode(data.toJson());

class EMUser {
  String email;
  String password;
  String entermediakey;
  String userid;
  String firebasepassword;

  EMUser({
    this.email,
    this.password,
    this.entermediakey,
    this.firebasepassword,
    this.userid,
  });

  factory EMUser.fromJson(Map<String, dynamic> json) => EMUser(
      email: json["email"],
      password: json["password"],
      entermediakey: json["entermediakey"],
      firebasepassword: json["firebasepassword"],
      userid: json["userid"]
  );

  Map<String, dynamic> toJson() {
    return{
    "email": email,
    "password": password,
    "entermediakey": entermediakey
    };

  }
}