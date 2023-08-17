import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/medicine.dart';

class DBHelper {
  static Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'medicines.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE medicines(id TEXT PRIMARY KEY, name TEXT, dosage TEXT, frequency TEXT, reminderTimes TEXT, notes TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(Medicine medicine) async {
    final db = await DBHelper.database;
    await db.insert(
      'medicines',
      medicine.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Medicine>> fetchMedicines() async {
    final db = await DBHelper.database;
    final maps = await db.query('medicines');
    return maps.map((e) => Medicine.fromMap(e)).toList();
  }
}
