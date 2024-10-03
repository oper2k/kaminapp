import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'test_questions_choose_model.dart';
export 'test_questions_choose_model.dart';

class TestQuestionsChooseWidget extends StatefulWidget {
  const TestQuestionsChooseWidget({
    super.key,
    this.name,
    this.questions,
    required this.testName,
    required this.index,
  });

  final String? name;
  final List<String>? questions;
  final String? testName;
  final int? index;

  @override
  State<TestQuestionsChooseWidget> createState() =>
      _TestQuestionsChooseWidgetState();
}

class _TestQuestionsChooseWidgetState extends State<TestQuestionsChooseWidget> {
  late TestQuestionsChooseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestQuestionsChooseModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    widget.name!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final questions = widget.questions?.toList() ?? [];

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(questions.length, (questionsIndex) {
                      final questionsItem = questions[questionsIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Builder(
                              builder: (context) {
                                if (questionsItem == FFAppState().qurrentAnswer
                                    ? false
                                    : true) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'TEST_QUESTIONS_CHOOSE_Icon_njgk4i3t_ON_T');
                                      logFirebaseEvent('Icon_update_app_state');
                                      FFAppState().currentQuestion =
                                          widget.name!;
                                      FFAppState().qurrentAnswer =
                                          questionsItem;
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.radio_button_off,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  );
                                } else {
                                  return Icon(
                                    Icons.radio_button_checked,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 22.0,
                                  );
                                }
                              },
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  questionsItem,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).divide(const SizedBox(height: 12.0)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
