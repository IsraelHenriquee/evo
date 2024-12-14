import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/qrcode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'menu_instancia_model.dart';
export 'menu_instancia_model.dart';

class MenuInstanciaWidget extends StatefulWidget {
  const MenuInstanciaWidget({
    super.key,
    required this.instancia,
  });

  final InstanciaStruct? instancia;

  @override
  State<MenuInstanciaWidget> createState() => _MenuInstanciaWidgetState();
}

class _MenuInstanciaWidgetState extends State<MenuInstanciaWidget> {
  late MenuInstanciaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuInstanciaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
              }),
              child: Visibility(
                visible: widget.instancia?.connectionStatus != 'open',
                child: Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: QrcodeWidget(
                              token: widget.instancia!.token,
                              instance: widget.instancia!.name,
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.mouseRegionHovered1
                              ? FlutterFlowTheme.of(context).zAPcinza
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.qr_code,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Text(
                              'Conectar',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = false);
              }),
              child: Visibility(
                visible: widget.instancia?.connectionStatus == 'open',
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.outDesconect =
                        await InstancesGroup.instanceLogoutCall.call(
                      token: widget.instancia?.token,
                      instance: widget.instancia?.name,
                    );

                    if ((_model.outDesconect?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Instancia desconectada',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Houve um erro: ${(_model.outDesconect?.jsonBody ?? '').toString()}',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    Navigator.pop(context);

                    safeSetState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.mouseRegionHovered2
                            ? FlutterFlowTheme.of(context).zAPcinza
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.wifi_off_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Text(
                            'Desconectar',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = false);
              }),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.outDelete =
                      await InstancesGroup.instanceDeleteCall.call(
                    token: widget.instancia?.token,
                    instance: widget.instancia?.name,
                  );

                  if ((_model.outDelete?.succeeded ?? true)) {
                    await InstanciasTable().delete(
                      matchingRows: (rows) => rows
                          .eqOrNull(
                            'token',
                            widget.instancia?.token,
                          )
                          .eqOrNull(
                            'nome',
                            widget.instancia?.name,
                          ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Instancia deletada',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Erro ao deletar: ${(_model.outDelete?.jsonBody ?? '').toString()}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  Navigator.pop(context);

                  safeSetState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.mouseRegionHovered3
                          ? FlutterFlowTheme.of(context).zAPcinza
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.delete_sweep,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Text(
                          'Deletar',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
