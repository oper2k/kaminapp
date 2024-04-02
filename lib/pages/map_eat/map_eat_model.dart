import '/flutter_flow/flutter_flow_util.dart';
import 'map_eat_widget.dart' show MapEatWidget;
import 'package:flutter/material.dart';

class MapEatModel extends FlutterFlowModel<MapEatWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
