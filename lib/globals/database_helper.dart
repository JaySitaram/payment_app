import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "Transaction.db";
  static final _databaseVersion = 1;

  static final table = 'MyTransaction';

  static final columnImage = 'visaImage';
  static final columnId = 'columnId';
  static final columnName = 'billingName';
  static final columnDate = 'billingDate';
  static final columnExpense = 'billingExpense';
  static final columnBillingCycle = 'billingCycle';
  static final columnExpirationValue = 'expirationValue';
  static final columnMethodAlert = 'methodAlert';
  static final columnDueDateAlert = 'dueDateAlert';
  static final columnCurrency = 'currency';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    String query = "CREATE TABLE IF NOT EXISTS MyTransaction(" +
        columnId +
        " INTEGER PRIMARY KEY NOT NULL," +
        columnImage +
        " TEXT NOT NULL," +
        columnName +
        " TEXT NOT NULL," +
        columnDate +
        " TEXT NOT NULL," +
        columnExpense +
        " TEXT NOT NULL," +
        columnBillingCycle +
        " TEXT NOT NULL," +
        columnExpirationValue +
        " TEXT NOT NULL," +
        columnMethodAlert +
        " TEXT NOT NULL," +
        columnDueDateAlert +
        " TEXT NOT NULL, " +
        columnCurrency +
        " TEXT NOT NULL)";
    await db.execute(query);
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<List<Map<String, dynamic>>> searchQuery(var value) async {
    Database db = await instance.database;
    print(value.isNotEmpty);
    if (value.isNotEmpty) {
      var res = await db.query("MyTransaction",
          where: "$columnName LIKE ?", whereArgs: [value]);
      var res1 = await db.query("MyTransaction",
          where: "$columnExpense LIKE ?", whereArgs: [value]);
      var res2 = await db.query("MyTransaction",
          where: "$columnDate LIKE ?", whereArgs: [value]);
      print(res.isNotEmpty);
      return res.isNotEmpty
          ? res
          : res1.isNotEmpty
              ? res1
              : res2;
    } else {
      return await db.query(table);
    }
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
