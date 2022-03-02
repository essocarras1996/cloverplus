
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'SessionObject.dart';

class TuEnvioDatabase {
  static final TuEnvioDatabase instance = TuEnvioDatabase._init();

  static Database? _database;

  TuEnvioDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tuenvio.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final usuarioType = 'TEXT NOT NULL';
    final cookieType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE $tableSesion (
    ${SessionObjectFields.usuario} $usuarioType,
    ${SessionObjectFields.password} $cookieType
    );
    ''');
  }
  Future<SessionObject> createSession(SessionObject session) async {
    final db = await instance.database;
    final id = await db.insert(tableSesion, session.toJson());
    return session;
  }

  Future<SessionObject> readSesion(String user) async {
    final db = await instance.database;
    final maps = await db.query(
      tableSesion,
      columns: SessionObjectFields.values,
      where: '${SessionObjectFields.usuario} = ?',
      whereArgs: [user],
    );
    if (maps.isNotEmpty) {
      return SessionObject.fromJson(maps.first);
    } else {
      print('ID $user not found');
      SessionObject ss = new SessionObject(usuario: "usuario", password: "password");
      return ss;
    }
  }
  Future<List<SessionObject>> readAllSesion() async {
    final db = await instance.database;
    final result = await db.query(tableSesion);
    return result.map((json) => SessionObject.fromJson(json)).toList();
  }

  Future<int> update(SessionObject session) async {
    final db = await instance.database;
    return db.update(
      tableSesion,
      session.toJson(),
      where: '${SessionObjectFields.usuario} = ?',
      whereArgs: [session.usuario],
    );
  }

  Future<int> delete(String user) async {
    final db = await instance.database;
    return await db.delete(
      tableSesion,
      where: '${SessionObjectFields.usuario} = ?',
      whereArgs: [user],
    );
  }


  Future close() async {
    final db = await instance.database;
    db.close();
  }
}