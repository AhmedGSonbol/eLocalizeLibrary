import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper
{
  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;

  DBHelper.internal();

  static Database? _db;

  Future<Database?> returnCreateDB() async
  {
    if (_db != null)
    {
      return _db;
    }
    else
    {
      await initDB();
      return _db;
    }
  }

  Future<void> initDB()async
  {
    // print('Start create DB');
    //define the path of the DB
    String path = join(await getDatabasesPath(), 'library.db');
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int v)
        {
      //Create Tables
      // print('create tables');
      db.execute(
          'create table Books(id integer primary key autoincrement,bookName TEXT,bookDescription TEXT,author TEXT,imageLocalPath TEXT,totalCopies integer,availableCopies integer)');
      db.execute(
          'create table Users(id integer primary key autoincrement,userName TEXT,userCode TEXT)');
      // print('finish create tables');
    },

        onUpgrade: (Database db , int oldv , int newv)async
        {
          if(oldv < newv){
            db.execute('delete from Books');
            db.execute('delete from Users');
            await db.execute('alter table Books add column level varchar(50) default good');
            await db.execute('alter table Users add column level varchar(50) default good');
          }
        }
    );

  }


}
