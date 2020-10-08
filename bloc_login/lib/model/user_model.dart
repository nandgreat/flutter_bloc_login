
class User {
  String fullname;
  String email;
  String phone;
  String country;
  String state;
  String username;
  dynamic dob;
  String createdAt;

  User({
    this.fullname,
    this.email,
    this.phone,
    this.country,
    this.state,
    this.username,
    this.dob,
    this.createdAt});

  User.fromJson(dynamic json) {
    fullname = json["Fullname"];
    email = json["email"];
    phone = json["phone"];
    country = json["country"];
    state = json["state"];
    username = json["username"];
    dob = json["dob"];
    createdAt = json["createdAt"];
  }

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
    fullname: data["Fullname"],
    email: data["email"],
    phone: data["phone"],
    country: data["country"],
    state: data["state"],
    username: data["username"],
    dob: data["dob"],
    createdAt: data["createdAt"],
  );

  Map<String, dynamic> toDatabaseJson() => {
    "Fullname" : this.fullname,
    "email" : this.email,
    "phone" : this.phone,
    "country" : this.country,
    "state" : this.state,
    "username" : this.username,
    "dob" : this.dob,
    "createdAt" : this.createdAt,
  };

  Map toMap() {
    Map map = {
      "Fullname" : this.fullname,
      "email" : this.email,
      "phone" : this.phone,
      "country" : this.country,
      "state" : this.state,
      "username" : this.username,
      "dob" : this.dob,
      "createdAt" : this.createdAt,
    };

    return map;
  }

  static fromMap(Map map) {
    User user = new User();
    user.username = map["username"];
    user.fullname = map["Fullname"];
    user.email = map["email"];
    user.phone = map["phone"];
    user.country = map["country"];
    user.state = map["state"];
    user.username = map["username"];
    user.dob = map["dob"];
    user.createdAt = map["createdAt"];

    return user;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Fullname"] = fullname;
    map["email"] = email;
    map["phone"] = phone;
    map["country"] = country;
    map["state"] = state;
    map["username"] = username;
    map["dob"] = dob;
    map["createdAt"] = createdAt;
    return map;
  }

}
