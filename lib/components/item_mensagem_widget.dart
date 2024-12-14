import '/backend/schema/structs/index.dart';
import '/components/item_audio_widget.dart';
import '/components/item_documento_widget.dart';
import '/components/item_imagem_widget.dart';
import '/components/item_texto_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'item_mensagem_model.dart';
export 'item_mensagem_model.dart';

class ItemMensagemWidget extends StatefulWidget {
  const ItemMensagemWidget({
    super.key,
    required this.message,
    String? fotoMe,
    String? fotoSender,
  })  : fotoMe = fotoMe ?? '-',
        fotoSender = fotoSender ?? '-';

  final ConversasStruct? message;
  final String fotoMe;
  final String fotoSender;

  @override
  State<ItemMensagemWidget> createState() => _ItemMensagemWidgetState();
}

class _ItemMensagemWidgetState extends State<ItemMensagemWidget> {
  late ItemMensagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemMensagemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (!widget.message!.fromme)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.message?.messagetype == 'conversation')
                  wrapWithModel(
                    model: _model.itemTextoModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemTextoWidget(
                      texto: valueOrDefault<String>(
                        widget.message?.conversation,
                        '-',
                      ),
                      hora: valueOrDefault<String>(
                        dateTimeFormat(
                            "d/M H:mm",
                            dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                              widget.message?.messagetimestamp,
                              0,
                            ))),
                        '-',
                      ),
                      cor: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                if (widget.message?.messagetype == 'audioMessage')
                  wrapWithModel(
                    model: _model.itemAudioModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemAudioWidget(
                      audioURL: valueOrDefault<String>(
                        widget.message?.mediaurl,
                        '-',
                      ),
                      foto: valueOrDefault<String>(
                        widget.fotoSender,
                        '-',
                      ),
                      cor: FlutterFlowTheme.of(context).secondaryBackground,
                      pushName: valueOrDefault<String>(
                        widget.message?.pushname,
                        'Audio',
                      ),
                    ),
                  ),
                if (widget.message?.messagetype == 'imageMessage')
                  wrapWithModel(
                    model: _model.itemImagemModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemImagemWidget(
                      cor: FlutterFlowTheme.of(context).secondaryBackground,
                      message: widget.message!,
                    ),
                  ),
                if (widget.message?.messagetype == 'documentMessage')
                  wrapWithModel(
                    model: _model.itemDocumentoModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemDocumentoWidget(
                      cor: FlutterFlowTheme.of(context).secondaryBackground,
                      message: widget.message!,
                    ),
                  ),
              ],
            ),
          ),
        if (widget.message?.fromme ?? true)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.message?.messagetype == 'conversation')
                  wrapWithModel(
                    model: _model.itemTextoModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemTextoWidget(
                      texto: valueOrDefault<String>(
                        widget.message?.conversation,
                        '-',
                      ),
                      hora: valueOrDefault<String>(
                        dateTimeFormat(
                            "d/M H:mm",
                            dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                              widget.message?.messagetimestamp,
                              0,
                            ))),
                        '-',
                      ),
                      cor: FlutterFlowTheme.of(context).zapVerde,
                    ),
                  ),
                if (widget.message?.messagetype == 'audioMessage')
                  wrapWithModel(
                    model: _model.itemAudioModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemAudioWidget(
                      audioURL: valueOrDefault<String>(
                        widget.message?.mediaurl,
                        '-',
                      ),
                      foto: valueOrDefault<String>(
                        widget.fotoMe,
                        '-',
                      ),
                      cor: FlutterFlowTheme.of(context).zapVerde,
                      pushName: valueOrDefault<String>(
                        widget.message?.pushname,
                        'Audio',
                      ),
                    ),
                  ),
                if (widget.message?.messagetype == 'imageMessage')
                  wrapWithModel(
                    model: _model.itemImagemModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemImagemWidget(
                      cor: FlutterFlowTheme.of(context).zapVerde,
                      message: widget.message!,
                    ),
                  ),
                if (widget.message?.messagetype == 'documentMessage')
                  wrapWithModel(
                    model: _model.itemDocumentoModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ItemDocumentoWidget(
                      cor: FlutterFlowTheme.of(context).zapVerde,
                      message: widget.message!,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
