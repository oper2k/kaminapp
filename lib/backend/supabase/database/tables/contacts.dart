import '../database.dart';

class ContactsTable extends SupabaseTable<ContactsRow> {
  @override
  String get tableName => 'contacts';

  @override
  ContactsRow createRow(Map<String, dynamic> data) => ContactsRow(data);
}

class ContactsRow extends SupabaseDataRow {
  ContactsRow(super.data);

  @override
  SupabaseTable get table => ContactsTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get division => getField<String>('division');
  set division(String? value) => setField<String>('division', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
