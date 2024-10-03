import '../database.dart';

class LessonsTable extends SupabaseTable<LessonsRow> {
  @override
  String get tableName => 'lessons';

  @override
  LessonsRow createRow(Map<String, dynamic> data) => LessonsRow(data);
}

class LessonsRow extends SupabaseDataRow {
  LessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LessonsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get sort => getField<int>('sort');
  set sort(int? value) => setField<int>('sort', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String? get rlCourse => getField<String>('rl_course');
  set rlCourse(String? value) => setField<String>('rl_course', value);
}
