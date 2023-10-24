import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubLessonsRecord extends FirestoreRecord {
  SubLessonsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rl_lessons" field.
  DocumentReference? _rlLessons;
  DocumentReference? get rlLessons => _rlLessons;
  bool hasRlLessons() => _rlLessons != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "description" field.
  List<LessonDescriptionStruct>? _description;
  List<LessonDescriptionStruct> get description => _description ?? const [];
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _rlLessons = snapshotData['rl_lessons'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
    _description = getStructList(
      snapshotData['description'],
      LessonDescriptionStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sub_lessons');

  static Stream<SubLessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubLessonsRecord.fromSnapshot(s));

  static Future<SubLessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubLessonsRecord.fromSnapshot(s));

  static SubLessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubLessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubLessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubLessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubLessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubLessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubLessonsRecordData({
  DocumentReference? rlLessons,
  String? name,
  String? type,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rl_lessons': rlLessons,
      'name': name,
      'type': type,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubLessonsRecordDocumentEquality implements Equality<SubLessonsRecord> {
  const SubLessonsRecordDocumentEquality();

  @override
  bool equals(SubLessonsRecord? e1, SubLessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rlLessons == e2?.rlLessons &&
        e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.sort == e2?.sort &&
        listEquality.equals(e1?.description, e2?.description);
  }

  @override
  int hash(SubLessonsRecord? e) => const ListEquality()
      .hash([e?.rlLessons, e?.name, e?.type, e?.sort, e?.description]);

  @override
  bool isValidKey(Object? o) => o is SubLessonsRecord;
}
