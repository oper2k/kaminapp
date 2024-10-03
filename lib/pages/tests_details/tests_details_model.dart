import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/test_question_text/test_question_text_widget.dart';
import '/components/test_questions_choose/test_questions_choose_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tests_details_widget.dart' show TestsDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestsDetailsModel extends FlutterFlowModel<TestsDetailsWidget> {
  ///  Local state fields for this page.

  int index = 0;

  List<String> answersList = [];
  void addToAnswersList(String item) => answersList.add(item);
  void removeFromAnswersList(String item) => answersList.remove(item);
  void removeAtIndexFromAnswersList(int index) => answersList.removeAt(index);
  void insertAtIndexInAnswersList(int index, String item) =>
      answersList.insert(index, item);
  void updateAnswersListAtIndex(int index, Function(String) updateFn) =>
      answersList[index] = updateFn(answersList[index]);

  List<String> questionsList = [];
  void addToQuestionsList(String item) => questionsList.add(item);
  void removeFromQuestionsList(String item) => questionsList.remove(item);
  void removeAtIndexFromQuestionsList(int index) =>
      questionsList.removeAt(index);
  void insertAtIndexInQuestionsList(int index, String item) =>
      questionsList.insert(index, item);
  void updateQuestionsListAtIndex(int index, Function(String) updateFn) =>
      questionsList[index] = updateFn(questionsList[index]);

  ///  State fields for stateful widgets in this page.

  // Models for test_questions_choose dynamic component.
  late FlutterFlowDynamicModels<TestQuestionsChooseModel>
      testQuestionsChooseModels;
  // Models for test_question_text dynamic component.
  late FlutterFlowDynamicModels<TestQuestionTextModel> testQuestionTextModels;
  // Stores action output result for [Backend Call - Insert Row] action in Row widget.
  TestsAnswersRow? newAnswersCopy;

  @override
  void initState(BuildContext context) {
    testQuestionsChooseModels =
        FlutterFlowDynamicModels(() => TestQuestionsChooseModel());
    testQuestionTextModels =
        FlutterFlowDynamicModels(() => TestQuestionTextModel());
  }

  @override
  void dispose() {
    testQuestionsChooseModels.dispose();
    testQuestionTextModels.dispose();
  }
}
