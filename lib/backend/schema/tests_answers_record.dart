import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsAnswersRecord extends FirestoreRecord {
  TestsAnswersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "isPass" field.
  bool? _isPass;
  bool get isPass => _isPass ?? false;
  bool hasIsPass() => _isPass != null;

  // "isFaild" field.
  bool? _isFaild;
  bool get isFaild => _isFaild ?? false;
  bool hasIsFaild() => _isFaild != null;

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "test_name" field.
  String? _testName;
  String get testName => _testName ?? '';
  bool hasTestName() => _testName != null;

  // "rl_test" field.
  DocumentReference? _rlTest;
  DocumentReference? get rlTest => _rlTest;
  bool hasRlTest() => _rlTest != null;

  // "rl_course" field.
  DocumentReference? _rlCourse;
  DocumentReference? get rlCourse => _rlCourse;
  bool hasRlCourse() => _rlCourse != null;

  // "rl_user" field.
  DocumentReference? _rlUser;
  DocumentReference? get rlUser => _rlUser;
  bool hasRlUser() => _rlUser != null;

  // "questions" field.
  List<String>? _questions;
  List<String> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "rl_lesson" field.
  DocumentReference? _rlLesson;
  DocumentReference? get rlLesson => _rlLesson;
  bool hasRlLesson() => _rlLesson != null;

  void _initializeFields() {
    _user = snapshotData['user'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _answers = getDataList(snapshotData['answers']);
    _isPass = snapshotData['isPass'] as bool?;
    _isFaild = snapshotData['isFaild'] as bool?;
    _courseName = snapshotData['course_name'] as String?;
    _testName = snapshotData['test_name'] as String?;
    _rlTest = snapshotData['rl_test'] as DocumentReference?;
    _rlCourse = snapshotData['rl_course'] as DocumentReference?;
    _rlUser = snapshotData['rl_user'] as DocumentReference?;
    _questions = getDataList(snapshotData['questions']);
    _rlLesson = snapshotData['rl_lesson'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests_answers');

  static Stream<TestsAnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestsAnswersRecord.fromSnapshot(s));

  static Future<TestsAnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestsAnswersRecord.fromSnapshot(s));

  static TestsAnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestsAnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestsAnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestsAnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestsAnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestsAnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestsAnswersRecordData({
  String? user,
  DateTime? timeStamp,
  bool? isPass,
  bool? isFaild,
  String? courseName,
  String? testName,
  DocumentReference? rlTest,
  DocumentReference? rlCourse,
  DocumentReference? rlUser,
  DocumentReference? rlLesson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'time_stamp': timeStamp,
      'isPass': isPass,
      'isFaild': isFaild,
      'course_name': courseName,
      'test_name': testName,
      'rl_test': rlTest,
      'rl_course': rlCourse,
      'rl_user': rlUser,
      'rl_lesson': rlLesson,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestsAnswersRecordDocumentEquality
    implements Equality<TestsAnswersRecord> {
  const TestsAnswersRecordDocumentEquality();

  @override
  bool equals(TestsAnswersRecord? e1, TestsAnswersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.timeStamp == e2?.timeStamp &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.isPass == e2?.isPass &&
        e1?.isFaild == e2?.isFaild &&
        e1?.courseName == e2?.courseName &&
        e1?.testName == e2?.testName &&
        e1?.rlTest == e2?.rlTest &&
        e1?.rlCourse == e2?.rlCourse &&
        e1?.rlUser == e2?.rlUser &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.rlLesson == e2?.rlLesson;
  }

  @override
  int hash(TestsAnswersRecord? e) => const ListEquality().hash([
        e?.user,
        e?.timeStamp,
        e?.answers,
        e?.isPass,
        e?.isFaild,
        e?.courseName,
        e?.testName,
        e?.rlTest,
        e?.rlCourse,
        e?.rlUser,
        e?.questions,
        e?.rlLesson
      ]);

  @override
  bool isValidKey(Object? o) => o is TestsAnswersRecord;
}
