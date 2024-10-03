import '../database.dart';

class QuestionsTable extends SupabaseTable<QuestionsRow> {
  @override
  String get tableName => 'questions';

  @override
  QuestionsRow createRow(Map<String, dynamic> data) => QuestionsRow(data);
}

class QuestionsRow extends SupabaseDataRow {
  QuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionsTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<String> get answers => getListField<String>('answers');
  set answers(List<String>? value) => setListField<String>('answers', value);

  String? get rlTest => getField<String>('rl_test');
  set rlTest(String? value) => setField<String>('rl_test', value);

  int? get sort => getField<int>('sort');
  set sort(int? value) => setField<int>('sort', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
