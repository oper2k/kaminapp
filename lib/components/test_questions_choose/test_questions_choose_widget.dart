import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_questions_choose_model.dart';
export 'test_questions_choose_model.dart';

class TestQuestionsChooseWidget extends StatefulWidget {
  const TestQuestionsChooseWidget({
    Key? key,
    this.name,
    this.questions,
    required this.testName,
    required this.index,
  }) : super(key: key);

  final String? name;
  final List<String>? questions;
  final String? testName;
  final int? index;

  @override
  _TestQuestionsChooseWidgetState createState() =>
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TEST_QUESTIONS_CHOOSE_test_questions_cho');
      logFirebaseEvent('test_questions_choose_update_app_state');
      setState(() {
        FFAppState().currentQuestions = widget.name!;
      });
    });
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
      alignment: AlignmentDirectional(0.00, -1.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final questions = widget.questions?.toList() ?? [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(questions.length, (questionsIndex) {
                      final questionsItem = questions[questionsIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Builder(
                              builder: (context) {
                                if (() {
                                  if (questionsItem ==
                                      FFAppState().currentAnswer) {
                                    return false;
                                  } else if (((widget.testName ==
                                                  FFAppState().testName) &&
                                              (FFAppState().answers.length >=
                                                  functions
                                                      .increment(widget.index))
                                          ? FFAppState().answers[widget.index!]
                                          : '') ==
                                      questionsItem) {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                }()) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'TEST_QUESTIONS_CHOOSE_Icon_njgk4i3t_ON_T');
                                      if (FFAppState().answers.length >=
                                          functions.increment(widget.index)) {
                                        logFirebaseEvent(
                                            'Icon_update_app_state');
                                        setState(() {
                                          FFAppState().currentAnswer =
                                              questionsItem;
                                        });
                                        logFirebaseEvent(
                                            'Icon_update_app_state');
                                        _model.updatePage(() {
                                          FFAppState().updateAnswersAtIndex(
                                            widget.index!,
                                            (_) => FFAppState().currentAnswer,
                                          );
                                          FFAppState().updateQuestionsAtIndex(
                                            widget.index!,
                                            (_) =>
                                                FFAppState().currentQuestions,
                                          );
                                        });
                                      } else {
                                        logFirebaseEvent(
                                            'Icon_update_app_state');
                                        setState(() {
                                          FFAppState().currentAnswer =
                                              questionsItem;
                                        });
                                        logFirebaseEvent(
                                            'Icon_update_app_state');
                                        _model.updatePage(() {
                                          FFAppState().addToAnswers(
                                              FFAppState().currentAnswer);
                                          FFAppState().addToQuestions(
                                              FFAppState().currentQuestions);
                                        });
                                      }
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  questionsItem,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).divide(SizedBox(height: 12.0)),
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
