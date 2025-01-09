import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //create db
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      email TEXT,
      password TEXT
      )
    """);
  }

  //call db
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'user.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  //insert user
  static Future<int> addUser(String name, String email, String password) async {
    final db = await SQLHelper.db();
    final data = {'name': name, 'email': email, 'password': password};
    return await db.insert('user', data);
  }

  // Read user
  static Future<Map<String, dynamic>> readUser(int id) async {
    final db = await SQLHelper.db();

    final List<Map<String, dynamic>> result = await db.query(
      'user',
      where: 'id = $id',
    );

    return result.first;
  }

  //update User
  static Future<int> editUser(
      int id, String name, String email, String password) async {
    final db = await SQLHelper.db();
    final data = {'name': name, 'email': email, 'password': password};
    return await db.update('user', data, where: 'id = $id');
  }

  //login user
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final db = await SQLHelper.db();

    final List<Map<String, dynamic>> result = await db.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
