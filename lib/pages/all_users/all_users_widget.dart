import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'all_users_model.dart';
export 'all_users_model.dart';

class AllUsersWidget extends StatefulWidget {
  const AllUsersWidget({super.key});

  @override
  State<AllUsersWidget> createState() => _AllUsersWidgetState();
}

class _AllUsersWidgetState extends State<AllUsersWidget> {
  late AllUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllUsersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AllUsers'});
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
              logFirebaseEvent('ALL_USERS_PAGE_close_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Все пользователи для админа',
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
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().queryRows(
              queryFn: (q) => q.order('created_time'),
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
              List<UsersRow> listViewUsersRowList = snapshot.data!;
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  20.0,
                  0,
                  0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewUsersRowList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewUsersRow = listViewUsersRowList[listViewIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 0),
                                fadeOutDuration: const Duration(milliseconds: 0),
                                imageUrl: valueOrDefault<String>(
                                  listViewUsersRow.photoUrl,
                                  'https://zigbtihbwqghofeurmcw.supabase.co/storage/v1/object/public/kamin/users/avatars/Me.png',
                                ),
                                width: 45.0,
                                height: 45.0,
                                fit: BoxFit.cover,
                                errorWidget: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  width: 45.0,
                                  height: 45.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (listViewUsersRow.displayName != null &&
                                        listViewUsersRow.displayName != '')
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          listViewUsersRow.displayName,
                                          'Нет имени',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: const Color(0xFF112D4E),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (listViewUsersRow.email != null &&
                                            listViewUsersRow.email != '')
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  listViewUsersRow.email,
                                                  'нет емейла',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            'd  MMM y',
                                            listViewUsersRow.createdTime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          'нет даты регистрации',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Text(
                                        '${functions.thirtyMinusInt(functions.diffBetweenTwoDates(listViewUsersRow.createdTime)) < 0 ? '0' : functions.thirtyMinusInt(functions.diffBetweenTwoDates(listViewUsersRow.createdTime)).toString()} дней до финального теста',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle: FontStyle.italic,
                                            ),
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
