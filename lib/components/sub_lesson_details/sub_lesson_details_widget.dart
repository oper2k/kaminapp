import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'sub_lesson_details_model.dart';
export 'sub_lesson_details_model.dart';

class SubLessonDetailsWidget extends StatefulWidget {
  const SubLessonDetailsWidget({
    super.key,
    required this.currentLessonDescription,
  });

  final String? currentLessonDescription;

  @override
  State<SubLessonDetailsWidget> createState() => _SubLessonDetailsWidgetState();
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
