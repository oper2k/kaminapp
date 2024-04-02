import '/flutter_flow/flutter_flow_util.dart';
import 'basic_course_widget.dart' show BasicCourseWidget;
import 'package:flutter/material.dart';

class BasicCourseModel extends FlutterFlowModel<BasicCourseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
