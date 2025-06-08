import 'package:myapp/Tugas11/modelang.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'anggota.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE anggota_baru(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, email TEXT, visimisi TEXT, phone TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertAnggota(AnggotaModel anggota) async {
    final db = await DBHelper.initDB();
    await db.insert(
      'anggota_baru',
      anggota.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
static Future<List<AnggotaModel>> getAllAnggota() async {
  final db = await DBHelper.initDB();
  final List<Map<String, dynamic>> listData = await db.query('anggota_baru');

  return List.generate(
    listData.length,
    (index) => AnggotaModel.fromMap(listData[index]),
  );
}
 
}