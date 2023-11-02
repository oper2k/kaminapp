import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _answers = prefs.getStringList('ff_answers') ?? _answers;
    });
    _safeInit(() {
      _currentAnswer = prefs.getString('ff_currentAnswer') ?? _currentAnswer;
    });
    _safeInit(() {
      _questions = prefs.getStringList('ff_questions') ?? _questions;
    });
    _safeInit(() {
      _currentQuestions =
          prefs.getString('ff_currentQuestions') ?? _currentQuestions;
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
  set showTests(bool _value) {
    _showTests = _value;
    prefs.setBool('ff_showTests', _value);
  }

  String _testName = '';
  String get testName => _testName;
  set testName(String _value) {
    _testName = _value;
    prefs.setString('ff_testName', _value);
  }

  List<String> _answers = [];
  List<String> get answers => _answers;
  set answers(List<String> _value) {
    _answers = _value;
    prefs.setStringList('ff_answers', _value);
  }

  void addToAnswers(String _value) {
    _answers.add(_value);
    prefs.setStringList('ff_answers', _answers);
  }

  void removeFromAnswers(String _value) {
    _answers.remove(_value);
    prefs.setStringList('ff_answers', _answers);
  }

  void removeAtIndexFromAnswers(int _index) {
    _answers.removeAt(_index);
    prefs.setStringList('ff_answers', _answers);
  }

  void updateAnswersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _answers[_index] = updateFn(_answers[_index]);
    prefs.setStringList('ff_answers', _answers);
  }

  void insertAtIndexInAnswers(int _index, String _value) {
    _answers.insert(_index, _value);
    prefs.setStringList('ff_answers', _answers);
  }

  String _currentAnswer = '';
  String get currentAnswer => _currentAnswer;
  set currentAnswer(String _value) {
    _currentAnswer = _value;
    prefs.setString('ff_currentAnswer', _value);
  }

  List<String> _questions = [];
  List<String> get questions => _questions;
  set questions(List<String> _value) {
    _questions = _value;
    prefs.setStringList('ff_questions', _value);
  }

  void addToQuestions(String _value) {
    _questions.add(_value);
    prefs.setStringList('ff_questions', _questions);
  }

  void removeFromQuestions(String _value) {
    _questions.remove(_value);
    prefs.setStringList('ff_questions', _questions);
  }

  void removeAtIndexFromQuestions(int _index) {
    _questions.removeAt(_index);
    prefs.setStringList('ff_questions', _questions);
  }

  void updateQuestionsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _questions[_index] = updateFn(_questions[_index]);
    prefs.setStringList('ff_questions', _questions);
  }

  void insertAtIndexInQuestions(int _index, String _value) {
    _questions.insert(_index, _value);
    prefs.setStringList('ff_questions', _questions);
  }

  String _currentQuestions = '';
  String get currentQuestions => _currentQuestions;
  set currentQuestions(String _value) {
    _currentQuestions = _value;
    prefs.setString('ff_currentQuestions', _value);
  }

  String _userAdmin = '31063527-d2f8-4dd1-8d5a-ed6cad7babd2';
  String get userAdmin => _userAdmin;
  set userAdmin(String _value) {
    _userAdmin = _value;
    prefs.setString('ff_userAdmin', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
