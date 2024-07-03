import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'onboarding1_model.dart';
export 'onboarding1_model.dart';

class Onboarding1Widget extends StatefulWidget {
  const Onboarding1Widget({super.key});

  @override
  State<Onboarding1Widget> createState() => _Onboarding1WidgetState();
}

class _Onboarding1WidgetState extends State<Onboarding1Widget>
    with TickerProviderStateMixin {
  late Onboarding1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Onboarding_1'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 700.0,
            decoration: const BoxDecoration(),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: PageView(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      Image.asset(
                        'assets/images/Pose_0017.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 375.0,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 0.0),
                        child: Text(
                          'Мы очень рады, что ты присоединился к нашей команде',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Roboto',
                                color: const Color(0xFF112D4E),
                                letterSpacing: 0.0,
                                lineHeight: 1.45,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 0.0),
                        child: Text(
                          'Курс, который ты будешь изучать в течение следующих нескольких дней, поможет тебе быстро освоиться и узнать всю необходимую информацию',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                    lineHeight: 1.45,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ONBOARDING_1_PAGE_НАЧАТЬ_BTN_ON_TAP');
                            logFirebaseEvent('Button_page_view');
                            await _model.pageViewController?.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          text: 'Начать',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 56.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation1']!),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      Image.asset(
                        'assets/images/Pose_0017.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 375.0,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 0.0),
                        child: Text(
                          'Когда угодно, где угодно',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Roboto',
                                color: const Color(0xFF112D4E),
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 0.0),
                        child: Text(
                          'Учитесь с удовольствием вместе с нами, где бы вы ни находились!',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ONBOARDING_1_PAGE_НАЧАТЬ_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed('Login');
                          },
                          text: 'Начать',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 56.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation2']!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
