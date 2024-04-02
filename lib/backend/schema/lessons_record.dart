import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "rl_course" field.
  DocumentReference? _rlCourse;
  DocumentReference? get rlCourse => _rlCourse;
  bool hasRlCourse() => _rlCourse != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "rl_user_pass" field.
  List<DocumentReference>? _rlUserPass;
  List<DocumentReference> get rlUserPass => _rlUserPass ?? const [];
  bool hasRlUserPass() => _rlUserPass != null;

  void _initializeFields() {
    _rlCourse = snapshotData['rl_course'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
    _rlUserPass = getDataList(snapshotData['rl_user_pass']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lessons');

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  DocumentReference? rlCourse,
  String? name,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rl_course': rlCourse,
      'name': name,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rlCourse == e2?.rlCourse &&
        e1?.name == e2?.name &&
        e1?.sort == e2?.sort &&
        listEquality.equals(e1?.rlUserPass, e2?.rlUserPass);
  }

  @override
  int hash(LessonsRecord? e) =>
      const ListEquality().hash([e?.rlCourse, e?.name, e?.sort, e?.rlUserPass]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
