import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'item_audio_model.dart';
export 'item_audio_model.dart';

class ItemAudioWidget extends StatefulWidget {
  const ItemAudioWidget({
    super.key,
    String? audioURL,
    String? foto,
    Color? cor,
    String? pushName,
  })  : audioURL = audioURL ?? '-',
        foto = foto ?? '-',
        cor = cor ?? const Color(0xFFF0F2F5),
        pushName = pushName ?? '-';

  final String audioURL;
  final String foto;
  final Color cor;
  final String pushName;

  @override
  State<ItemAudioWidget> createState() => _ItemAudioWidgetState();
}

class _ItemAudioWidgetState extends State<ItemAudioWidget> {
  late ItemAudioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemAudioModel());

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
      width: 336.0,
      height: 80.0,
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
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 56.0,
              height: 56.0,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Container(
                    width: 56.0,
                    height: 56.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      valueOrDefault<String>(
                        valueOrDefault<String>(
                          widget.foto,
                          '-',
                        ),
                        '-',
                      ),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Icon(
                      Icons.mic,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 100.0,
                decoration: const BoxDecoration(),
                child: FlutterFlowAudioPlayer(
                  audio: Audio.network(
                    valueOrDefault<String>(
                      widget.audioURL,
                      '-',
                    ),
                    metas: Metas(
                      title: valueOrDefault<String>(
                        widget.pushName,
                        'Audio',
                      ),
                    ),
                  ),
                  titleTextStyle:
                      FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter Tight',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                  playbackDurationTextStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                  fillColor: const Color(0x00000000),
                  playbackButtonColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                  elevation: 0.0,
                  playInBackground:
                      PlayInBackground.disabledRestoreOnForeground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
