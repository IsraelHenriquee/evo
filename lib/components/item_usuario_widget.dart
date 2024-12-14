import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'item_usuario_model.dart';
export 'item_usuario_model.dart';

class ItemUsuarioWidget extends StatefulWidget {
  const ItemUsuarioWidget({
    super.key,
    String? nome,
    String? departamento,
  })  : nome = nome ?? '-',
        departamento = departamento ?? '-';

  final String nome;
  final String departamento;

  @override
  State<ItemUsuarioWidget> createState() => _ItemUsuarioWidgetState();
}

class _ItemUsuarioWidgetState extends State<ItemUsuarioWidget> {
  late ItemUsuarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemUsuarioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/evolutionapi-3kp94h/assets/puxflfyvt7td/perfil_zap.png',
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
                                      widget.nome.maybeHandleOverflow(
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
                                      widget.departamento.maybeHandleOverflow(
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
