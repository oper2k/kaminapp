import '/flutter_flow/flutter_flow_util.dart';
import 'test_question_text_widget.dart' show TestQuestionTextWidget;
import 'package:flutter/material.dart';

class TestQuestionTextModel extends FlutterFlowModel<TestQuestionTextWidget> {
  ///  Local state fields for this component.

  String? userAnswer;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
