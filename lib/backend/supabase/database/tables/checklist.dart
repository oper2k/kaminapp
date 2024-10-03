import '../database.dart';

class ChecklistTable extends SupabaseTable<ChecklistRow> {
  @override
  String get tableName => 'checklist';

  @override
  ChecklistRow createRow(Map<String, dynamic> data) => ChecklistRow(data);
}

class ChecklistRow extends SupabaseDataRow {
  ChecklistRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChecklistTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get dayName => getField<String>('day_name');
  set dayName(String? value) => setField<String>('day_name', value);

  int? get sort => getField<int>('sort');
  set sort(int? value) => setField<int>('sort', value);

  List<String> get tasks => getListField<String>('tasks');
  set tasks(List<String>? value) => setListField<String>('tasks', value);

  List<String> get attension => getListField<String>('attension');
  set attension(List<String>? value) =>
      setListField<String>('attension', value);
}
