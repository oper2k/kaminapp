import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_lesson_details_model.dart';
export 'sub_lesson_details_model.dart';

class SubLessonDetailsWidget extends StatefulWidget {
  const SubLessonDetailsWidget({
    Key? key,
    required this.currentLessonDescription,
  }) : super(key: key);

  final String? currentLessonDescription;

  @override
  _SubLessonDetailsWidgetState createState() => _SubLessonDetailsWidgetState();
}

class _SubLessonDetailsWidgetState extends State<SubLessonDetailsWidget> {
  late SubLessonDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubLessonDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlutterFlowWebView(
          content: widget.currentLessonDescription!,
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          verticalScroll: true,
          horizontalScroll: false,
          html: true,
        ),
      ],
    );
  }
}
