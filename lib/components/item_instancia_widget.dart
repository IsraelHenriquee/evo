import '/components/menu_instancia_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'item_instancia_model.dart';
export 'item_instancia_model.dart';

class ItemInstanciaWidget extends StatefulWidget {
  const ItemInstanciaWidget({
    super.key,
    String? token,
    String? nome,
    this.acaoRefesh,
  })  : token = token ?? '-',
        nome = nome ?? '-';

  final String token;
  final String nome;
  final Future Function()? acaoRefesh;

  @override
  State<ItemInstanciaWidget> createState() => _ItemInstanciaWidgetState();
}

class _ItemInstanciaWidgetState extends State<ItemInstanciaWidget> {
  late ItemInstanciaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemInstanciaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.buscarInstancia(context);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click ?? MouseCursor.defer,
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
      child: Container(
        width: double.infinity,
        height: 72.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            _model.mouseRegionHovered
                ? FlutterFlowTheme.of(context).zAPcinza
                : FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  valueOrDefault<String>(
                    '${_model.instancia?.profilePicUrl}',
                    '-',
                  ),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).zAPcinza,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.instancia?.name,
                                        '-',
                                      ).maybeHandleOverflow(
                                        maxChars: 30,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        (String ownerJid) {
                                          return ownerJid.split('@')[0];
                                        }(valueOrDefault<String>(
                                          _model.instancia?.ownerJid,
                                          '-',
                                        )),
                                        '-',
                                      ).maybeHandleOverflow(
                                        maxChars: 40,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        () {
                                          if (_model.instancia
                                                  ?.connectionStatus ==
                                              'open') {
                                            return FlutterFlowTheme.of(context)
                                                .zapBotao;
                                          } else if (_model.instancia
                                                  ?.connectionStatus ==
                                              'close') {
                                            return FlutterFlowTheme.of(context)
                                                .error;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .tertiary;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context).zapBotao,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              _model
                                                  .instancia?.connectionStatus,
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFFF2F2F2),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().appAdmin)
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showAlignedDialog(
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            isGlobal: false,
                                            avoidOverflow: false,
                                            targetAnchor: const AlignmentDirectional(
                                                    1.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                const AlignmentDirectional(-1.0, -1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: MenuInstanciaWidget(
                                                  instancia: _model.instancia!,
                                                ),
                                              );
                                            },
                                          );

                                          await _model.buscarInstancia(context);
                                          safeSetState(() {});
                                          await widget.acaoRefesh?.call();
                                        },
                                        child: Icon(
                                          Icons.more_vert,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).zAPcinza,
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
