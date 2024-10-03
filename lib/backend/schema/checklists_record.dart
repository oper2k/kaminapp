import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChecklistsRecord extends FirestoreRecord {
  ChecklistsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day_name" field.
  String? _dayName;
  String get dayName => _dayName ?? '';
  bool hasDayName() => _dayName != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "tasks" field.
  List<CheckListStruct>? _tasks;
  List<CheckListStruct> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  void _initializeFields() {
    _dayName = snapshotData['day_name'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
    _tasks = getStructList(
      snapshotData['tasks'],
      CheckListStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checklists');

  static Stream<ChecklistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChecklistsRecord.fromSnapshot(s));

  static Future<ChecklistsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChecklistsRecord.fromSnapshot(s));

  static ChecklistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChecklistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChecklistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChecklistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChecklistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChecklistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChecklistsRecordData({
  String? dayName,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day_name': dayName,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChecklistsRecordDocumentEquality implements Equality<ChecklistsRecord> {
  const ChecklistsRecordDocumentEquality();

  @override
  bool equals(ChecklistsRecord? e1, ChecklistsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dayName == e2?.dayName &&
        e1?.sort == e2?.sort &&
        listEquality.equals(e1?.tasks, e2?.tasks);
  }

  @override
  int hash(ChecklistsRecord? e) =>
      const ListEquality().hash([e?.dayName, e?.sort, e?.tasks]);

  @override
  bool isValidKey(Object? o) => o is ChecklistsRecord;
}
