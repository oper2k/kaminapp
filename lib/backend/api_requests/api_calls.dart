import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start One Signal Group Code

class OneSignalGroup {
  static String baseUrl = 'https://onesignal.com/api/v1';
  static Map<String, String> headers = {
    'Authorization': 'Basic YWYzMjBlMzEtMWZmMC00MzQ0LWI1MzMtZGVhY2U4OWQ0OWQw',
    'accept': 'application/json',
    'content-type': 'application/json',
  };
  static SendNotificationsCall sendNotificationsCall = SendNotificationsCall();
}

class SendNotificationsCall {
  Future<ApiCallResponse> call({
    String? receiverId = '',
    String? heading = '',
    String? content = '',
  }) async {
    final ffApiRequestBody = '''
{
  "app_id": "4d12ee8b-b110-4afa-a165-bcc2ecacbe54",
  "include_external_user_ids": [
    "${receiverId}"
  ],
  "headings": {
    "en": "${heading}"
  },
  "contents": {
    "en": "${content}"
  },
  "ios_badgeType": "Increase",
  "ios_badgeCount": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send notifications',
      apiUrl: '${OneSignalGroup.baseUrl}/notifications',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic YWYzMjBlMzEtMWZmMC00MzQ0LWI1MzMtZGVhY2U4OWQ0OWQw',
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End One Signal Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
