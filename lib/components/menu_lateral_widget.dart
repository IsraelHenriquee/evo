import '/components/menu_config_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'menu_lateral_model.dart';
export 'menu_lateral_model.dart';

class MenuLateralWidget extends StatefulWidget {
  const MenuLateralWidget({
    super.key,
    required this.acao,
  });

  final Future Function(int varMenu)? acao;

  @override
  State<MenuLateralWidget> createState() => _MenuLateralWidgetState();
}

class _MenuLateralWidgetState extends State<MenuLateralWidget> {
  late MenuLateralModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuLateralModel());

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
      width: 64.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).zAPcinza,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 18.0, 8.0, 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chat_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await widget.acao?.call(
                      1,
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.track_changes,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await widget.acao?.call(
                      2,
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.person,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await widget.acao?.call(
                      3,
                    );
                  },
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.settings_sharp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showAlignedDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        isGlobal: false,
                        avoidOverflow: false,
                        targetAnchor: const AlignmentDirectional(1.0, -1.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: const AlignmentDirectional(-1.0, 1.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return const Material(
                            color: Colors.transparent,
                            child: MenuConfigWidget(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
