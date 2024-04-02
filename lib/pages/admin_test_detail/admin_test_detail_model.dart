import '/flutter_flow/flutter_flow_util.dart';
import 'admin_test_detail_widget.dart' show AdminTestDetailWidget;
import 'package:flutter/material.dart';

class AdminTestDetailModel extends FlutterFlowModel<AdminTestDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
