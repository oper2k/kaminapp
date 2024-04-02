import '../database.dart';

class EatsTable extends SupabaseTable<EatsRow> {
  @override
  String get tableName => 'eats';

  @override
  EatsRow createRow(Map<String, dynamic> data) => EatsRow(data);
}

class EatsRow extends SupabaseDataRow {
  EatsRow(super.data);

  @override
  SupabaseTable get table => EatsTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get subtitle => getField<String>('subtitle');
  set subtitle(String? value) => setField<String>('subtitle', value);
}
