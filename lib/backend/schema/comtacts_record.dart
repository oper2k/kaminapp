import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComtactsRecord extends FirestoreRecord {
  ComtactsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "division" field.
  String? _division;
  String get division => _division ?? '';
  bool hasDivision() => _division != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _name = snapshotData['name'] as String?;
    _division = snapshotData['division'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comtacts');

  static Stream<ComtactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComtactsRecord.fromSnapshot(s));

  static Future<ComtactsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComtactsRecord.fromSnapshot(s));

  static ComtactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComtactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComtactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComtactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComtactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComtactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComtactsRecordData({
  String? image,
  String? name,
  String? division,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'name': name,
      'division': division,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComtactsRecordDocumentEquality implements Equality<ComtactsRecord> {
  const ComtactsRecordDocumentEquality();

  @override
  bool equals(ComtactsRecord? e1, ComtactsRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.name == e2?.name &&
        e1?.division == e2?.division &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ComtactsRecord? e) => const ListEquality()
      .hash([e?.image, e?.name, e?.division, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ComtactsRecord;
}
