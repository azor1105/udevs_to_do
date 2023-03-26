import 'package:udevs_todo/data/db/local_db.dart';
import 'package:udevs_todo/data/models/cached_todo_model.dart';

class TodoRepository {
  Future<List<CachedTodoModel>> getAllToDos() async {
    final db = await LocalDb.getInstance.database;
    const orderBy = "${CachedToDoFields.dateTime} ASC";
    final toDos = await db.query(
      CachedToDoFields.tableName,
      orderBy: orderBy,
    );
    return toDos.map((json) => CachedTodoModel.fromJson(json)).toList();
  }

  Future<CachedTodoModel> addCacheToDo(CachedTodoModel cachedTodo) async {
    final db = await LocalDb.getInstance.database;
    final id = await db.insert(CachedToDoFields.tableName, cachedTodo.toJson());
    return cachedTodo.copyWith(id: id);
  }

  Future<int> updateCachedTodoStatus(int id, bool status) async {
    Map<String, dynamic> row = {
      CachedToDoFields.isDone: status,
    };
    final db = await LocalDb.getInstance.database;
    return db.update(
      CachedToDoFields.tableName,
      row,
      where: '${CachedToDoFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteCachedTodoById(int id) async {
    final db = await LocalDb.getInstance.database;
    var t = await db.delete(CachedToDoFields.tableName,
        where: "${CachedToDoFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  Future<int> updateCachedTodo({
    required int id,
    required CachedTodoModel cachedTodo,
  }) async {
    Map<String, Object?> toDo = cachedTodo.toJson();
    Map<String, dynamic> row = {
      CachedToDoFields.isDone: toDo[CachedToDoFields.isDone],
      CachedToDoFields.title: toDo[CachedToDoFields.title],
      CachedToDoFields.categoryId: toDo[CachedToDoFields.categoryId],
      CachedToDoFields.dateTime: toDo[CachedToDoFields.dateTime],
    };

    final db = await LocalDb.getInstance.database;
    return db.update(
      CachedToDoFields.tableName,
      row,
      where: '${CachedToDoFields.id} = ?',
      whereArgs: [id],
    );
  }
}
