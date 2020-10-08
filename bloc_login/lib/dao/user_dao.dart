import 'dart:convert';

import 'package:bloc_login/database/user_database.dart';
import 'package:bloc_login/model/user_model.dart';

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(User user) async {
    final db = await dbProvider.database;

    var result = db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> deleteUser(String id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(userTable, where: "username = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(String id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'username = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getUser(String id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'username = ?', whereArgs: [id]);
      if (users.length > 0) {

        Map<String, dynamic> hmap = users[0];

        print("1111111111111111111111111111111111111");
        print(hmap);

        return hmap;

      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
