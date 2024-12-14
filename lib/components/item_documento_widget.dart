import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'item_documento_model.dart';
export 'item_documento_model.dart';

class ItemDocumentoWidget extends StatefulWidget {
  const ItemDocumentoWidget({
    super.key,
    required this.message,
    Color? cor,
  }) : cor = cor ?? const Color(0xFFF0F2F5);

  final ConversasStruct? message;
  final Color cor;

  @override
  State<ItemDocumentoWidget> createState() => _ItemDocumentoWidgetState();
}

class _ItemDocumentoWidgetState extends State<ItemDocumentoWidget> {
  late ItemDocumentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemDocumentoModel());

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
      width: 255.0,
      decoration: BoxDecoration(
        color: widget.cor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 68.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.fileDownload,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 35.0,
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.message?.title,
                          'Sem Nome',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await downloadFile(
                          filename: valueOrDefault<String>(
                            widget.message?.title,
                            '-',
                          ),
                          url: valueOrDefault<String>(
                            widget.message?.mediaurl,
                            '-',
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 35.0,
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
            ),
            if (widget.message?.caption != null &&
                widget.message?.caption != '')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: MarkdownBody(
                        data: widget.message!.caption,
                        selectable: true,
                        onTapLink: (_, url, __) => launchURL(url!),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                          "d/M H:mm",
                          dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                            widget.message?.messagetimestamp,
                            0,
                          ))),
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
