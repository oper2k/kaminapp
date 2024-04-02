import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'map_all_model.dart';
export 'map_all_model.dart';

class MapAllWidget extends StatefulWidget {
  const MapAllWidget({super.key});

  @override
  State<MapAllWidget> createState() => _MapAllWidgetState();
}

class _MapAllWidgetState extends State<MapAllWidget> {
  late MapAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapAllModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MapAll'});
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
        backgroundColor: const Color(0xFFF9F7F7),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              logFirebaseEvent('MAP_ALL_PAGE_close_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Схема кабинетов',
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
            child: Container(
              width: 700.0,
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 998.0,
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/twqk3_.png',
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 998.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.12, -0.66),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent('MAP_ALL_PAGE_UC_ON_TAP');
                                logFirebaseEvent('UC_navigate_to');

                                context.pushNamed(
                                  'MapUC',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 61.0,
                                height: 60.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.34, -0.19),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAP_ALL_PAGE_FourthFloor_ON_TAP');
                                logFirebaseEvent('FourthFloor_navigate_to');

                                context.pushNamed(
                                  'MapFourthFloor',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 63.0,
                                height: 56.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.23, -0.35),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAP_ALL_PAGE_ThirdFloor_ON_TAP');
                                logFirebaseEvent('ThirdFloor_navigate_to');

                                context.pushNamed(
                                  'MapThirdFloor',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 62.0,
                                height: 59.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.1, -0.48),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MAP_ALL_PAGE_SecondFloor_ON_TAP');
                                logFirebaseEvent('SecondFloor_navigate_to');

                                context.pushNamed(
                                  'MapSecondFloor',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 62.0,
                                height: 61.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.57, 0.29),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent('MAP_ALL_PAGE_BO_ON_TAP');
                                logFirebaseEvent('BO_navigate_to');

                                context.pushNamed(
                                  'MapBO',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 67.0,
                                height: 82.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.46, -0.04),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent('MAP_ALL_PAGE_Sales_ON_TAP');
                                logFirebaseEvent('Sales_navigate_to');

                                context.pushNamed(
                                  'MapSales',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 76.0,
                                height: 72.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.73, 0.74),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent('MAP_ALL_PAGE_TO_ON_TAP');
                                logFirebaseEvent('TO_navigate_to');

                                context.pushNamed(
                                  'MapTO',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 95.0,
                                height: 82.0,
                                decoration: const BoxDecoration(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
