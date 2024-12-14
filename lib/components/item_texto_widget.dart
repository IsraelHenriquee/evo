import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'item_texto_model.dart';
export 'item_texto_model.dart';

class ItemTextoWidget extends StatefulWidget {
  const ItemTextoWidget({
    super.key,
    String? texto,
    required this.hora,
    Color? cor,
  })  : texto = texto ?? '-',
        cor = cor ?? const Color(0xFFF0F2F5);

  final String texto;
  final String? hora;
  final Color cor;

  @override
  State<ItemTextoWidget> createState() => _ItemTextoWidgetState();
}

class _ItemTextoWidgetState extends State<ItemTextoWidget> {
  late ItemTextoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemTextoModel());

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
      constraints: const BoxConstraints(
        minWidth: 100.0,
        maxWidth: 500.0,
      ),
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
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: MarkdownBody(
                    data: valueOrDefault<String>(
                      widget.texto,
                      'Carregando...',
                    ),
                    selectable: true,
                    onTapLink: (_, url, __) => launchURL(url!),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.hora,
                        '12/12 22:00',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
