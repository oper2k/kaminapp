import '../database.dart';

class TestsAnswersTable extends SupabaseTable<TestsAnswersRow> {
  @override
  String get tableName => 'tests_answers';

  @override
  TestsAnswersRow createRow(Map<String, dynamic> data) => TestsAnswersRow(data);
}

class TestsAnswersRow extends SupabaseDataRow {
  TestsAnswersRow(super.data);

  @override
  SupabaseTable get table => TestsAnswersTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<String> get answers => getListField<String>('answers');
  set answers(List<String>? value) => setListField<String>('answers', value);

  bool? get isPass => getField<bool>('isPass');
  set isPass(bool? value) => setField<bool>('isPass', value);

  bool? get isFaild => getField<bool>('isFaild');
  set isFaild(bool? value) => setField<bool>('isFaild', value);

  String? get courseName => getField<String>('course_name');
  set courseName(String? value) => setField<String>('course_name', value);

  String? get textName => getField<String>('text_name');
  set textName(String? value) => setField<String>('text_name', value);

  List<String> get questions => getListField<String>('questions');
  set questions(List<String>? value) =>
      setListField<String>('questions', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get rlTest => getField<String>('rl_test');
  set rlTest(String? value) => setField<String>('rl_test', value);

  String? get rlCourse => getField<String>('rl_course');
  set rlCourse(String? value) => setField<String>('rl_course', value);

  String? get rlUser => getField<String>('rl_user');
  set rlUser(String? value) => setField<String>('rl_user', value);

  String? get rlLesson => getField<String>('rl_lesson');
  set rlLesson(String? value) => setField<String>('rl_lesson', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);
}
