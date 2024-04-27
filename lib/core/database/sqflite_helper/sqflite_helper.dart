import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/task/data/model/task_model.dart';

class SqfliteHelper {
  // SqfliteHelper._();
  // static final SqfliteHelper dateBase=SqfliteHelper._();
  static Database? _db;

  Future<Database>? get db async {
    if (_db == null) {
      _db = await initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  //! init Database
  initDB() async {
    // get default Database Location
    String databasePath = await getDatabasesPath();
    // get database path and name of date base
    String path = join(databasePath, 'todo.db');
    // create Database
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);

    return myDb;
  }

  //! called when version is updated
  _onUpgrade(Database db, int oldVersion, int newVarsion) {
    if (kDebugMode) {
      print('On Upgrade ================================');
    }
  }

  _onCreate(Database db, int version) async {
    // create table
    await db.execute('''
CREATE TABLE "tasks" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "title" TEXT,
  "notes" TEXT,
  "date" TEXT,
  "endTime" TEXT,
  "startTime" TEXT,
  "color" INTEGER,
  "isCompeleted" INTEGER
)
''');
    if (kDebugMode) {
      print('DataBase Created ================================');
    }
  }

  //! Read Data
  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database? myDb = await db;
    List<Map<String, dynamic>> response = await myDb!.rawQuery(sql);
    return response;
  }

  //! Insert Data
  Future<int> insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  //! Update Data
  Future<int> updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  //! Delete Data
  Future<int> deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  //! get
  Future<List<Map<String, dynamic>>> getFromDB() async {
    Database? myDb = await db;
    return await myDb!.rawQuery('SELECT * FROM tasks');
  }

  //! insert
  Future<int> insertToDB(TaskModel task) async {
    Database? myDb = await db;
    return await myDb!.rawInsert('''
        INSERT INTO tasks(title ,notes ,date ,startTime ,endTime, color, isCompeleted) VALUES
        ('${task.title}','${task.note}','${task.date}','${task.startTime}','${task.endTime}',
        '${task.color}','${task.isComplete}')''');
  }

  //! update
  Future<int> updateDB(int id) async {
    Database? myDb = await db;
    return await myDb!.rawUpdate(''' UPDATE tasks SET isCompeleted= ?
    WHERE id = ?
    ''', [1, id]);
  }

  //! delete
  Future<int> deleteFromDB(int id) async {
    Database? myDb = await db;

    return await myDb!.rawDelete('''
      DELETE FROM tasks WHERE id=?
    ''', [id]);
  }

  //! Delete Datebase
  Future<void> deleteMyDatebase() async {
    // get default Database Location
    String databasePath = await getDatabasesPath();
    // get database path and name of date base
    String path = join(databasePath, 'todo.db');

    await deleteDatabase(path);
  }
}
