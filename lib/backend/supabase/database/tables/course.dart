import '../database.dart';

class CourseTable extends SupabaseTable<CourseRow> {
  @override
  String get tableName => 'course';

  @override
  CourseRow createRow(Map<String, dynamic> data) => CourseRow(data);
}

class CourseRow extends SupabaseDataRow {
  CourseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CourseTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get subname => getField<String>('subname');
  set subname(String? value) => setField<String>('subname', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  int? get sort => getField<int>('sort');
  set sort(int? value) => setField<int>('sort', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);
}
