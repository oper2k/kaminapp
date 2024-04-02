import '/flutter_flow/flutter_flow_util.dart';
import 'test_end_widget.dart' show TestEndWidget;
import 'package:flutter/material.dart';

class TestEndModel extends FlutterFlowModel<TestEndWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
