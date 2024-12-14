import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'item_conversa_model.dart';
export 'item_conversa_model.dart';

class ItemConversaWidget extends StatefulWidget {
  const ItemConversaWidget({
    super.key,
    required this.conversa,
  });

  final ConversasStruct? conversa;

  @override
  State<ItemConversaWidget> createState() => _ItemConversaWidgetState();
}

class _ItemConversaWidgetState extends State<ItemConversaWidget> {
  late ItemConversaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemConversaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!widget.conversa!.atualizado) {
        if (widget.conversa!.isgroup) {
          _model.outGrupo = await InstancesGroup.groupFindByJIDCall.call(
            groupJid: widget.conversa?.remotejid,
            token: widget.conversa?.apikey,
            instance: widget.conversa?.instance,
          );

          if ((_model.outGrupo?.succeeded ?? true)) {
            _model.titulo = valueOrDefault<String>(
              InstancesGroup.groupFindByJIDCall.nomeGrupo(
                (_model.outGrupo?.jsonBody ?? ''),
              ),
              '-',
            );
            _model.foto = valueOrDefault<String>(
              InstancesGroup.groupFindByJIDCall.foto(
                (_model.outGrupo?.jsonBody ?? ''),
              ),
              '-',
            );
            safeSetState(() {});
          }
        } else {
          _model.outFoto =
              await InstancesGroup.chatFetchProfilePictureURLCall.call(
            number: widget.conversa?.remotejid,
            token: widget.conversa?.apikey,
            instance: widget.conversa?.instance,
          );

          if ((_model.outFoto?.succeeded ?? true)) {
            _model.foto = valueOrDefault<String>(
              InstancesGroup.chatFetchProfilePictureURLCall.foto(
                (_model.outFoto?.jsonBody ?? ''),
              ),
              '-',
            );
            safeSetState(() {});
          }
          while (_model.contador! < FFAppState().appLastSender.length) {
            if (FFAppState()
                    .appLastSender
                    .elementAtOrNull(_model.contador!)
                    ?.remotejid ==
                widget.conversa?.remotejid) {
              // Atualiza Push Name
              _model.titulo = FFAppState()
                  .appLastSender
                  .elementAtOrNull(_model.contador!)!
                  .pushname;
              safeSetState(() {});
              break;
            } else {
              _model.contador = _model.contador! + 1;
              safeSetState(() {});
            }
          }
          if (_model.contador == FFAppState().appLastSender.length) {
            _model.titulo = (String remoteJid) {
              return remoteJid.split('@')[0];
            }(widget.conversa!.remotejid);
            safeSetState(() {});
          }
        }

        // Resetar Contador
        _model.contador = 0;
        safeSetState(() {});
        while (_model.contador! < FFAppState().appConversas.length) {
          if (FFAppState()
                  .appConversas
                  .elementAtOrNull(_model.contador!)
                  ?.remotejid ==
              widget.conversa?.remotejid) {
            FFAppState().updateAppConversasAtIndex(
              _model.contador!,
              (e) => e
                ..atualizado = true
                ..titulo = _model.titulo
                ..foto = _model.foto,
            );
            return;
          } else {
            _model.contador = _model.contador! + 1;
            safeSetState(() {});
          }
        }
      }
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
                  '${widget.conversa?.foto}',
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
                                        widget.conversa?.titulo,
                                        'Carregando...',
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
                                  Text(
                                    dateTimeFormat(
                                        "d/M H:mm",
                                        dateTimeFromSecondsSinceEpoch(
                                            valueOrDefault<int>(
                                          widget.conversa?.messagetimestamp,
                                          0,
                                        ))),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
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
                                        widget.conversa?.messagetype ==
                                                'conversation'
                                            ? widget.conversa?.conversation
                                            : valueOrDefault<String>(
                                                functions.getMessagePreview(
                                                    widget
                                                        .conversa!.messagetype),
                                                '-',
                                              ),
                                        'Carregando...',
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
                                ],
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
