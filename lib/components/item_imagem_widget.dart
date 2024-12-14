import '/backend/schema/structs/index.dart';
import '/components/imagem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'item_imagem_model.dart';
export 'item_imagem_model.dart';

class ItemImagemWidget extends StatefulWidget {
  const ItemImagemWidget({
    super.key,
    required this.message,
    Color? cor,
  }) : cor = cor ?? const Color(0xFFF0F2F5);

  final ConversasStruct? message;
  final Color cor;

  @override
  State<ItemImagemWidget> createState() => _ItemImagemWidgetState();
}

class _ItemImagemWidgetState extends State<ItemImagemWidget> {
  late ItemImagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemImagemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.taxa = valueOrDefault<double>(
            valueOrDefault<int>(
                      widget.message?.height,
                      250,
                    ) ==
                    0
                ? 250.0
                : valueOrDefault<double>(
                    widget.message?.height.toDouble(),
                    250.0,
                  ),
            250.0,
          ) /
          valueOrDefault<double>(
            valueOrDefault<int>(
                      widget.message?.width,
                      250,
                    ) ==
                    0
                ? 250.0
                : valueOrDefault<double>(
                    widget.message?.width.toDouble(),
                    250.0,
                  ),
            250.0,
          );
      _model.altura = 255 * _model.taxa;
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
    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: ImagemWidget(
                  url: widget.message!.mediaurl,
                ),
              );
            },
          );
        },
        child: Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${widget.message?.mediaurl}',
                    width: 250.0,
                    height: _model.altura > 330.0 ? 330.0 : _model.altura,
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.message?.caption != null &&
                    widget.message?.caption != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
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
        ),
      ),
    );
  }
}
