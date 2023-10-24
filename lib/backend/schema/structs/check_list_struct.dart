// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckListStruct extends FFFirebaseStruct {
  CheckListStruct({
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static CheckListStruct fromMap(Map<String, dynamic> data) => CheckListStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static CheckListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CheckListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheckListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheckListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckListStruct &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([name, description]);
}

CheckListStruct createCheckListStruct({
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckListStruct(
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckListStruct? updateCheckListStruct(
  CheckListStruct? checkList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckListStructData(
  Map<String, dynamic> firestoreData,
  CheckListStruct? checkList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkList == null) {
    return;
  }
  if (checkList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkListData = getCheckListFirestoreData(checkList, forFieldValue);
  final nestedData = checkListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckListFirestoreData(
  CheckListStruct? checkList, [
  bool forFieldValue = false,
]) {
  if (checkList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkList.toMap());

  // Add any Firestore field values
  checkList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckListListFirestoreData(
  List<CheckListStruct>? checkLists,
) =>
    checkLists?.map((e) => getCheckListFirestoreData(e, true)).toList() ?? [];
