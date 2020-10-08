import 'dart:async';
import 'dart:convert';
import 'package:bloc_login/model/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_login/model/api_model.dart';

// final _base = "https://home-hub-app.herokuapp.com";
final _base = "http://www.doctalkng.com/api/";
// final _tokenEndpoint = "/api-token-auth/";
final _tokenEndpoint = "login";
final _tokenURL = _base + _tokenEndpoint;

Future<Login_response> myuserLogin(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return Login_response.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
