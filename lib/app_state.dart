import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _showTests = prefs.getBool('ff_showTests') ?? _showTests;
    });
    _safeInit(() {
      _testName = prefs.getString('ff_testName') ?? _testName;
    });
    _safeInit(() {
      _userAdmin = prefs.getString('ff_userAdmin') ?? _userAdmin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showTests = false;
  bool get showTests => _showTests;
  set showTests(bool value) {
    _showTests = value;
    prefs.setBool('ff_showTests', value);
  }

  String _testName = '';
  String get testName => _testName;
  set testName(String value) {
    _testName = value;
    prefs.setString('ff_testName', value);
  }

  String _userAdmin = '31063527-d2f8-4dd1-8d5a-ed6cad7babd2';
  String get userAdmin => _userAdmin;
  set userAdmin(String value) {
    _userAdmin = value;
    prefs.setString('ff_userAdmin', value);
  }

  String _currentQuestion = '';
  String get currentQuestion => _currentQuestion;
  set currentQuestion(String value) {
    _currentQuestion = value;
  }

  String _qurrentAnswer = '';
  String get qurrentAnswer => _qurrentAnswer;
  set qurrentAnswer(String value) {
    _qurrentAnswer = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
