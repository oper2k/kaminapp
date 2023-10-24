// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestQuestionsStruct extends FFFirebaseStruct {
  TestQuestionsStruct({
    String? name,
    List<String>? chooseAnswers,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _chooseAnswers = chooseAnswers,
        _type = type,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "chooseAnswers" field.
  List<String>? _chooseAnswers;
  List<String> get chooseAnswers => _chooseAnswers ?? const [];
  set chooseAnswers(List<String>? val) => _chooseAnswers = val;
  void updateChooseAnswers(Function(List<String>) updateFn) =>
      updateFn(_chooseAnswers ??= []);
  bool hasChooseAnswers() => _chooseAnswers != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static TestQuestionsStruct fromMap(Map<String, dynamic> data) =>
      TestQuestionsStruct(
        name: data['name'] as String?,
        chooseAnswers: getDataList(data['chooseAnswers']),
        type: data['type'] as String?,
      );

  static TestQuestionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TestQuestionsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'chooseAnswers': _chooseAnswers,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'chooseAnswers': serializeParam(
          _chooseAnswers,
          ParamType.String,
          true,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestQuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestQuestionsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        chooseAnswers: deserializeParam<String>(
          data['chooseAnswers'],
          ParamType.String,
          true,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestQuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TestQuestionsStruct &&
        name == other.name &&
        listEquality.equals(chooseAnswers, other.chooseAnswers) &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([name, chooseAnswers, type]);
}

TestQuestionsStruct createTestQuestionsStruct({
  String? name,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestQuestionsStruct(
      name: name,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestQuestionsStruct? updateTestQuestionsStruct(
  TestQuestionsStruct? testQuestions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    testQuestions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestQuestionsStructData(
  Map<String, dynamic> firestoreData,
  TestQuestionsStruct? testQuestions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testQuestions == null) {
    return;
  }
  if (testQuestions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && testQuestions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testQuestionsData =
      getTestQuestionsFirestoreData(testQuestions, forFieldValue);
  final nestedData =
      testQuestionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = testQuestions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestQuestionsFirestoreData(
  TestQuestionsStruct? testQuestions, [
  bool forFieldValue = false,
]) {
  if (testQuestions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testQuestions.toMap());

  // Add any Firestore field values
  testQuestions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestQuestionsListFirestoreData(
  List<TestQuestionsStruct>? testQuestionss,
) =>
    testQuestionss
        ?.map((e) => getTestQuestionsFirestoreData(e, true))
        .toList() ??
    [];
