import '/flutter_flow/flutter_flow_util.dart';
import 'map_t_o_widget.dart' show MapTOWidget;
import 'package:flutter/material.dart';

class MapTOModel extends FlutterFlowModel<MapTOWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
