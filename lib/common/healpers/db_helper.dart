import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:task_management/common/models/task_model.dart';

class DbHelper {
  // static Future<void> createTables(sql.Database database) async {
  //   await database.execute("CREATE TABLE todos("
  //       "id INTEGER PRIMARY KEY AUTOINCREMENT, "
  //       "title STRING, description STRING, date STRING, "
  //       "startTime STRING, endTime STRING, "
  //       "reminde INTEGER, repeat STRING, "
  //       "isCompleted INTEGER)");

  //   await database.execute("CREATE TABLE users("
  //       "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
  //       "isVerified INTEGER)");
  // }

  static Future<void> createTables(sql.Database database) async {
    await database.execute("CREATE TABLE todos("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title STRING, description STRING, date STRING, "
        "startTime STRING, endTime STRING, "
        "reminde INTEGER, repeat STRING, "
        "isCompleted INTEGER)");

    await database.execute("CREATE TABLE users("
        "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
        "isVerified INTEGER)");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("dbestech", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(Task task) async {
    final db = await DbHelper.db();
    final id = await db.insert("todos", task.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DbHelper.db();

    final data = {'id': 1, 'isVerified': isVerified};

    final id = await db.insert("users", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DbHelper.db();
    return db.query("users", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DbHelper.db();
    return db.query("todos", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DbHelper.db();
    return db.query("todos", where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String title, String desc,
      int isCompleted, String date, String startTime, String endTime) async {
    final db = await DbHelper.db();
    final data = {
      'title': title,
      'description': desc,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime
    };
    print("updated");
    final results =
        await db.update("todos", data, where: "id = ?", whereArgs: [id]);
    return results;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DbHelper.db();
    try {
      db.delete("todos", where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
