import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(super.data);

  @override
  SupabaseTable get table => ChatsTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  String? get rlUserClient => getField<String>('rl_user_client');
  set rlUserClient(String? value) => setField<String>('rl_user_client', value);

  String? get rlUserAdmin => getField<String>('rl_user_admin');
  set rlUserAdmin(String? value) => setField<String>('rl_user_admin', value);

  DateTime? get timestampLastMessage =>
      getField<DateTime>('timestamp_last_message');
  set timestampLastMessage(DateTime? value) =>
      setField<DateTime>('timestamp_last_message', value);
}
