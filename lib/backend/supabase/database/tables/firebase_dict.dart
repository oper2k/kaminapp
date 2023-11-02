import '../database.dart';

class FirebaseDictTable extends SupabaseTable<FirebaseDictRow> {
  @override
  String get tableName => 'firebase_dict';

  @override
  FirebaseDictRow createRow(Map<String, dynamic> data) => FirebaseDictRow(data);
}

class FirebaseDictRow extends SupabaseDataRow {
  FirebaseDictRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FirebaseDictTable();

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  dynamic? get attrs => getField<dynamic>('attrs');
  set attrs(dynamic? value) => setField<dynamic>('attrs', value);
}
