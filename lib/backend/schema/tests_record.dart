import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestsRecord extends FirestoreRecord {
  TestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "questions" field.
  List<TestQuestionsStruct>? _questions;
  List<TestQuestionsStruct> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "rl_course" field.
  DocumentReference? _rlCourse;
  DocumentReference? get rlCourse => _rlCourse;
  bool hasRlCourse() => _rlCourse != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "rl_users_pass" field.
  List<DocumentReference>? _rlUsersPass;
  List<DocumentReference> get rlUsersPass => _rlUsersPass ?? const [];
  bool hasRlUsersPass() => _rlUsersPass != null;

  // "rl_users_wait" field.
  List<DocumentReference>? _rlUsersWait;
  List<DocumentReference> get rlUsersWait => _rlUsersWait ?? const [];
  bool hasRlUsersWait() => _rlUsersWait != null;

  // "rl_lesson" field.
  DocumentReference? _rlLesson;
  DocumentReference? get rlLesson => _rlLesson;
  bool hasRlLesson() => _rlLesson != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _questions = getStructList(
      snapshotData['questions'],
      TestQuestionsStruct.fromMap,
    );
    _rlCourse = snapshotData['rl_course'] as DocumentReference?;
    _sort = castToType<int>(snapshotData['sort']);
    _rlUsersPass = getDataList(snapshotData['rl_users_pass']);
    _rlUsersWait = getDataList(snapshotData['rl_users_wait']);
    _rlLesson = snapshotData['rl_lesson'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestsRecord.fromSnapshot(s));

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestsRecord.fromSnapshot(s));

  static TestsRecord fromSnapshot(DocumentSnapshot snapshot) => TestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestsRecordData({
  String? name,
  DocumentReference? rlCourse,
  int? sort,
  DocumentReference? rlLesson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'rl_course': rlCourse,
      'sort': sort,
      'rl_lesson': rlLesson,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestsRecordDocumentEquality implements Equality<TestsRecord> {
  const TestsRecordDocumentEquality();

  @override
  bool equals(TestsRecord? e1, TestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.rlCourse == e2?.rlCourse &&
        e1?.sort == e2?.sort &&
        listEquality.equals(e1?.rlUsersPass, e2?.rlUsersPass) &&
        listEquality.equals(e1?.rlUsersWait, e2?.rlUsersWait) &&
        e1?.rlLesson == e2?.rlLesson;
  }

  @override
  int hash(TestsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.questions,
        e?.rlCourse,
        e?.sort,
        e?.rlUsersPass,
        e?.rlUsersWait,
        e?.rlLesson
      ]);

  @override
  bool isValidKey(Object? o) => o is TestsRecord;
}
