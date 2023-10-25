import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'basic_course_model.dart';
export 'basic_course_model.dart';

class BasicCourseWidget extends StatefulWidget {
  const BasicCourseWidget({
    Key? key,
    this.currentCourse,
  }) : super(key: key);

  final CourseRow? currentCourse;

  @override
  _BasicCourseWidgetState createState() => _BasicCourseWidgetState();
}

class _BasicCourseWidgetState extends State<BasicCourseWidget> {
  late BasicCourseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BasicCourseModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Basic_Course'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF9F7F7),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 14.0,
            ),
            onPressed: () async {
              logFirebaseEvent('BASIC_COURSE_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.currentCourse?.name,
              'Базовый курс',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!FFAppState().showTests)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/Pose_0017.png',
                        width: double.infinity,
                        height: 375.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: widget.currentCourse!.name!,
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'BASIC_COURSE_PAGE_ТЕСТЫ_BTN_ON_TAP');
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().update(() {
                                      FFAppState().showTests = true;
                                    });
                                  },
                                  text: 'Тесты',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<LessonsRow>>(
                        future: LessonsTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'rl_course',
                                widget.currentCourse?.uid,
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
                          List<LessonsRow> containerLessonsRowList =
                              snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final lessons =
                                    containerLessonsRowList.toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(lessons.length,
                                      (lessonsIndex) {
                                    final lessonsItem = lessons[lessonsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 0.0),
                                      child:
                                          FutureBuilder<List<TestsAnswersRow>>(
                                        future: TestsAnswersTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'rl_user',
                                                currentUserUid,
                                              )
                                              .eq(
                                                'isPass',
                                                true,
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFoldingCube(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<TestsAnswersRow>
                                              allLessonUserAnswersTestsAnswersRowList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 6.0, 6.0, 6.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    child: ExpandablePanel(
                                                      header: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (((lessonsIndex ==
                                                                            0) &&
                                                                        (allLessonUserAnswersTestsAnswersRowList.where((e) => e.rlLesson == lessonsItem.uid).toList().length ==
                                                                            0)) ||
                                                                    ((allLessonUserAnswersTestsAnswersRowList.where((e) => e.rlLesson == lessonsItem.uid).toList().length ==
                                                                            0) &&
                                                                        (allLessonUserAnswersTestsAnswersRowList.where((e) => e.rlLesson == containerLessonsRowList[lessonsIndex - 1].uid).toList().length >
                                                                            0) &&
                                                                        (lessonsIndex >
                                                                            0)))
                                                                  Icon(
                                                                    Icons
                                                                        .lock_open,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                if ((lessonsIndex >
                                                                        0) &&
                                                                    (allLessonUserAnswersTestsAnswersRowList
                                                                            .where((e) =>
                                                                                e.rlLesson ==
                                                                                containerLessonsRowList[lessonsIndex - 1].uid)
                                                                            .toList()
                                                                            .length ==
                                                                        0))
                                                                  Icon(
                                                                    Icons
                                                                        .lock_outline,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    size: 24.0,
                                                                  ),
                                                                if (allLessonUserAnswersTestsAnswersRowList
                                                                        .where((e) =>
                                                                            e.rlLesson ==
                                                                            lessonsItem.uid)
                                                                        .toList()
                                                                        .length >
                                                                    0)
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .check,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    size: 24.0,
                                                                  ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    lessonsItem
                                                                        .name,
                                                                    'Урок без названия',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      collapsed: Container(),
                                                      expanded: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: FutureBuilder<
                                                            List<
                                                                SubLessonsRow>>(
                                                          future:
                                                              SubLessonsTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eq(
                                                                  'rl_lesson',
                                                                  lessonsItem
                                                                      .uid,
                                                                )
                                                                .order('sort',
                                                                    ascending:
                                                                        true),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitFoldingCube(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<SubLessonsRow>
                                                                columnSubLessonsRowList =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  columnSubLessonsRowList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnSubLessonsRow =
                                                                    columnSubLessonsRowList[
                                                                        columnIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'BASIC_COURSE_PAGE_Column_c0zy2336_ON_TAP');
                                                                    if ((lessonsIndex ==
                                                                            0) ||
                                                                        ((allLessonUserAnswersTestsAnswersRowList.where((e) => e.rlLesson == containerLessonsRowList[lessonsIndex - 1].uid).toList().length >
                                                                                0) &&
                                                                            (lessonsIndex >
                                                                                0))) {
                                                                      logFirebaseEvent(
                                                                          'Column_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'SubLessonsDetailsSlides',
                                                                        queryParameters:
                                                                            {
                                                                          'currentSubLesson':
                                                                              serializeParam(
                                                                            columnSubLessonsRow,
                                                                            ParamType.SupabaseRow,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 16.0, 8.0),
                                                                                child: Text(
                                                                                  columnSubLessonsRow.name!,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                        expandIcon:
                                                            Icons.chevron_right,
                                                        collapseIcon: Icons
                                                            .keyboard_arrow_down_rounded,
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                if (FFAppState().showTests)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/3d-render-smartphone-with-hand-fill-online-survey_1.png',
                        width: double.infinity,
                        height: 375.0,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'BASIC_COURSE_БАЗОВЫЙ_КУРС_BTN_ON_TAP');
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().showTests = false;
                                  });
                                },
                                text: widget.currentCourse!.name!,
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Тесты',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 56.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<TestsRow>>(
                        future: TestsTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'rl_course',
                                widget.currentCourse?.uid,
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
                          List<TestsRow> containerTestsRowList = snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final tests = containerTestsRowList.toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(tests.length, (testsIndex) {
                                    final testsItem = tests[testsIndex];
                                    return FutureBuilder<List<LessonsRow>>(
                                      future: LessonsTable().querySingleRow(
                                        queryFn: (q) => q.eq(
                                          'uid',
                                          testsItem.rlLesson,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitFoldingCube(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<LessonsRow>
                                            containerLessonsRowList =
                                            snapshot.data!;
                                        final containerLessonsRow =
                                            containerLessonsRowList.isNotEmpty
                                                ? containerLessonsRowList.first
                                                : null;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: FutureBuilder<
                                              List<TestsAnswersRow>>(
                                            future:
                                                TestsAnswersTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'rl_user',
                                                    currentUserUid,
                                                  )
                                                  .eq(
                                                    'rl_test',
                                                    containerTestsRowList[
                                                            testsIndex >= 1
                                                                ? (testsIndex -
                                                                    1)
                                                                : 0]
                                                        .uid,
                                                  ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitFoldingCube(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TestsAnswersRow>
                                                  previousLessonAnswersTestsAnswersRowList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<TestsAnswersRow>>(
                                                    future: TestsAnswersTable()
                                                        .queryRows(
                                                      queryFn: (q) => q
                                                          .eq(
                                                            'rl_user',
                                                            currentUserUid,
                                                          )
                                                          .eq(
                                                            'rl_test',
                                                            testsItem.uid,
                                                          ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitFoldingCube(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TestsAnswersRow>
                                                          currentTestAnswersTestsAnswersRowList =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'BASIC_COURSE_CurrentTestAnswers_ON_TAP');
                                                          if (((testsIndex ==
                                                                      0) &&
                                                                  (currentTestAnswersTestsAnswersRowList
                                                                          .where((e) => e
                                                                              .isPass!)
                                                                          .toList()
                                                                          .length ==
                                                                      0)) ||
                                                              ((currentTestAnswersTestsAnswersRowList.where((e) => e.isPass!).toList().length == 0) &&
                                                                  (previousLessonAnswersTestsAnswersRowList
                                                                          .where((e) => e
                                                                              .isPass!)
                                                                          .toList()
                                                                          .length >
                                                                      0) &&
                                                                  (testsIndex >
                                                                      0))) {
                                                            if (testsItem
                                                                    .name !=
                                                                FFAppState()
                                                                    .testName) {
                                                              logFirebaseEvent(
                                                                  'CurrentTestAnswers_update_app_state');
                                                              setState(() {
                                                                FFAppState()
                                                                        .testName =
                                                                    testsItem
                                                                        .name!;
                                                                FFAppState()
                                                                    .answers = [];
                                                              });
                                                            }
                                                            if (currentTestAnswersTestsAnswersRowList
                                                                    .where((e) =>
                                                                        (e.isPass ==
                                                                            false) &&
                                                                        (e.isFaild ==
                                                                            false))
                                                                    .toList()
                                                                    .length >
                                                                0) {
                                                              logFirebaseEvent(
                                                                  'CurrentTestAnswers_navigate_to');

                                                              context.pushNamed(
                                                                  'TestEnd');
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'CurrentTestAnswers_navigate_to');

                                                              context.pushNamed(
                                                                'TestsDetails',
                                                                queryParameters:
                                                                    {
                                                                  'currentTest':
                                                                      serializeParam(
                                                                    testsItem,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                  'currentCourse':
                                                                      serializeParam(
                                                                    widget
                                                                        .currentCourse,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                  'currentLesson':
                                                                      serializeParam(
                                                                    containerLessonsRow,
                                                                    ParamType
                                                                        .SupabaseRow,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          } else {
                                                            if (currentTestAnswersTestsAnswersRowList
                                                                    .where((e) =>
                                                                        e.isPass!)
                                                                    .toList()
                                                                    .length >
                                                                0) {
                                                              logFirebaseEvent(
                                                                  'CurrentTestAnswers_navigate_to');

                                                              context.pushNamed(
                                                                'TestEndSuccess',
                                                                queryParameters:
                                                                    {
                                                                  'index':
                                                                      serializeParam(
                                                                    testsIndex,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        16.0,
                                                                        15.0,
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (((testsIndex == 0) && (currentTestAnswersTestsAnswersRowList.where((e) => e.isPass!).toList().length == 0)) ||
                                                                              ((currentTestAnswersTestsAnswersRowList.where((e) => e.isPass == true).toList().length == 0) && (previousLessonAnswersTestsAnswersRowList.where((e) => e.isPass == true).toList().length > 0) && (testsIndex > 0)))
                                                                            Icon(
                                                                              Icons.lock_open,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          if ((testsIndex > 0) &&
                                                                              (previousLessonAnswersTestsAnswersRowList.where((e) => e.isPass == true).toList().length == 0))
                                                                            Icon(
                                                                              Icons.lock_outline,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                          if (currentTestAnswersTestsAnswersRowList.where((e) => e.isPass!).toList().length >
                                                                              0)
                                                                            FaIcon(
                                                                              FontAwesomeIcons.check,
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              testsItem.name,
                                                                              'Нет названия теста',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  fontSize: 16.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .chevron_right,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ],
                  ),
                if (FFAppState().userAdmin == currentUserUid)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'BASIC_COURSE_PAGE_ДЛЯ_АДМИНА_BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('Admin');
                        },
                        text: 'Для админа',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
