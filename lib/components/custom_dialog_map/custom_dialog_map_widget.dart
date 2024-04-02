import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'custom_dialog_map_model.dart';
export 'custom_dialog_map_model.dart';

class CustomDialogMapWidget extends StatefulWidget {
  const CustomDialogMapWidget({
    super.key,
    required this.nameSearch,
  });

  final String? nameSearch;

  @override
  State<CustomDialogMapWidget> createState() => _CustomDialogMapWidgetState();
}

class _CustomDialogMapWidgetState extends State<CustomDialogMapWidget> {
  late CustomDialogMapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomDialogMapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MapRow>>(
      future: MapTable().querySingleRow(
        queryFn: (q) => q.eq(
          'nameSearch',
          widget.nameSearch,
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
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<MapRow> containerMapRowList = snapshot.data!;
        final containerMapRow =
            containerMapRowList.isNotEmpty ? containerMapRowList.first : null;
        return Material(
          color: Colors.transparent,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 150.0,
              maxWidth: 250.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: const Color(0xFF3F72AF),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          containerMapRow!.title!,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        if (containerMapRow.text != null &&
                            containerMapRow.text != '')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 14.0, 0.0, 0.0),
                            child: Text(
                              containerMapRow.text!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'CUSTOM_DIALOG_MAP_Icon_xagjc74h_ON_TAP');
                      logFirebaseEvent('Icon_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
