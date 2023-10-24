import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/test_question_text/test_question_text_widget.dart';
import '/components/test_questions_choose/test_questions_choose_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tests_details_widget.dart' show TestsDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestsDetailsModel extends FlutterFlowModel<TestsDetailsWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for test_questions_choose dynamic component.
  late FlutterFlowDynamicModels<TestQuestionsChooseModel>
      testQuestionsChooseModels;
  // Models for test_question_text dynamic component.
  late FlutterFlowDynamicModels<TestQuestionTextModel> testQuestionTextModels;
  // Stores action output result for [Backend Call - Insert Row] action in Row widget.
  TestsAnswersRow? newAnswersCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    testQuestionsChooseModels =
        FlutterFlowDynamicModels(() => TestQuestionsChooseModel());
    testQuestionTextModels =
        FlutterFlowDynamicModels(() => TestQuestionTextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    testQuestionsChooseModels.dispose();
    testQuestionTextModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
