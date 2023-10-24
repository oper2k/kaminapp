import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int increment(int? integer) {
  // Add your function code here!
  return (integer ?? 0) + 1;
}

dynamic removeStringFromList(
  List<String> textList,
  String text,
) {
  return textList.where((item) => item != text).toList();
}

List<DocumentReference> converUserToListUsers(DocumentReference user) {
  List<DocumentReference> users = [];
  users.add(user);
  return users;
}

List<int> progress() {
  List<int> numbers = [];
  for (int i = 0; i <= 29; i++) {
    numbers.add(i);
  }
  return numbers;
}

int diffBetweenTwoDates(DateTime? userCreateDate) {
  final difference =
      DateTime.now().difference((userCreateDate ?? DateTime.now())).inDays;
  return difference - 1;
}

int thirtyMinusInt(int number) {
  return 30 - number;
}

dynamic appendListToListString(
  List<String>? textList,
  String text,
) {
  if (textList != null) {
    textList.add(text);
    return textList;
  } else
    return ["$text"];
}
