import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MapRecord extends FirestoreRecord {
  MapRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nameSearch" field.
  String? _nameSearch;
  String get nameSearch => _nameSearch ?? '';
  bool hasNameSearch() => _nameSearch != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _nameSearch = snapshotData['nameSearch'] as String?;
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('map');

  static Stream<MapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MapRecord.fromSnapshot(s));

  static Future<MapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MapRecord.fromSnapshot(s));

  static MapRecord fromSnapshot(DocumentSnapshot snapshot) => MapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMapRecordData({
  String? nameSearch,
  String? title,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameSearch': nameSearch,
      'title': title,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class MapRecordDocumentEquality implements Equality<MapRecord> {
  const MapRecordDocumentEquality();

  @override
  bool equals(MapRecord? e1, MapRecord? e2) {
    return e1?.nameSearch == e2?.nameSearch &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text;
  }

  @override
  int hash(MapRecord? e) =>
      const ListEquality().hash([e?.nameSearch, e?.title, e?.text]);

  @override
  bool isValidKey(Object? o) => o is MapRecord;
}
