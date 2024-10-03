import '../database.dart';

class DepartmentsTable extends SupabaseTable<DepartmentsRow> {
  @override
  String get tableName => 'departments';

  @override
  DepartmentsRow createRow(Map<String, dynamic> data) => DepartmentsRow(data);
}

class DepartmentsRow extends SupabaseDataRow {
  DepartmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DepartmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
