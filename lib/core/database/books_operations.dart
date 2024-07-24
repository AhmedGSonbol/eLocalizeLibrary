import 'package:elocalize_library_task/core/database/db_helper.dart';
import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:sqflite/sqflite.dart';

DBHelper dbHelper = DBHelper();

Future<int?> insertBookData(BookModel bookModel) async
{

  // print('insert book');
  Database? db = await dbHelper.returnCreateDB();
  return db!.insert('Books', bookModel.toMap());
}

Future<List<Map<String, dynamic>>> getAllBooksData() async
{

  Database? db = await dbHelper.returnCreateDB();
  return db!.query('Books');
}


Future<int?> updateBookData(BookModel bookModel)async{
  Database? db = await dbHelper.returnCreateDB();
  return db!.update('Books', bookModel.toMap(),where: 'id=?' , whereArgs: [bookModel.id]);
}