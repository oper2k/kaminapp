import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DictRecord extends FirestoreRecord {
  DictRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "subname" field.
  String? _subname;
  String get subname => _subname ?? '';
  bool hasSubname() => _subname != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _subname = snapshotData['subname'] as String?;
    _image = snapshotData['image'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dict');

  static Stream<DictRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DictRecord.fromSnapshot(s));

  static Future<DictRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DictRecord.fromSnapshot(s));

  static DictRecord fromSnapshot(DocumentSnapshot snapshot) => DictRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DictRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DictRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DictRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DictRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDictRecordData({
  String? name,
  String? subname,
  String? image,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'subname': subname,
      'image': image,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class DictRecordDocumentEquality implements Equality<DictRecord> {
  const DictRecordDocumentEquality();

  @override
  bool equals(DictRecord? e1, DictRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.subname == e2?.subname &&
        e1?.image == e2?.image &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(DictRecord? e) =>
      const ListEquality().hash([e?.name, e?.subname, e?.image, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is DictRecord;
}
