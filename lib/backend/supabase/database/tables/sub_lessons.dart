import '../database.dart';

class SubLessonsTable extends SupabaseTable<SubLessonsRow> {
  @override
  String get tableName => 'sub_lessons';

  @override
  SubLessonsRow createRow(Map<String, dynamic> data) => SubLessonsRow(data);
}

class SubLessonsRow extends SupabaseDataRow {
  SubLessonsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubLessonsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get sort => getField<int>('sort');
  set sort(int? value) => setField<int>('sort', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String? get rlLesson => getField<String>('rl_lesson');
  set rlLesson(String? value) => setField<String>('rl_lesson', value);

  List<String> get descriptions => getListField<String>('descriptions');
  set descriptions(List<String>? value) =>
      setListField<String>('descriptions', value);
}
