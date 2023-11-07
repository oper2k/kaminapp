import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_question_text_model.dart';
export 'test_question_text_model.dart';

class TestQuestionTextWidget extends StatefulWidget {
  const TestQuestionTextWidget({
    Key? key,
    this.parameter1,
    required this.index,
    required this.testName,
  }) : super(key: key);

  final String? parameter1;
  final int? index;
  final String? testName;

  @override
  _TestQuestionTextWidgetState createState() => _TestQuestionTextWidgetState();
}

class _TestQuestionTextWidgetState extends State<TestQuestionTextWidget> {
  late TestQuestionTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestQuestionTextModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TEST_QUESTION_TEXT_test_question_text_ON');
      logFirebaseEvent('test_question_text_update_app_state');
      setState(() {
        FFAppState().currentQuestions = widget.parameter1!;
      });
    });

    _model.textController ??= TextEditingController(
        text: (widget.testName == FFAppState().testName) &&
                (FFAppState().answers.length >=
                    functions.increment(widget.index))
            ? FFAppState().answers[widget.index!]
            : '');
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    widget.parameter1!,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 100),
                              () async {
                                logFirebaseEvent(
                                    'TEST_QUESTION_TEXT_TextField_6r55iy17_ON');
                                logFirebaseEvent('TextField_update_app_state');
                                setState(() {
                                  FFAppState().currentAnswer =
                                      _model.textController.text;
                                  FFAppState().currentQuestions =
                                      widget.parameter1!;
                                });
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              logFirebaseEvent(
                                  'TEST_QUESTION_TEXT_TextField_6r55iy17_ON');
                              logFirebaseEvent('TextField_update_app_state');
                              setState(() {
                                FFAppState().currentAnswer =
                                    _model.textController.text;
                                FFAppState().currentQuestions =
                                    widget.parameter1!;
                              });
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                  ),
                              hintText: 'Напишите ответ',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x802E5896),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x802E5896),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
