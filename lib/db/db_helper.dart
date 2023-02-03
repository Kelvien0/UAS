import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uts/model/user.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tableUser';
  final String columnId = 'id';
  final String columnFullName = 'fullName';
  final String columnMobileNo = 'mobileNo';
  final String columnEmail = 'email';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'user.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnFullName TEXT,"
        "$columnMobileNo TEXT,"
        "$columnEmail TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveUser(User user) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, user.toMap());
  }

  Future<List?> getAllUser() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnFullName,
      columnMobileNo,
      columnEmail
    ]);

    return result.toList();
  }

  Future<int?> updateUser(User user) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, user.toMap(),
        where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future<int?> deleteUser(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
