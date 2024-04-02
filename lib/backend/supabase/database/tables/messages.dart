import '../database.dart';

class MessagesTable extends SupabaseTable<MessagesRow> {
  @override
  String get tableName => 'messages';

  @override
  MessagesRow createRow(Map<String, dynamic> data) => MessagesRow(data);
}

class MessagesRow extends SupabaseDataRow {
  MessagesRow(super.data);

  @override
  SupabaseTable get table => MessagesTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get chat => getField<String>('chat');
  set chat(String? value) => setField<String>('chat', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get rlUserOwner => getField<String>('rl_user_owner');
  set rlUserOwner(String? value) => setField<String>('rl_user_owner', value);
}
