import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDB{
  static Database? _db;

  Future<Database?> get db async{
    if(_db ==null){
      _db = await initialize();
    }else{
      return _db;
    }
  }
  Future<Database>initialize()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'abdallah.db');
    Database mydb = await openDatabase(path,onCreate:_onCreate ,version: 1);
    return mydb;
  }

  Future<void> _onCreate(Database db , int version)async{
    try{
      await db.execute(
        '''
        CREATE TABLE "notes" (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT NOT NULL,
        description TEXT NOT NULL
        )
        '''
      );
      print('Database Created ==================>');
    }catch(e){
      print('Error table : $e');
    }
  }

  //CRUD

Future<List<Map<String,dynamic>>>readData(String sql)async{
    Database? mydb = await db;
    try{
      List<Map<String,dynamic>> response = await mydb!.rawQuery(sql);
      return response;
    }catch(e){
      print(e);
      return [];
    }
}

  Future<int>insertData(String sql)async{
    Database? mydb = await db;
    try{
      int response = await mydb!.rawInsert(sql);
      return response;
    }catch(e){
      print(e);
      return 0;
    }
  }

  Future<int>updateData(String sql)async{
    Database? mydb = await db;
    try{
      int response = await mydb!.rawUpdate(sql);
      return response;
    }catch(e){
      print(e);
      return 0;
    }
  }

  Future<int>deleteData(String sql)async{
    Database? mydb = await db;
    try{
      int response = await mydb!.rawDelete(sql);
      return response;
    }catch(e){
      print(e);
      return 0;
    }
  }

}