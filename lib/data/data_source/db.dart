import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDB();
      return _db;
    } else {
      return _db;
    }
  }

  intialDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "ecommerce.db");
    Database myDb = await openDatabase(path,
        onCreate: _oncreated, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  _oncreated(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
create table cart(
  "id" integer not null primary key AUTOINCREMENT,
  "title" integer not null ,
  "image"text  not null,
   "quantity" integer not null
  

)
''');

    await batch.commit();
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {}

  readData(String query) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(query);
    return response;
  }

  insertData(String query) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(query);
    return response;
  }

  updateData(String query) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(query);
    return response;
  }

  deleteData(String query) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(query);
    return response;
  }

  deleteMyDataBase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "ecommerce.db");
    await deleteDatabase(path);
  }
}