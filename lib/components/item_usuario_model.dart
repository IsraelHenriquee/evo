import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_usuario_widget.dart' show ItemUsuarioWidget;
import 'package:flutter/material.dart';

class ItemUsuarioModel extends FlutterFlowModel<ItemUsuarioWidget> {
  ///  Local state fields for this component.

  InstanciaStruct? instancia;
  void updateInstanciaStruct(Function(InstanciaStruct) updateFn) {
    updateFn(instancia ??= InstanciaStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
