import 'package:bloc_login/model/user_model.dart';

/// message : "Login Success!"
/// jwt : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kb2N0YWxrbmcuY29tIiwiYXVkIjoiaHR0cDpcL1wvZG9jdGFsa25nLmNvbSIsImlhdCI6MjM1Njg5OTUyNCwibmJmIjo5MzU3MTAwMDAwLCJ1c2VyaWQiOjg5fQ.NwWedHCeoAk5ZmlVx0geDet03Cl77M_hiQCt7567PBw"
/// user : {"Fullname":"Paul Kumchi","email":"paul4nank@gmail.com","phone":"09029962906","country":"nigeria","state":"abuja","username":"nandom","dob":null,"created_at":"2020-09-07T15:39:24.000000Z"}

class Login_response {
  String message;
  String jwt;
  User user;


  Login_response({
      this.message,
      this.jwt,
      this.user});

  factory Login_response.fromJson(Map<String, dynamic> json) => Login_response(
      message : json["message"],
      jwt : json["jwt"],
      user : json["user"] != null ? User.fromJson(json["user"]) : null
  );

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    map["jwt"] = jwt;
    if (user != null) {
      map["user"] = user.toJson();
    }
    return map;
  }

}

/// Fullname : "Paul Kumchi"
/// email : "paul4nank@gmail.com"
/// phone : "09029962906"
/// country : "nigeria"
/// state : "abuja"
/// username : "nandom"
/// dob : null
/// created_at : "2020-09-07T15:39:24.000000Z"
