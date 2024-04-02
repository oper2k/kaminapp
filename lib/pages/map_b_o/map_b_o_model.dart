import '/flutter_flow/flutter_flow_util.dart';
import 'map_b_o_widget.dart' show MapBOWidget;
import 'package:flutter/material.dart';

class MapBOModel extends FlutterFlowModel<MapBOWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
