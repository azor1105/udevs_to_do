class CachedToDoFields {
  static const String tableName = "cached_todos";
  static const String id = "_id";
  static const String categoryId = "category_id";
  static const String title = "title";
  static const String dateTime = "date_time";
  static const String isDone = "is_done";
}

class CachedTodoModel {
  CachedTodoModel({
    this.id,
    required this.categoryId,
    required this.title,
    required this.dateTime,
    required this.isDone,
  });

  static CachedTodoModel fromJson(Map<String, Object?> json) {
    return CachedTodoModel(
      id: json[CachedToDoFields.id] as int?,
      categoryId: json[CachedToDoFields.categoryId] as int,
      title: json[CachedToDoFields.title] as String,
      dateTime: DateTime.parse(json[CachedToDoFields.dateTime] as String),
      isDone: json[CachedToDoFields.isDone] as int == 1,
    );
  }

  CachedTodoModel copyWith({
    int? id,
    int? categoryId,
    String? title,
    DateTime? dateTime,
    bool? isDone,
    int? taskPriority,
  }) =>
      CachedTodoModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        dateTime: dateTime ?? this.dateTime,
        isDone: isDone ?? this.isDone,
      );

  Map<String, Object?> toJson() {
    return {
      CachedToDoFields.id: id,
      CachedToDoFields.categoryId: categoryId,
      CachedToDoFields.title: title,
      CachedToDoFields.dateTime: dateTime.toString(),
      CachedToDoFields.isDone: isDone ? 1 : 0,
    };
  }

  int? id;
  int categoryId;
  String title;
  DateTime dateTime;
  bool isDone;
}
