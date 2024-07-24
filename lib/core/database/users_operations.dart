
import 'package:elocalize_library_task/core/database/db_helper.dart';
import 'package:elocalize_library_task/core/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

DBHelper dbHelper = DBHelper();

Future<int?> insertUserData(UserModel userModel) async
{
  Database? db = await dbHelper.returnCreateDB();
  return db!.insert('Users', userModel.toMap());
}

Future<List<Map<String, dynamic>>> getAllUsersData() async
{
  Database? db = await dbHelper.returnCreateDB();
  return db!.query('Users');
}