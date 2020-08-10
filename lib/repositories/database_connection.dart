import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
setDatabse()async{
  var directory = await getApplicationDocumentsDirectory();
  var path = join(directory.path, 'db_todolist_sqlite');
  var database = await openDatabase(path, version: 1, onCreate: _onCreatingDatabse);
  return database;

}

_onCreatingDatabse (Database database, int version) async {
  await database.execute("CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");
}
}