import 'package:dro/model/drug_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TravelDB {
  TravelDB._();
  static final TravelDB db = TravelDB._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory trDetDirectory = await getApplicationDocumentsDirectory();
    String path = trDetDirectory.path + "drugs.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Drugs ("
          "id INTEGER PRIMARY KEY,"
          "drugName TEXT,"
          "drugContent TEXT,"
          "drugForm TEXT,"
          "price INTEGER,"
          "image TEXT,"
          "mass TEXT,"
          "availableAmount INTEGER"
          ")");
    });
  }

  newTravel(Drugs newTr) async {
    final db = await database;
    var res = await db.insert("Drugs", newTr.toJson());
    return res;
  }

  Future<List<Drugs>> getTravels() async {
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM Drugs");
    List<Drugs> drugList =
        res.isNotEmpty ? res.map((drug) => Drugs.fromJson(drug)).toList() : [];
    return drugList;
  }

  updateTravel(Drugs upTravel) async {
    final db = await database;
    var res = await db.update("Drugs", upTravel.toJson(),
        where: "id = ?", whereArgs: [upTravel.id]);
    return res;
  }

  deleteTravel(int id) async {
    final db = await database;
    var res = await db.delete("Drugs", where: "id = ?", whereArgs: [id]);
    await getTravels();
    return res;
  }

  Future<int> getCount() async {
    final db = await database;
    var res =
        Sqflite.firstIntValue(await db.rawQuery("select count (*) from Drugs"));
    return res!.toInt();
  }
}
