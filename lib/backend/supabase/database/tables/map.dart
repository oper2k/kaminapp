import '../database.dart';

class MapTable extends SupabaseTable<MapRow> {
  @override
  String get tableName => 'map';

  @override
  MapRow createRow(Map<String, dynamic> data) => MapRow(data);
}

class MapRow extends SupabaseDataRow {
  MapRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MapTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameSearch => getField<String>('nameSearch');
  set nameSearch(String? value) => setField<String>('nameSearch', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);
}
