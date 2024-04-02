import '../database.dart';

class DicTable extends SupabaseTable<DicRow> {
  @override
  String get tableName => 'dic';

  @override
  DicRow createRow(Map<String, dynamic> data) => DicRow(data);
}

class DicRow extends SupabaseDataRow {
  DicRow(super.data);

  @override
  SupabaseTable get table => DicTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

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
}
