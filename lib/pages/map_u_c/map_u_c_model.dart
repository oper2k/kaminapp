import '/flutter_flow/flutter_flow_util.dart';
import 'map_u_c_widget.dart' show MapUCWidget;
import 'package:flutter/material.dart';

class MapUCModel extends FlutterFlowModel<MapUCWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
