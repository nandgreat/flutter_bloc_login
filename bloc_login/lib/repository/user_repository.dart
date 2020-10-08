import 'dart:async';
import 'package:bloc_login/model/login_response.dart';
import 'package:bloc_login/model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:bloc_login/model/api_model.dart';
import 'package:bloc_login/api_connection/api_connection.dart';
import 'package:bloc_login/dao/user_dao.dart';

class UserRepository {
  final userDao = UserDao();

  Future<User> authenticate ({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(
      username: username,
      password: password
    );
    Login_response token = await myuserLogin(userLogin);
    User user = token.user;
    return user;
  }

  Future<void> persistToken ({@required User user}) async {
    // write token with the user to the database
      await userDao.createUser(user);
  }

  Future <void> delteToken({
    @required String id
  }) async {
    await userDao.deleteUser(id);
  }

  Future <bool> hasToken() async {
    bool result = await userDao.checkUser("nandom");
    return result;
  }
}