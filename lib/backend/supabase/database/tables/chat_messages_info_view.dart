import '../database.dart';

class ChatMessagesInfoViewTable extends SupabaseTable<ChatMessagesInfoViewRow> {
  @override
  String get tableName => 'chat_messages_info_view';

  @override
  ChatMessagesInfoViewRow createRow(Map<String, dynamic> data) =>
      ChatMessagesInfoViewRow(data);
}

class ChatMessagesInfoViewRow extends SupabaseDataRow {
  ChatMessagesInfoViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesInfoViewTable();

  String? get chat => getField<String>('chat');
  set chat(String? value) => setField<String>('chat', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get rlUserOwner => getField<String>('rl_user_owner');
  set rlUserOwner(String? value) => setField<String>('rl_user_owner', value);
}
