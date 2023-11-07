import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_lessons_details_slides_model.dart';
export 'sub_lessons_details_slides_model.dart';

class SubLessonsDetailsSlidesWidget extends StatefulWidget {
  const SubLessonsDetailsSlidesWidget({
    Key? key,
    this.currentSubLesson,
  }) : super(key: key);

  final SubLessonsRow? currentSubLesson;

  @override
  _SubLessonsDetailsSlidesWidgetState createState() =>
      _SubLessonsDetailsSlidesWidgetState();
}

class _SubLessonsDetailsSlidesWidgetState
    extends State<SubLessonsDetailsSlidesWidget> {
  late SubLessonsDetailsSlidesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubLessonsDetailsSlidesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SubLessonsDetailsSlides'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('SUB_LESSONS_DETAILS_SLIDES_close_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.currentSubLesson?.name,
              'Нет названия',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: Container(
              width: 700.0,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 80.0),
                          child: Builder(
                            builder: (context) {
                              final currentDescription = widget
                                      .currentSubLesson?.descriptions
                                      ?.toList() ??
                                  [];
                              return PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(
                                            0, currentDescription.length - 1)),
                                onPageChanged: (_) async {
                                  logFirebaseEvent(
                                      'SUB_LESSONS_DETAILS_SLIDES_PageView_dx8i');
                                  logFirebaseEvent('PageView_update_app_state');
                                  setState(() {});
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: currentDescription.length,
                                itemBuilder:
                                    (context, currentDescriptionIndex) {
                                  final currentDescriptionItem =
                                      currentDescription[
                                          currentDescriptionIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: FlutterFlowWebView(
                                      content: currentDescriptionItem,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      verticalScroll: true,
                                      horizontalScroll: false,
                                      html: true,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFEDF2FA),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 3.0, 15.0, 3.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      functions
                                          .increment(
                                              _model.pageViewCurrentIndex)
                                          .toString(),
                                      '0',
                                    )}/${widget.currentSubLesson?.descriptions?.length?.toString()}',
                                    '0/0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFFB7DDF7),
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
