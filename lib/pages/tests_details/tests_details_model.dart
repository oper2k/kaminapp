import '/backend/supabase/supabase.dart';
import '/components/test_question_text/test_question_text_widget.dart';
import '/components/test_questions_choose/test_questions_choose_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tests_details_widget.dart' show TestsDetailsWidget;
import 'package:flutter/material.dart';

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

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    testQuestionsChooseModels.dispose();
    testQuestionTextModels.dispose();
  }
}
