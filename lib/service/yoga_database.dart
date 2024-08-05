import 'dart:async';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yoga/model/model.dart';

class YogaDatabase {
  static final YogaDatabase Inastance = YogaDatabase._init();
  static Database? _database;

  YogaDatabase._init();

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB("YogaStepsDB.db");
    return _database;
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE ${YogaModel.YoagaTeableOne}(
    ${YogaModel.IDName} $idType,
    ${YogaModel.YogaName} $textType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsORNot} $boolType,
    ${YogaModel.SecondsORTime} $textType
    )
  ''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YoagaTeableTwo}(
    ${YogaModel.IDName} $idType,
    ${YogaModel.YogaName} $textType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsORNot} $boolType,
    ${YogaModel.SecondsORTime} $textType
    )
  ''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YoagaTeableThree}(
    ${YogaModel.IDName} $idType,
    ${YogaModel.YogaName} $textType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsORNot} $boolType,
    ${YogaModel.SecondsORTime} $textType
    )
  ''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YoagaTeableSummary}(
    ${YogaModel.IDName} $idType,
    ${YogaModel.YogaWorkoutName} $textType,
    ${YogaModel.BackImage} $textType,
    ${YogaModel.TimeTaken} $textType,
    ${YogaModel.TotalNoOfWorkout} $textType
    )
  ''');
  }


  Future<Yoga?> insert(Yoga yoga, String tableName) async {
    final db = await Inastance.database;
    final id = await db?.insert(
      tableName,
      yoga.toJSON(),
    );
    return yoga.Copy(id: id);
  }

  Future<YogaSummary?> insertYogaSum(YogaSummary yogaSummary) async {
    final db = await Inastance.database;
    final id = await db?.insert(
      YogaModel.YoagaTeableSummary,
      yogaSummary.toJSON(),
    );
    return yogaSummary.Copy(id: id);
  }

  Future<List<YogaSummary>> readAllYogaSummary() async {
    final db = await Inastance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final queryResult =
    await db!.query(YogaModel.YoagaTeableSummary, orderBy: orderBy);
    return queryResult.map((json) => YogaSummary.fromJSON(json)).toList();
  }

  Future<List<Yoga>> readAllYoga(String tableName) async {
    final db = await Inastance.database;
    final orderBy = '${YogaModel.IDName} ASC';
    final queryResult =
        await db!.query(tableName, orderBy: orderBy);
    return queryResult.map((json) => Yoga.fromJSON(json)).toList();
  }

  Future<Yoga?> readOneYoga(int id, String tableName) async {
    final db = await Inastance.database;
    final map = await db!.query(
      tableName,
      columns: YogaModel.YogaTableOneColumns,
      where: '${YogaModel.IDName} = ?',
      whereArgs: [id],
    );
    if(map.isNotEmpty){
      return Yoga.fromJSON(map.first);
    }else{
      return null;
    }
  }
}
