import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'imagem_model.dart';
export 'imagem_model.dart';

class ImagemWidget extends StatefulWidget {
  const ImagemWidget({
    super.key,
    String? url,
  }) : url = url ?? '-';

  final String url;

  @override
  State<ImagemWidget> createState() => _ImagemWidgetState();
}

class _ImagemWidgetState extends State<ImagemWidget> {
  late ImagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagemModel());

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
      width: 500.0,
      height: 700.0,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).alternate,
                icon: Icon(
                  Icons.close_sharp,
                  color: FlutterFlowTheme.of(context).zapBotao,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.url,
              width: 500.0,
              height: 500.0,
              fit: BoxFit.contain,
            ),
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
