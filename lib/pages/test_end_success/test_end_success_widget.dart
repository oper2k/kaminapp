import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_end_success_model.dart';
export 'test_end_success_model.dart';

class TestEndSuccessWidget extends StatefulWidget {
  const TestEndSuccessWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int? index;

  @override
  _TestEndSuccessWidgetState createState() => _TestEndSuccessWidgetState();
}

class _TestEndSuccessWidgetState extends State<TestEndSuccessWidget> {
  late TestEndSuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestEndSuccessModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TestEndSuccess'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 14.0,
            ),
            onPressed: () async {
              logFirebaseEvent('TEST_END_SUCCESS_PAGE_close_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Тест',
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                if (widget.index != 3) {
                  return Image.asset(
                    'assets/images/5241346_1.png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 375.0,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Image.asset(
                    'assets/images/5241346_1-2.png',
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 375.0,
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(36.0, 24.0, 36.0, 0.0),
              child: Text(
                () {
                  if (widget.index == 0) {
                    return 'Отличный старт!';
                  } else if (widget.index == 1) {
                    return 'Настоящие герои  не носят плащи';
                  } else if (widget.index == 2) {
                    return 'Вот это класс!';
                  } else if (widget.index == 3) {
                    return 'Поздравляем, ты успешно сдал финальный тест!';
                  } else {
                    return 'Поздравляем, ты успешно сдал финальный тест!';
                  }
                }(),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Roboto',
                      color: Color(0xFF112D4E),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(36.0, 24.0, 36.0, 0.0),
              child: Text(
                () {
                  if (widget.index == 0) {
                    return 'Продолжай в том же духе =)';
                  } else if (widget.index == 1) {
                    return 'Ты одолел половину пути, так держать!';
                  } else if (widget.index == 2) {
                    return 'Не останавливайся, ты почти у цели!';
                  } else if (widget.index == 3) {
                    return 'Обратись в Службу персонала, мы расскажем, что тебе делать дальше =)';
                  } else {
                    return 'Обратись в Службу персонала, мы расскажем, что тебе делать дальше =)';
                  }
                }(),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('TEST_END_SUCCESS_PAGE__BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_back');
                  context.safePop();
                },
                text: '',
                icon: Icon(
                  Icons.arrow_forward,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  width: 60.0,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
