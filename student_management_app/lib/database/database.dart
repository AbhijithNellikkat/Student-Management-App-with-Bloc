import 'dart:async';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StudentDatabase {
  static Future<Database> _openDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "student_db.db");
    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  static FutureOr<void> _createDb(Database db, int version) async {
    await db.execute('''CREATE TABLE student (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      fullName TEXT,
      idNumber INTEGER,
      email TEXT,
      phoneNumber INTEGER,
      class INTEGER,
      DateOfBirth TEXT,
      bloodGroup TEXT,
      studentProfileImage TEXT 
     )''');
  }

  static Future<int> insertStudent({
    required String fullname,
    required int idNumber,
    required Uint8List studentProfileImage,
  }) async {
    final db = await _openDb();
    final data = {
      'fullName': fullname,
      'idNumber': idNumber,
      'studentProfileImage': studentProfileImage
    };
  
    // print('================== Add Student ${data} =================== ');
    return await db.insert('student', data);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await _openDb();
    return await db.query('student');
  }

  static Future<int> deleteData(int id) async {
    final db = await _openDb();
    return await db.delete('student', where: 'id=?', whereArgs: [id]);
  }

  static Future<Map<String, dynamic>?> getSingleData(int id) async {
    final db = await _openDb();
    List<Map<String, dynamic>> result = await db.query(
      'student',
      where: 'id=?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  static Future<int> updateData(int id, Map<String, dynamic> data) async {
    final db = await _openDb();
    return await db.update('student', data, where: 'id=?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await _openDb();
    return db.query('student');
  }
}
