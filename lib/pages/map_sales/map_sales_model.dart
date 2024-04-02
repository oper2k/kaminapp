import '/flutter_flow/flutter_flow_util.dart';
import 'map_sales_widget.dart' show MapSalesWidget;
import 'package:flutter/material.dart';

class MapSalesModel extends FlutterFlowModel<MapSalesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
