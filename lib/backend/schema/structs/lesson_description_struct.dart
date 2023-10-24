// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonDescriptionStruct extends FFFirebaseStruct {
  LessonDescriptionStruct({
    String? description,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _image = image,
        super(firestoreUtilData);

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static LessonDescriptionStruct fromMap(Map<String, dynamic> data) =>
      LessonDescriptionStruct(
        description: data['description'] as String?,
        image: data['image'] as String?,
      );

  static LessonDescriptionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? LessonDescriptionStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static LessonDescriptionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LessonDescriptionStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LessonDescriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LessonDescriptionStruct &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([description, image]);
}

LessonDescriptionStruct createLessonDescriptionStruct({
  String? description,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonDescriptionStruct(
      description: description,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonDescriptionStruct? updateLessonDescriptionStruct(
  LessonDescriptionStruct? lessonDescription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonDescription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonDescriptionStructData(
  Map<String, dynamic> firestoreData,
  LessonDescriptionStruct? lessonDescription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonDescription == null) {
    return;
  }
  if (lessonDescription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonDescription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonDescriptionData =
      getLessonDescriptionFirestoreData(lessonDescription, forFieldValue);
  final nestedData =
      lessonDescriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lessonDescription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonDescriptionFirestoreData(
  LessonDescriptionStruct? lessonDescription, [
  bool forFieldValue = false,
]) {
  if (lessonDescription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonDescription.toMap());

  // Add any Firestore field values
  lessonDescription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonDescriptionListFirestoreData(
  List<LessonDescriptionStruct>? lessonDescriptions,
) =>
    lessonDescriptions
        ?.map((e) => getLessonDescriptionFirestoreData(e, true))
        .toList() ??
    [];
