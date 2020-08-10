import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/repositories/database_connection.dart';

class Repository {
  DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection = DatabaseConnection();
  }

  static Database  _database;
  Future <Database> get database async{
    if(_database !=null) return _database;
    _database = await _databaseConnection.setDatabse();
    return _database;

  }

  ///inserting data
inSertData(table, data) async {
var connection = await database;
return await connection.insert(table, data);
}

//reading data from Table

  readData(table)async{
    var connection = await database;
    return await connection.query(table);

  }
}