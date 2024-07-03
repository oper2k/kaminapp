import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "rl_user_client" field.
  DocumentReference? _rlUserClient;
  DocumentReference? get rlUserClient => _rlUserClient;
  bool hasRlUserClient() => _rlUserClient != null;

  // "rl_user_admin" field.
  DocumentReference? _rlUserAdmin;
  DocumentReference? get rlUserAdmin => _rlUserAdmin;
  bool hasRlUserAdmin() => _rlUserAdmin != null;

  // "rl_user_see_last_message" field.
  List<DocumentReference>? _rlUserSeeLastMessage;
  List<DocumentReference> get rlUserSeeLastMessage =>
      _rlUserSeeLastMessage ?? const [];
  bool hasRlUserSeeLastMessage() => _rlUserSeeLastMessage != null;

  // "timestamp_last_message" field.
  DateTime? _timestampLastMessage;
  DateTime? get timestampLastMessage => _timestampLastMessage;
  bool hasTimestampLastMessage() => _timestampLastMessage != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _lastMessage = snapshotData['last_message'] as String?;
    _rlUserClient = snapshotData['rl_user_client'] as DocumentReference?;
    _rlUserAdmin = snapshotData['rl_user_admin'] as DocumentReference?;
    _rlUserSeeLastMessage =
        getDataList(snapshotData['rl_user_see_last_message']);
    _timestampLastMessage = snapshotData['timestamp_last_message'] as DateTime?;
    _users = getDataList(snapshotData['users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? name,
  String? lastMessage,
  DocumentReference? rlUserClient,
  DocumentReference? rlUserAdmin,
  DateTime? timestampLastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'last_message': lastMessage,
      'rl_user_client': rlUserClient,
      'rl_user_admin': rlUserAdmin,
      'timestamp_last_message': timestampLastMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.rlUserClient == e2?.rlUserClient &&
        e1?.rlUserAdmin == e2?.rlUserAdmin &&
        listEquality.equals(
            e1?.rlUserSeeLastMessage, e2?.rlUserSeeLastMessage) &&
        e1?.timestampLastMessage == e2?.timestampLastMessage &&
        listEquality.equals(e1?.users, e2?.users);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.lastMessage,
        e?.rlUserClient,
        e?.rlUserAdmin,
        e?.rlUserSeeLastMessage,
        e?.timestampLastMessage,
        e?.users
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
