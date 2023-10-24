import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseRecord extends FirestoreRecord {
  CourseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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
      FirebaseFirestore.instance.collection('course');

  static Stream<CourseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseRecord.fromSnapshot(s));

  static Future<CourseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseRecord.fromSnapshot(s));

  static CourseRecord fromSnapshot(DocumentSnapshot snapshot) => CourseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseRecordData({
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

class CourseRecordDocumentEquality implements Equality<CourseRecord> {
  const CourseRecordDocumentEquality();

  @override
  bool equals(CourseRecord? e1, CourseRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.subname == e2?.subname &&
        e1?.image == e2?.image &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(CourseRecord? e) =>
      const ListEquality().hash([e?.name, e?.subname, e?.image, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is CourseRecord;
}
