import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/test_question_text/test_question_text_widget.dart';
import '/components/test_questions_choose/test_questions_choose_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'tests_details_model.dart';
export 'tests_details_model.dart';

class TestsDetailsWidget extends StatefulWidget {
  const TestsDetailsWidget({
    super.key,
    required this.currentTest,
    required this.currentCourse,
    required this.currentLesson,
  });

  final TestsRow? currentTest;
  final CourseRow? currentCourse;
  final LessonsRow? currentLesson;

  @override
  State<TestsDetailsWidget> createState() => _TestsDetailsWidgetState();
}

class _TestsDetailsWidgetState extends State<TestsDetailsWidget>
    with TickerProviderStateMixin {
  late TestsDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasTestQuestionsChooseTriggered = false;
  var hasTestQuestionTextTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestsDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TestsDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TESTS_DETAILS_TestsDetails_ON_INIT_STATE');
      logFirebaseEvent('TestsDetails_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('TestsDetails_widget_animation');
      if (animationsMap['testQuestionsChooseOnActionTriggerAnimation'] !=
          null) {
        safeSetState(() => hasTestQuestionsChooseTriggered = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            await animationsMap['testQuestionsChooseOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0));
      }
      logFirebaseEvent('TestsDetails_widget_animation');
      if (animationsMap['testQuestionTextOnActionTriggerAnimation'] != null) {
        safeSetState(() => hasTestQuestionTextTriggered = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            await animationsMap['testQuestionTextOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0));
      }
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'testQuestionsChooseOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'testQuestionTextOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF9F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9F7F7),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('TESTS_DETAILS_PAGE_close_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            '${widget.currentCourse?.name} / Тест',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: FutureBuilder<List<QuestionsRow>>(
              future: QuestionsTable().queryRows(
                queryFn: (q) => q
                    .eq(
                      'rl_test',
                      widget.currentTest?.uid,
                    )
                    .order('sort', ascending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitFoldingCube(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<QuestionsRow> containerQuestionsRowList = snapshot.data!;

                return Container(
                  width: 700.0,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 80.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/image_7-2.png',
                                    width: 344.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 35.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.currentTest?.name,
                                          'Нет названия теста',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Builder(
                                  builder: (context) {
                                    final questions =
                                        containerQuestionsRowList.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(questions.length,
                                          (questionsIndex) {
                                        final questionsItem =
                                            questions[questionsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((questionsIndex ==
                                                    _model.index) &&
                                                (questionsItem.type == 'выбор'))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .testQuestionsChooseModels
                                                      .getModel(
                                                    questionsItem.uid,
                                                    questionsIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      TestQuestionsChooseWidget(
                                                    key: Key(
                                                      'Key77x_${questionsItem.uid}',
                                                    ),
                                                    name:
                                                        containerQuestionsRowList[
                                                                _model.index]
                                                            .name,
                                                    testName: widget
                                                        .currentTest!.name!,
                                                    index: _model.index,
                                                    questions:
                                                        questionsItem.answers,
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'testQuestionsChooseOnActionTriggerAnimation']!,
                                                    hasBeenTriggered:
                                                        hasTestQuestionsChooseTriggered),
                                              ),
                                            if ((questionsIndex ==
                                                    _model.index) &&
                                                (questionsItem.type == 'текст'))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .testQuestionTextModels
                                                      .getModel(
                                                    questionsItem.uid,
                                                    questionsIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: TestQuestionTextWidget(
                                                    key: Key(
                                                      'Keyhjs_${questionsItem.uid}',
                                                    ),
                                                    parameter1:
                                                        questionsItem.name,
                                                    index: questionsIndex,
                                                    testName: widget
                                                        .currentTest!.name!,
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'testQuestionTextOnActionTriggerAnimation']!,
                                                    hasBeenTriggered:
                                                        hasTestQuestionTextTriggered),
                                              ),
                                          ],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation']!),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 80.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9F7F7),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (false)
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.arrow_back,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            Text(
                                              'Назад',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Flexible(
                                    child: Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TESTS_DETAILS_PAGE_Row_4vae5s9b_ON_TAP');
                                              if (containerQuestionsRowList
                                                      .length ==
                                                  functions.increment(
                                                      _model.index)) {
                                                logFirebaseEvent(
                                                    'Row_update_page_state');
                                                _model.addToAnswersList(
                                                    FFAppState().qurrentAnswer);
                                                _model.addToQuestionsList(
                                                    FFAppState()
                                                        .currentQuestion);
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Row_backend_call');
                                                _model.newAnswersCopy =
                                                    await TestsAnswersTable()
                                                        .insert({
                                                  'answers': _model.answersList,
                                                  'isPass': false,
                                                  'isFaild': false,
                                                  'course_name': widget
                                                      .currentCourse?.name,
                                                  'text_name': currentUserEmail,
                                                  'questions':
                                                      _model.questionsList,
                                                  'user': currentUserEmail,
                                                  'rl_test':
                                                      widget.currentTest?.uid,
                                                  'rl_course': widget
                                                      .currentCourse?.uid,
                                                  'rl_user': currentUserUid,
                                                  'rl_lesson': widget
                                                      .currentLesson?.uid,
                                                });
                                                logFirebaseEvent(
                                                    'Row_backend_call');
                                                await OneSignalGroup
                                                    .sendNotificationsCall
                                                    .call(
                                                  receiverId:
                                                      FFAppState().userAdmin,
                                                  heading:
                                                      'Новый тест на проверку',
                                                  content: 'Работай давай!',
                                                );

                                                logFirebaseEvent(
                                                    'Row_navigate_to');
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed('TestEnd');
                                              } else {
                                                logFirebaseEvent(
                                                    'Row_update_page_state');
                                                _model.index = _model.index + 1;
                                                _model.addToAnswersList(
                                                    FFAppState().qurrentAnswer);
                                                _model.addToQuestionsList(
                                                    FFAppState()
                                                        .currentQuestion);
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Row_widget_animation');
                                                if (animationsMap[
                                                        'testQuestionsChooseOnActionTriggerAnimation'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasTestQuestionsChooseTriggered =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'testQuestionsChooseOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                                logFirebaseEvent(
                                                    'Row_widget_animation');
                                                if (animationsMap[
                                                        'testQuestionTextOnActionTriggerAnimation'] !=
                                                    null) {
                                                  safeSetState(() =>
                                                      hasTestQuestionTextTriggered =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'testQuestionTextOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    containerQuestionsRowList
                                                                .length !=
                                                            (_model.index + 1)
                                                        ? 'Дальше'
                                                        : 'Завершить',
                                                    'Дальше',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
